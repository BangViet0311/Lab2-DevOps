# setup-dev-env.ps1 - DevOps Lab 2 Automation Script
# Tự động tạo cấu trúc project Node.js + Docker

Write-Host "=== DEVOPS LAB 2 - AUTOMATION SCRIPT ===" -ForegroundColor Cyan
Write-Host ""

$projectName = "devops-lab2-docker"
$projectPath = Join-Path $PWD $projectName

# 1. Tạo thư mục project
if (-not (Test-Path $projectPath)) {
    New-Item -ItemType Directory -Path $projectPath | Out-Null
    Write-Host "✅ Created project folder: $projectName" -ForegroundColor Green
} else {
    Write-Host "⚠️ Folder already exists: $projectName" -ForegroundColor Yellow
}

Set-Location $projectPath

# 2. Tạo package.json
$packageJson = @"
{
  "name": "$projectName",
  "version": "1.0.0",
  "description": "DevOps Lab 2 — Docker Lean Demo",
  "main": "server.js",
  "scripts": {
    "start": "node server.js"
  }
}
"@
$packageJson | Out-File -FilePath "package.json" -Encoding utf8
Write-Host "✅ Created package.json" -ForegroundColor Green

# 3. Tạo server.js
$serverJs = @"
const http = require('http');

const server = http.createServer((req, res) => {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({
        message: 'Hello from Docker!',
        lab: 'DevOps Lab 2 — Lean Principle',
        timestamp: new Date().toISOString(),
        node_version: process.version,
        platform: process.platform,
    }));
});

const PORT = 3000;
server.listen(PORT, () => {
    console.log(` Server running at http://localhost:${PORT}`);
    console.log(`Environment: Node.js ${process.version} on ${process.platform}`);
});
"@
$serverJs | Out-File -FilePath "server.js" -Encoding utf8
Write-Host "✅ Created server.js" -ForegroundColor Green

# 4. Tạo Dockerfile
$dockerfile = @"
# DevOps Lab 2 — Docker Demo
# Sử dụng Node.js official image
FROM node:18-alpine

# Thiết lập thư mục làm việc
WORKDIR /app

# Copy package.json trước (tận dụng Docker cache)
COPY package.json .

# Cài đặt dependencies
RUN npm install

# Copy source code
COPY . .

# Expose port
EXPOSE 3000

# Lệnh chạy ứng dụng
CMD ["node", "server.js"]
"@
$dockerfile | Out-File -FilePath "Dockerfile" -Encoding utf8
Write-Host "✅ Created Dockerfile" -ForegroundColor Green

# 5. Tạo .dockerignore
$dockerignore = @"
node_modules
.git
.gitignore
README.md
*.log
.DS_Store
"@
$dockerignore | Out-File -FilePath ".dockerignore" -Encoding utf8
Write-Host "✅ Created .dockerignore" -ForegroundColor Green

Write-Host ""
Write-Host "=== PROJECT STRUCTURE ===" -ForegroundColor Cyan
Get-ChildItem -Force | ForEach-Object { Write-Host "  $_" }

Write-Host ""
Write-Host "=== NEXT STEPS ===" -ForegroundColor Cyan
Write-Host "1. cd $projectName"
Write-Host "2. docker build -t devops-lab2-app ."
Write-Host "3. docker run -d -p 3000:3000 --name lab2-app devops-lab2-app"
Write-Host "4. curl http://localhost:3000"
Write-Host ""
Write-Host "✅ Automation script completed!" -ForegroundColor Green
