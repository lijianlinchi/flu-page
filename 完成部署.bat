@echo off
chcp 65001 >nul
echo ========================================
echo 完成 GitHub Pages 部署
echo ========================================
echo.
echo 代码已提交到本地，现在需要推送到 GitHub
echo.
echo 请确认：
echo 1. 仓库地址：https://github.com/Yangyinan/flu-page
echo 2. 仓库已创建且为 Public（公开）
echo.
echo 如果推送时遇到认证问题，请选择以下方式之一：
echo.
echo 【方式一】使用 GitHub Desktop（推荐）
echo   1. 下载安装 GitHub Desktop
echo   2. 打开 GitHub Desktop
echo   3. File → Add Local Repository
echo   4. 选择当前文件夹
echo   5. 点击 Publish repository
echo.
echo 【方式二】使用 Personal Access Token
echo   1. 访问：https://github.com/settings/tokens
echo   2. 生成新 token（勾选 repo 权限）
echo   3. 推送时用户名输入：Yangyinan
echo   4. 密码输入：你的 token
echo.
echo 【方式三】使用 SSH（如果已配置）
echo   运行：git remote set-url origin git@github.com:Yangyinan/flu-page.git
echo   然后：git push -u origin main
echo.
echo ========================================
echo 现在尝试推送...
echo ========================================
echo.
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo ✓ 推送成功！
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
    echo 请检查：
    echo 1. 仓库是否已创建：https://github.com/Yangyinan/flu-page
    echo 2. 仓库名称大小写是否正确（GitHub 对大小写敏感）
    echo 3. 是否已登录 GitHub
    echo 4. 是否有推送权限
    echo.
    echo 建议使用 GitHub Desktop 进行推送
)

pause

