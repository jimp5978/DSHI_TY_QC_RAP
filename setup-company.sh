#!/bin/bash

echo "========================================"
echo "회사 컴퓨터 Git 및 MCP 자동 설정 스크립트"
echo "========================================"
echo

# Git 기본 설정
echo "[1/7] Git 사용자 정보 설정 중..."
git config --global user.name "jimp5978"
git config --global user.email "jimp5978@gmail.com"
git config --global credential.helper manager
echo "✓ Git 사용자 정보 설정 완료"

# GitHub 인증 설정
echo
echo "[2/7] GitHub 인증 정보 설정 중..."
echo -e "protocol=https\nhost=github.com\nusername=jimp5978\npassword=[GitHub_토큰]" | git credential-manager store
echo "✓ GitHub 인증 정보 설정 완료"

# 작업 디렉토리 생성
echo
echo "[3/7] 작업 디렉토리 준비 중..."
mkdir -p ~/work
cd ~/work
echo "✓ 작업 디렉토리 준비 완료"

# 저장소 클론
echo
echo "[4/7] GitHub 저장소 클론 중..."
if [ -d "DSHI_TY_QC_RAP" ]; then
    echo "기존 폴더 발견, 업데이트 중..."
    cd DSHI_TY_QC_RAP
    git pull origin master
else
    git clone https://github.com/jimp5978/DSHI_TY_QC_RAP.git
    cd DSHI_TY_QC_RAP
fi
echo "✓ 저장소 클론 완료"

# MCP 설정 안내
echo
echo "[5/7] MCP 서버 설정..."
echo "⚠️  다음 명령어를 Claude에게 요청하세요:"
echo
echo "claude mcp add --scope user git-github npx mcp-git -e GITHUB_TOKEN=[GitHub_토큰] -e GITHUB_USERNAME=jimp5978"
echo

# 가이드 파일 열기
echo "[6/7] MySQL 설정 가이드 확인..."
if [ -f "mysql-setup-guide.md" ]; then
    echo "📖 MySQL 가이드 내용:"
    echo "----------------------------------------"
    cat mysql-setup-guide.md
    echo "----------------------------------------"
    echo "✓ MySQL 가이드 표시 완료"
else
    echo "⚠️  가이드 파일을 찾을 수 없습니다."
fi

echo
echo "[7/7] 설정 완료!"
echo "========================================"
echo "✅ 자동 설정이 완료되었습니다!"
echo
echo "📋 다음 단계:"
echo "1. Claude에게 위의 MCP 명령어 요청"
echo "2. 위의 MySQL 가이드에서 DB 정보 확인"
echo "3. Claude에게 MySQL 연결 설정 요청"
echo
echo "📁 현재 위치: $(pwd)"
echo "========================================"