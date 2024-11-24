// ecosystem.config.js

module.exports = {
  apps: [
    // Quality Admin 서비스
    {
      name: 'quality-admin-backend',
      cwd: './quality-admin',
      script: './bin/www',
      env: {
        NODE_ENV: 'production',
        PORT: 3002
      },
    },
    {
      name: 'quality-admin-frontend',
      cwd: './quality-admin',
      script: 'pnpm',
      args: 'run next-start',
      env: {
        NODE_ENV: 'production',
        PORT: 4000
      },
    },
    
    // Quality Admin Web 서비스
    {
      name: 'quality-admin-web-backend',
      cwd: './quality-admin-web',
      script: './bin/www',
      env: {
        NODE_ENV: 'production',
        PORT: 3001
      },
    },
    {
      name: 'quality-admin-web-frontend',
      cwd: './quality-admin-web',
      script: 'pnpm',
      args: 'run next-start',
      env: {
        NODE_ENV: 'production',
        PORT: 1880
      },
    },
    
    // Quality Chatbot 서비스
    {
      name: 'quality-chatbot',
      cwd: './quality-chatbot',
      script: 'pnpm',
      args: 'run start',
      env: {
        NODE_ENV: 'production',
        PORT: 3000
      },
    }
  ]
};