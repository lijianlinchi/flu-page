# GitHub Pages 部署详细指南

## 方法一：通过 GitHub 网页界面部署（最简单）

### 步骤 1：创建 GitHub 仓库

1. 登录 GitHub（如果没有账号，先注册：https://github.com）
2. 点击右上角的 `+` 号，选择 `New repository`
3. 填写仓库信息：
   - **Repository name**: `flu-page`（或你喜欢的名字）
   - **Description**: 流感信息页面
   - **Visibility**: 选择 `Public`（GitHub Pages 免费版需要公开仓库）
   - **不要**勾选 "Initialize this repository with a README"
4. 点击 `Create repository`

### 步骤 2：上传代码到 GitHub

#### 方式 A：使用 GitHub 网页上传（适合新手）

1. 在新建的仓库页面，点击 `uploading an existing file`
2. 将项目文件夹中的所有文件拖拽到上传区域
3. 在页面底部填写提交信息（如：Initial commit）
4. 点击 `Commit changes`

#### 方式 B：使用 Git 命令行（推荐）

在项目目录打开终端/命令行，执行：

```bash
# 初始化 Git 仓库
git init

# 添加所有文件
git add .

# 提交代码
git commit -m "Initial commit"

# 添加远程仓库（替换 YOUR_USERNAME 和 REPO_NAME）
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git

# 推送到 GitHub
git branch -M main
git push -u origin main
```

**注意：** 如果首次使用，可能需要配置 Git：
```bash
git config --global user.name "你的名字"
git config --global user.email "你的邮箱"
```

### 步骤 3：启用 GitHub Pages

1. 在仓库页面，点击 `Settings`（设置）
2. 在左侧菜单找到 `Pages`（页面）
3. 在 `Source`（源）部分：
   - 选择分支：`main`（或 `master`）
   - 选择文件夹：`/ (root)`（根目录）
4. 点击 `Save`（保存）

### 步骤 4：访问你的网站

等待 1-2 分钟后，你的网站就可以访问了：

**访问地址：**
```
https://YOUR_USERNAME.github.io/REPO_NAME
```

例如：
- 用户名：`zhangsan`
- 仓库名：`flu-page`
- 访问地址：`https://zhangsan.github.io/flu-page`

## 方法二：使用 GitHub Desktop（图形界面，推荐新手）

### 步骤 1：下载安装 GitHub Desktop

1. 访问：https://desktop.github.com
2. 下载并安装 GitHub Desktop
3. 登录你的 GitHub 账号

### 步骤 2：创建并推送仓库

1. 打开 GitHub Desktop
2. 点击 `File` → `Add Local Repository`
3. 选择你的项目文件夹
4. 点击 `Publish repository`
5. 填写仓库名称，选择 `Public`
6. 点击 `Publish Repository`

### 步骤 3：启用 GitHub Pages

按照方法一的步骤 3 操作即可。

## 方法三：使用自定义域名（可选）

如果你想使用自己的域名（如：www.example.com）：

1. 在仓库的 `Settings` → `Pages` 中
2. 在 `Custom domain` 输入你的域名
3. 在你的域名 DNS 设置中添加 CNAME 记录：
   ```
   类型: CNAME
   名称: www（或 @）
   值: YOUR_USERNAME.github.io
   ```

## 常见问题

### Q1: 网站显示 404？
- 确保仓库是 `Public`（公开）
- 确保 `index.html` 在根目录
- 等待几分钟让 GitHub 完成部署

### Q2: 如何更新网站内容？
1. 修改本地文件
2. 提交并推送到 GitHub：
   ```bash
   git add .
   git commit -m "更新内容"
   git push
   ```
3. 等待 1-2 分钟，网站会自动更新

### Q3: 如何查看部署状态？
- 在仓库页面点击 `Actions` 标签
- 可以看到部署历史和状态

### Q4: 支持 HTTPS 吗？
- 是的，GitHub Pages 自动提供 HTTPS
- 访问地址使用 `https://` 开头

### Q5: 有流量限制吗？
- 免费版：每月 100GB 带宽
- 仓库大小限制：1GB
- 对于个人项目通常足够

## 部署检查清单

- [ ] 创建了 GitHub 仓库
- [ ] 代码已推送到 GitHub
- [ ] 仓库设置为 Public
- [ ] 在 Settings → Pages 中启用了 GitHub Pages
- [ ] 选择了正确的分支（main/master）
- [ ] 等待了 1-2 分钟让部署完成
- [ ] 可以访问 `https://用户名.github.io/仓库名`

## 快速命令参考

```bash
# 初始化并推送（首次）
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/用户名/仓库名.git
git push -u origin main

# 更新网站（后续）
git add .
git commit -m "更新说明"
git push
```

---

**提示：** GitHub Pages 完全免费，非常适合个人项目、作品集、文档网站等静态页面部署！

