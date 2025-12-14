@echo off
chcp 65001 >nul
echo ========================================
echo 测试仓库连接并推送
echo ========================================
echo.

echo 当前远程仓库配置：
git remote -v
echo.

echo 请确认以下信息：
echo 1. 仓库完整地址：https://github.com/Yangyinan/flu-page
echo 2. 仓库是否为 Public（公开）
echo 3. 你是否有推送权限
echo.
pause

echo.
echo 尝试推送代码...
echo.
echo 如果提示需要认证：
echo   - 用户名：Yangyinan
echo   - 密码：使用 Personal Access Token
echo     生成地址：https://github.com/settings/tokens
echo.
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo ✓ 推送成功！
    echo.
    echo 接下来请：
    echo 1. 访问: https://github.com/Yangyinan/flu-page
    echo 2. 点击 Settings → Pages
    echo 3. Source 选择：main 分支，/ (root) 目录
    echo 4. 点击 Save
    echo 5. 等待 1-2 分钟后访问：
    echo    https://Yangyinan.github.io/flu-page
    echo ========================================
) else (
    echo.
    echo ⚠️  推送失败
    echo.
    echo 可能的原因：
    echo 1. 仓库名称或用户名不正确（GitHub 对大小写敏感）
    echo 2. 需要身份验证（使用 Personal Access Token）
    echo 3. 仓库不存在或没有权限
    echo.
    echo 解决方案：
    echo 【方案一】使用 GitHub Desktop
    echo   下载：https://desktop.github.com/
    echo   打开后添加本地仓库并推送
    echo.
    echo 【方案二】生成 Personal Access Token
    echo   1. 访问：https://github.com/settings/tokens
    echo   2. Generate new token (classic)
    echo   3. 勾选 repo 权限
    echo   4. 生成后复制 token
    echo   5. 推送时密码输入 token
    echo.
    echo 【方案三】检查仓库地址
    echo   请确认仓库的完整 URL 是否正确
    echo   可以在浏览器中打开仓库，复制地址栏的 URL
)

pause

