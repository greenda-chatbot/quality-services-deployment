cd ~/app/new/quality-admin
pnpm install
pnpm run prestart

cd ~/app/new/quality-admin-web
pnpm install
pnpm run prestart

cd ~/app/new/quality-chatbot
pnpm install

cd ~/app/new
pm2 delete all
pm2 stop ecosystem.config.js
pm2 start ecosystem.config.js --env production
pm2 logs