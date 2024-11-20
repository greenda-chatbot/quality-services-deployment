# 3000, 88, 3001, 1880, 8000
kill -9 $(lsof -t -i:3000) 2>/dev/null || echo "No process found on port 3000"
kill -9 $(lsof -t -i:88) 2>/dev/null || echo "No process found on port 88"
kill -9 $(lsof -t -i:3001) 2>/dev/null || echo "No process found on port 3001"
kill -9 $(lsof -t -i:3002) 2>/dev/null || echo "No process found on port 3002"
kill -9 $(lsof -t -i:1880) 2>/dev/null || echo "No process found on port 1880"
kill -9 $(lsof -t -i:8000) 2>/dev/null || echo "No process found on port 8000"

