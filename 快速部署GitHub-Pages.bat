@echo off
chcp 65001 >nul
echo ========================================
echo GitHub Pages 快速部署
echo ========================================
echo.

REM 检查是否已初始化 Git
if not exist ".git" (
    echo [1/5] 初始化 Git 仓库...
    git init
    echo ✓ Git 仓库已初始化
) else (
    echo [1/5] Git 仓库已存在
)

echo.
echo [2/5] 添加所有文件...
git add .
echo ✓ 文件已添加

echo.
echo [3/5] 提交更改...
set /p commit_msg="请输入提交信息（直接回车使用默认）: "
if "%commit_msg%"=="" set commit_msg=Update files
git commit -m "%commit_msg%"
echo ✓ 更改已提交

echo.
echo [4/5] 检查远程仓库...
git remote -v >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo ⚠️  首次部署需要配置远程仓库
    echo.
    set /p repo_url="请输入你的 GitHub 仓库地址（如：https://github.com/用户名/仓库名.git）: "
    git remote add origin %repo_url%
    git branch -M main
    echo.
    echo 推送到 GitHub...
    git push -u origin main
) else (
    echo ✓ 远程仓库已配置
    echo.
    echo [5/5] 推送到 GitHub...
    git push
)

echo.
echo ========================================
echo ✓ 部署完成！
echo.
echo 接下来请：
echo 1. 访问你的 GitHub 仓库
echo 2. 进入 Settings → Pages
echo 3. Source 选择：main 分支，/ (root) 目录
echo 4. 点击 Save
echo 5. 等待 1-2 分钟后访问你的网站
echo.
echo 网站地址格式：
echo   https://你的用户名.github.io/仓库名
echo ========================================
pause

