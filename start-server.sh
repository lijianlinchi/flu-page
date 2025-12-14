#!/bin/bash
echo "正在启动本地服务器..."
echo "请在浏览器访问: http://localhost:8000"
echo "按 Ctrl+C 停止服务器"
python3 -m http.server 8000

