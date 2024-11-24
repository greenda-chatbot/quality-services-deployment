# Quality Services Deployment

자가품질검사 서비스 배포를 위한 설정 리포지토리입니다.

## 프로젝트 구조

이 리포지토리는 세 개의 주요 서비스로 구성되어 있습니다:

- `quality-admin`: 관리자 서비스
- `quality-admin-web`: 관리자 웹 인터페이스
- `quality-chatbot`: 챗봇 서비스

## 로컬 설치 및 실행 방법

### Quality Admin

```bash
cd quality-admin
pnpm install
pnpm run prestart
```

실행 옵션:
- 백엔드 서버: `pnpm run start` (포트: 3002)
- 프론트엔드 서버: `pnpm run next-start` (포트: 4000)

### Quality Admin Web

```bash
cd quality-admin-web
pnpm install
pnpm run prestart
```

실행 옵션:
- 백엔드 서버: `pnpm run start` (포트: 3001)
- 프론트엔드 서버: `pnpm run next-start` (포트: 1880)

### Quality Chatbot

```bash
cd quality-chatbot
pnpm install
pnpm run start  # 포트: 3000
```

## Docker 배포

### 사전 요구사항
- Docker
- Docker Compose

### 배포 방법

1. 리포지토리 클론:
```bash
git clone [repository-url]
cd quality-services-deployment
```

2. Docker Compose로 서비스 실행:
```bash
docker-compose up -d
```

### Docker 컨테이너 구성

각 서비스는 독립적인 Docker 컨테이너에서 실행됩니다:

#### Quality Admin Web
- 포트: 3001(백엔드), 1880(프론트엔드)
- 볼륨:
  - 소스코드: `./quality-admin-web:/app`
  - Node 모듈: `/app/node_modules`
  - Next.js 빌드: `/app/.next`

#### Quality Admin
- 포트: 3002(백엔드), 4000(프론트엔드)
- 볼륨:
  - 소스코드: `./quality-admin:/app`
  - Node 모듈: `/app/node_modules`
  - Next.js 빌드: `/app/.next`

#### Quality Chatbot
- 포트: 3000
- 볼륨:
  - 소스코드: `./quality-chatbot:/app`
  - Node 모듈: `/app/node_modules`

모든 서비스는 프로덕션 환경(`NODE_ENV=production`)으로 설정됩니다.

## 포트 정보

| 서비스 | 백엔드 포트 | 프론트엔드 포트 |
|--------|------------|----------------|
| quality-admin | 3002 | 4000 |
| quality-admin-web | 3001 | 1880 |
| quality-chatbot | 3000 | - |

## 기술 스택

- 패키지 매니저: pnpm
- 런타임: Node.js
- 컨테이너화: Docker
- 오케스트레이션: Docker Compose

# TODO
- AWS 3002 포트 열기
- AWS 1880 포트 열기
- AWS 3000 포트 열기

# 진행상황
- COPY package.json pnpm-lock.yaml ./ 추가한 경우 quality-chatbot 동작함, quality-adming-web은 동작함 그러나 quality-admin 동작 안함
- 로컬에서 동작 확인했음
- AWS EC2에서는 인바운드 규칙으로 3002 포트 열어야 이메일 인증 기능이 동작할 것으로 예상함
- .env, docker-compose.yml 파일 localhost에서 13.209.138.233로 수정함 (05:48)
- 알림 메뉴 필터기능 추가 / 수정 기능 추가
