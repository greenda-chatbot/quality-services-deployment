# 3000, 88, 3001, 1880, 8000
pid=$(lsof -ti:3000) && sudo kill -9 $pid || echo "No process found on port 3000"
pid=$(lsof -ti:88) && sudo kill -9 $pid || echo "No process found on port 88"
pid=$(lsof -ti:3001) && sudo kill -9 $pid || echo "No process found on port 3001"
pid=$(lsof -ti:3002) && sudo kill -9 $pid || echo "No process found on port 3002"
pid=$(lsof -ti:1880) && sudo kill -9 $pid || echo "No process found on port 1880"
pid=$(lsof -ti:8000) && sudo kill -9 $pid || echo "No process found on port 8000"

