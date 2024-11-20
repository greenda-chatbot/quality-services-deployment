# 로그 파일 경로 설정
LOG_FILE="./deployment.log"

# 로그 함수 정의: 콘솔과 파일에 동시에 로그 출력
log() {
    local message="[$(date '+%Y-%m-%d %H:%M:%S')] $1"
    echo "$message"
    echo "$message" >> "$LOG_FILE"
}

START_TIME=$(date +%s.%N)
log "스크립트 시작"

SSH_HOST="food-safety"
REMOTE_DIR="~/app/new"
PORT="4000"
log "변수 설정 완료"
# 현재 디렉토리 저장
CURRENT_DIR=$(pwd)
log "현재 디렉토리: $CURRENT_DIR"

cd /Users/icheolhui/Mirror/Github/B2G/new

log "프로젝트 파일 복사 시작"
SSH_PASS=''
# sshpass -p "$SSH_PASS" rsync -avz ./ $SSH_HOST:$REMOTE_DIR --exclude qdrant_storage --exclude .git
sshpass -p "$SSH_PASS" rsync -avz ./ $SSH_HOST:$REMOTE_DIR --exclude .git --exclude .next --exclude node_modules
log "프로젝트 파일 복사 완료"

log "AWS 서버에 SSH 접속 시작"
sshpass -p "$SSH_PASS" ssh $SSH_HOST << EOF
    cd $REMOTE_DIR

    # sudo rsync -avz ./default.conf /etc/nginx/conf.d/default.conf
    # sudo nginx -s reload

    # log() {
    #     echo "[$(date '+%Y-%m-%d %H:%M:%S')] \$1"
    # }
    
    # log "원격 서버 작업 시작"
    
    # log "env에서 환경변수 가져오기" 
    # source .env
    # log "환경변수 가져오기 완료"

    # log "원격 서버에서 ${PORT} 포트의 프로세스 종료 시도"

    # log "원격 서버에서 ${PORT} 포트의 프로세스 종료 완료"

    # docker compose up -d --build
    # rm -rf node_modules
    # rm -rf .next
    # pnpm install 
    # pnpm run build
    # log "Go 애플리케이션 실행 시작"
    # sudo fuser -k 4000/tcp 2>/dev/null
    # nohup pnpm run start > logs/server.log 2>&1 &

    # sudo fuser -k 3000/tcp 2>/dev/null
    # nohup pnpm run backend > logs/server.log 2>&1 &
    # log "docker compose up -d"
    # tail -f logs/server.log   
    log "[start] docker system prune -f"
    docker system prune -f
    log "[end] docker system prune -f"    

    log "[start] docker-compose up -d --build"
    docker-compose up -d --build
    log "[end] docker-compose up -d --build"
    docker-compose logs -f
    # log "원격 서버 작업 완료"
EOF
log "AWS 서버 SSH 접속 및 작업 완료"

END_TIME=$(date +%s.%N)
EXECUTION_TIME=$(echo "$END_TIME - $START_TIME" | bc)
log "스크립트 실행 완료. 총 실행 시간: $(printf "%.3f" $EXECUTION_TIME) 초"


# 현재 디렉토리로 복귀
cd $CURRENT_DIR

# rsync $SSH_HOST:/etc/nginx/nginx.conf ./

# 52.78.173.111