@echo off
chcp 65001 >nul
echo ========================================
echo GitHub Pages 首次部署向导
echo ========================================
echo.

echo 请按照以下步骤操作：
echo.
echo 步骤 1: 在 GitHub 上创建新仓库
echo   - 访问 https://github.com/new
echo   - 填写仓库名称（如：flu-page）
echo   - 选择 Public（公开）
echo   - 不要勾选 README、.gitignore、license
echo   - 点击 Create repository
echo.
pause

echo.
echo 步骤 2: 配置 Git（如果还没配置）
echo.
set /p git_name="请输入你的名字: "
set /p git_email="请输入你的邮箱: "
git config --global user.name "%git_name%"
git config --global user.email "%git_email%"
echo ✓ Git 配置完成
echo.

echo 步骤 3: 初始化并推送代码
echo.
set /p repo_url="请输入你的仓库地址（如：https://github.com/用户名/仓库名.git）: "

if not exist ".git" (
    echo 初始化 Git 仓库...
    git init
)

echo 添加文件...
git add .

echo.
set /p commit_msg="请输入提交信息（直接回车使用默认）: "
if "%commit_msg%"=="" set commit_msg=Initial commit
git commit -m "%commit_msg%"

echo.
echo 设置主分支...
git branch -M main

echo.
echo 添加远程仓库...
git remote add origin %repo_url%

echo.
echo 推送到 GitHub...
git push -u origin main

echo.
echo ========================================
echo ✓ 代码已推送到 GitHub！
echo.
echo 接下来请：
echo 1. 访问你的仓库：%repo_url%
echo 2. 点击 Settings（设置）
echo 3. 在左侧找到 Pages
echo 4. Source 选择：main 分支，/ (root) 目录
echo 5. 点击 Save
echo 6. 等待 1-2 分钟后访问你的网站
echo.
echo 网站地址格式：
echo   https://你的用户名.github.io/仓库名
echo ========================================
pause

