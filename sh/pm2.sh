pm2 start ecosystem.config.js --env production

pm2 list                    # 실행 중인 모든 프로세스 확인
pm2 logs                    # 모든 로그 확인
pm2 logs [app-name]         # 특정 앱의 로그만 확인
pm2 stop all               # 모든 프로세스 중지
pm2 restart all            # 모든 프로세스 재시작
pm2 delete all             # 모든 프로세스 삭제