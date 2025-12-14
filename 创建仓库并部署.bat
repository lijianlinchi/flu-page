@echo off
chcp 65001 >nul
echo ========================================
echo 创建 GitHub 仓库并部署
echo ========================================
echo.
echo 检测到仓库不存在，需要先创建仓库
echo.
echo 请按照以下步骤操作：
echo.
echo 【步骤 1】创建 GitHub 仓库
echo   1. 访问：https://github.com/new
echo   2. Repository name（仓库名）：flu-page
echo   3. 选择 Public（公开）
echo   4. 不要勾选 README、.gitignore、license
echo   5. 点击 Create repository（创建仓库）
echo.
echo 【步骤 2】创建完成后，按任意键继续部署...
pause
echo.
echo ========================================
echo 开始部署代码...
echo ========================================
echo.

REM 检查远程仓库
git remote get-url origin >nul 2>&1
if %errorlevel% neq 0 (
    echo 添加远程仓库...
    git remote add origin https://github.com/Yangyinan/flu-page.git
) else (
    echo 更新远程仓库地址...
    git remote set-url origin https://github.com/Yangyinan/flu-page.git
)

echo.
echo 检查本地提交...
git log --oneline -1 >nul 2>&1
if %errorlevel% neq 0 (
    echo 提交代码到本地...
    git add .
    git commit -m "Initial commit: 流感信息页面"
)

echo.
echo 设置主分支...
git branch -M main

echo.
echo 推送到 GitHub...
echo 注意：如果提示输入用户名和密码
echo   - 用户名：Yangyinan
echo   - 密码：使用 Personal Access Token（不是 GitHub 密码）
echo.
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo ✓ 代码推送成功！
    echo.
    echo 接下来请：
    echo 1. 访问: https://github.com/Yangyinan/flu-page
    echo 2. 点击 Settings（设置）
    echo 3. 左侧找到 Pages
    echo 4. Source 选择：main 分支，/ (root) 目录
    echo 5. 点击 Save（保存）
    echo 6. 等待 1-2 分钟后访问：
    echo.
    echo    https://Yangyinan.github.io/flu-page
    echo.
    echo ========================================
) else (
    echo.
    echo ⚠️  推送失败
    echo.
    echo 如果提示需要认证，请：
    echo 1. 访问：https://github.com/settings/tokens
    echo 2. 生成新 token（勾选 repo 权限）
    echo 3. 推送时密码输入 token
    echo.
    echo 或者使用 GitHub Desktop：
    echo 1. 下载：https://desktop.github.com/
    echo 2. 打开 GitHub Desktop
    echo 3. File → Add Local Repository
    echo 4. 选择当前文件夹
    echo 5. 点击 Publish repository
)

pause

