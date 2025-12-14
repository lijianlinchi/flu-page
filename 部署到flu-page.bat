@echo off
chcp 65001 >nul
echo ========================================
echo 部署到 GitHub Pages (flu-page)
echo ========================================
echo.

REM 检查 Git 配置
git config user.name >nul 2>&1
if %errorlevel% neq 0 (
    echo 首次使用，需要配置 Git...
    echo.
    set /p git_name="请输入你的名字: "
    set /p git_email="请输入你的邮箱: "
    git config --global user.name "%git_name%"
    git config --global user.email "%git_email%"
    echo ✓ Git 配置完成
    echo.
)

REM 检查是否已初始化
if not exist ".git" (
    echo 初始化 Git 仓库...
    git init
)

echo.
echo 添加所有文件...
git add .
echo ✓ 文件已添加

echo.
echo 提交更改...
set /p commit_msg="请输入提交信息（直接回车使用默认）: "
if "%commit_msg%"=="" set commit_msg=Initial commit
git commit -m "%commit_msg%"
echo ✓ 更改已提交

echo.
echo 设置主分支...
git branch -M main

echo.
echo 检查远程仓库...
git remote get-url origin >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo 需要添加远程仓库地址
    echo.
    set /p github_username="请输入你的 GitHub 用户名: "
    set repo_url=https://github.com/%github_username%/flu-page.git
    echo.
    echo 添加远程仓库: %repo_url%
    git remote add origin %repo_url%
    echo ✓ 远程仓库已添加
) else (
    echo ✓ 远程仓库已配置
)

echo.
echo 推送到 GitHub...
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo ✓ 部署成功！
    echo.
    echo 接下来请：
    echo 1. 访问: https://github.com/%github_username%/flu-page
    echo 2. 点击 Settings → Pages
    echo 3. Source 选择：main 分支，/ (root) 目录
    echo 4. 点击 Save
    echo 5. 等待 1-2 分钟后访问你的网站：
    echo    https://%github_username%.github.io/flu-page
    echo ========================================
) else (
    echo.
    echo ⚠️  推送失败，请检查：
    echo 1. 仓库地址是否正确
    echo 2. 是否已登录 GitHub
    echo 3. 是否有推送权限
)

pause

