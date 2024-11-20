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
- 개발 서버: `pnpm run start` (포트: 3002)
- 프로덕션 서버: `pnpm run next-start` (포트: 4000)

### Quality Admin Web

```bash
cd quality-admin-web
pnpm install
pnpm run prestart
```

실행 옵션:
- 개발 서버: `pnpm run start` (포트: 3001)
- 프로덕션 서버: `pnpm run next-start` (포트: 1880)

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
- 포트: 3001(개발), 1880(프로덕션)
- 볼륨:
  - 소스코드: `./quality-admin-web:/app`
  - Node 모듈: `/app/node_modules`
  - Next.js 빌드: `/app/.next`

#### Quality Admin
- 포트: 3002(개발), 4000(프로덕션)
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

| 서비스 | 개발 포트 | 프로덕션 포트 |
|--------|-----------|---------------|
| quality-admin | 3002 | 4000 |
| quality-admin-web | 3001 | 1880 |
| quality-chatbot | 3000 | - |

## 기술 스택

- 패키지 매니저: pnpm
- 런타임: Node.js
- 컨테이너화: Docker
- 오케스트레이션: Docker Compose