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
# sshpass -p "$SSH_PASS" rsync -avz ./ $SSH_HOST:$REMOTE_DIR --exclude .git 
sshpass -p "$SSH_PASS" rsync -avz ./ $SSH_HOST:$REMOTE_DIR --exclude .git --exclude .next --exclude node_modules
log "프로젝트 파일 복사 완료"

log "AWS 서버에 SSH 접속 시작"
sshpass -p "$SSH_PASS" ssh $SSH_HOST << EOF
    cd $REMOTE_DIR

    cd ~/app/new/quality-admin
    pnpm install
    pnpm run prestart

    cd ~/app/new/quality-admin-web
    pnpm install
    pnpm run prestart

    cd ~/app/new/quality-chatbot
    pnpm install

    cd ~/app/new
    pm2 restart all
    pm2 logs

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