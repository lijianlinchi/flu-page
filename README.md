# 前端页面访问指南

## 方法一：使用本地开发服务器（推荐用于开发）

### 1. 使用 Python 内置服务器（最简单）

**Python 3:**
```bash
# 在项目目录下运行
python -m http.server 8000
```

**Python 2:**
```bash
python -m SimpleHTTPServer 8000
```

然后在浏览器访问：`http://localhost:8000`

### 2. 使用 Node.js 的 http-server

首先安装：
```bash
npm install -g http-server
```

然后运行：
```bash
http-server -p 8000
```

访问：`http://localhost:8000`

### 3. 使用 VS Code 的 Live Server 插件

1. 在 VS Code 中安装 "Live Server" 插件
2. 右键点击 `index.html` 文件
3. 选择 "Open with Live Server"

## 方法二：部署到本地 Web 服务器

### 使用 Nginx

1. 下载安装 Nginx
2. 将项目文件复制到 Nginx 的 `html` 目录（或配置自定义目录）
3. 启动 Nginx 服务
4. 访问：`http://localhost`

### 使用 Apache

1. 安装 Apache
2. 将项目文件放到 `htdocs` 目录
3. 启动 Apache 服务
4. 访问：`http://localhost`

## 方法三：部署到云平台（推荐用于生产环境）

### 1. GitHub Pages（免费）⭐ 详细指南

**📖 完整部署教程请查看：`GitHub-Pages部署指南.md`**

快速步骤：
1. 创建 GitHub 仓库（设置为 Public）
2. 推送代码到 GitHub
3. 在仓库 Settings → Pages 中启用
4. 访问：`https://你的用户名.github.io/仓库名`

### 2. Vercel（免费，推荐）

1. 安装 Vercel CLI：`npm i -g vercel`
2. 在项目目录运行：`vercel`
3. 按提示操作，自动部署
4. 获得一个免费的 `vercel.app` 域名

### 3. Netlify（免费）

1. 访问 netlify.com
2. 拖拽项目文件夹到 Netlify 界面
3. 自动部署并获得免费域名

### 4. 腾讯云/阿里云等云服务器

1. 购买云服务器
2. 安装 Nginx 或 Apache
3. 上传项目文件
4. 配置域名和 SSL 证书（HTTPS）

## 方法四：局域网内访问

如果想在同一局域网内的其他设备访问：

1. 使用上述任一本地服务器方法
2. 找到本机 IP 地址：
   - Windows: `ipconfig` 查看 IPv4 地址
   - Mac/Linux: `ifconfig` 查看 IP 地址
3. 在其他设备浏览器访问：`http://你的IP地址:8000`

**注意：** 确保防火墙允许该端口访问

## 快速开始

最简单的方式（如果已安装 Python）：

```bash
# 在项目目录运行
python -m http.server 8000
```

然后打开浏览器访问：`http://localhost:8000`

