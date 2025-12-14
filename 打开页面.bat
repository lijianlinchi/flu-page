@echo off
chcp 65001 >nul
echo 正在打开页面...
echo.
echo 如果浏览器没有自动打开，请手动访问：
echo http://localhost:8000/index首页.html
echo.
start http://localhost:8000/index首页.html
pause

