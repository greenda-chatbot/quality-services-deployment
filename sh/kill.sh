# 3000, 88, 3001, 1880, 8000
sudo kill $(sudo lsof -t -i:3000)
sudo kill $(sudo lsof -t -i:88)
sudo kill $(sudo lsof -t -i:3001)
sudo kill $(sudo lsof -t -i:3002)
sudo kill $(sudo lsof -t -i:1880)
sudo kill $(sudo lsof -t -i:8000)