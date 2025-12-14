# 部署到 GitHub Pages 完整指南

## 当前状态
- ✅ 代码已提交到本地 Git 仓库
- ❌ GitHub 仓库还未创建（访问 404）

## 部署步骤

### 第一步：创建 GitHub 仓库

1. 访问：https://github.com/new
2. **Repository name（仓库名）**：`flu-page`（必须完全一致，注意大小写）
3. **Description（描述）**：可选，如"流感信息页面"
4. **Visibility（可见性）**：选择 **Public（公开）**（GitHub Pages 免费版需要公开仓库）
5. **不要勾选**：
   - ❌ Add a README file
   - ❌ Add .gitignore
   - ❌ Choose a license
6. 点击 **Create repository（创建仓库）**

### 第二步：推送代码

#### 方法一：使用 GitHub Desktop（最简单，推荐）

1. 下载安装：https://desktop.github.com/
2. 打开 GitHub Desktop
3. **File → Add Local Repository**
4. 选择文件夹：`D:\项目开发类\流感页面`
5. 点击 **Publish repository**
   - Repository name: `flu-page`
   - 勾选 **Keep this code private** 的**反选**（即设为公开）
6. 点击 **Publish repository** 按钮

#### 方法二：使用命令行 + Personal Access Token

1. **生成 Token**：
   - 访问：https://github.com/settings/tokens
   - 点击 **Generate new token (classic)**
   - Note（备注）：`flu-page-deploy`
   - 勾选 **repo** 权限
   - 点击 **Generate token**
   - **复制 token**（只显示一次，请保存）

2. **推送代码**：
   ```bash
   git push -u origin main
   ```
   - Username（用户名）：`Yangyinan`
   - Password（密码）：**粘贴刚才复制的 token**（不是 GitHub 密码）

### 第三步：启用 GitHub Pages

1. 访问：https://github.com/Yangyinan/flu-page
2. 点击 **Settings（设置）**
3. 左侧菜单找到 **Pages**
4. **Source（源）**：
   - Branch（分支）：选择 `main`
   - Folder（文件夹）：选择 `/ (root)`
5. 点击 **Save（保存）**

### 第四步：访问网站

等待 1-2 分钟后，访问：
```
https://Yangyinan.github.io/flu-page
```

## 常见问题

### Q: 推送时提示 "Repository not found"
**A:** 检查：
- 仓库是否已创建：https://github.com/Yangyinan/flu-page
- 仓库名称是否正确（大小写敏感）
- 是否有推送权限

### Q: 推送时提示需要认证
**A:** GitHub 已不支持密码登录，需要使用：
- Personal Access Token（见方法二）
- 或使用 GitHub Desktop

### Q: GitHub Pages 显示 404
**A:** 检查：
- Settings → Pages 是否已配置
- Source 是否选择了 `main` 分支和 `/ (root)` 目录
- 是否等待了 1-2 分钟让 GitHub 构建

### Q: 网站可以访问但页面空白
**A:** 检查：
- `index.html` 文件是否在根目录
- 浏览器控制台是否有错误
- 资源路径是否正确（相对路径）

## 快速脚本

运行 `创建仓库并部署.bat` 可以自动完成部分步骤。

