@echo off
chcp 65001 >nul
echo ========================================
echo GitHub Pages 部署助手
echo ========================================
echo.

REM 检查是否已初始化 Git
if not exist ".git" (
    echo [1/4] 初始化 Git 仓库...
    git init
    echo ✓ Git 仓库已初始化
) else (
    echo [1/4] Git 仓库已存在
)

echo.
echo [2/4] 添加文件到 Git...
git add .
echo ✓ 文件已添加

echo.
echo [3/4] 提交更改...
set /p commit_msg="请输入提交信息（直接回车使用默认）: "
if "%commit_msg%"=="" set commit_msg=Update files
git commit -m "%commit_msg%"
echo ✓ 更改已提交

echo.
echo [4/4] 推送到 GitHub...
echo.
echo ⚠️  如果是首次推送，请先执行以下命令：
echo    git remote add origin https://github.com/你的用户名/仓库名.git
echo    git branch -M main
echo    git push -u origin main
echo.
echo 如果已配置远程仓库，按任意键继续推送...
pause >nul

git push

echo.
echo ========================================
echo ✓ 部署完成！
echo.
echo 接下来请：
echo 1. 访问你的 GitHub 仓库
echo 2. 进入 Settings → Pages
echo 3. 选择分支 main 和 / (root)
echo 4. 保存后等待 1-2 分钟
echo 5. 访问：https://你的用户名.github.io/仓库名
echo ========================================
pause

