@echo off
chcp 65001 >nul
echo ========================================
echo 部署到 GitHub Pages (flu-page)
echo ========================================
echo.

REM 添加所有文件
echo [1/4] 添加文件...
git add .
echo ✓ 文件已添加

echo.
echo [2/4] 提交更改...
set /p commit_msg="请输入提交信息（直接回车使用默认）: "
if "%commit_msg%"=="" set commit_msg=Initial commit: 流感信息页面
git commit -m "%commit_msg%"
echo ✓ 更改已提交

echo.
echo [3/4] 设置主分支...
git branch -M main
echo ✓ 主分支已设置

echo.
echo [4/4] 配置远程仓库并推送...
echo.
set /p github_username="请输入你的 GitHub 用户名: "

REM 检查远程仓库是否已存在
git remote get-url origin >nul 2>&1
if %errorlevel% neq 0 (
    echo 添加远程仓库...
    git remote add origin https://github.com/%github_username%/flu-page.git
) else (
    echo 更新远程仓库地址...
    git remote set-url origin https://github.com/%github_username%/flu-page.git
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
    echo 2. 点击 Settings（设置）
    echo 3. 左侧找到 Pages
    echo 4. Source 选择：main 分支，/ (root) 目录
    echo 5. 点击 Save（保存）
    echo 6. 等待 1-2 分钟后访问你的网站：
    echo.
    echo    https://%github_username%.github.io/flu-page
    echo.
    echo ========================================
) else (
    echo.
    echo ⚠️  推送失败，可能的原因：
    echo 1. 仓库地址不正确
    echo 2. 需要先登录 GitHub（使用 GitHub Desktop 或配置 SSH）
    echo 3. 仓库权限问题
    echo.
    echo 如果使用 HTTPS，可能需要输入 GitHub 用户名和 Personal Access Token
    echo 建议使用 GitHub Desktop 或配置 SSH 密钥
)

pause

