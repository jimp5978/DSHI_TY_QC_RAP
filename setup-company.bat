@echo off
echo ========================================
echo 회사 컴퓨터 Git 및 MCP 자동 설정 스크립트
echo ========================================
echo.

REM Git 기본 설정
echo [1/7] Git 사용자 정보 설정 중...
git config --global user.name "jimp5978"
git config --global user.email "jimp5978@gmail.com"
git config --global credential.helper manager
echo ✓ Git 사용자 정보 설정 완료

REM GitHub 인증 설정
echo.
echo [2/7] GitHub 인증 정보 설정 중...
echo protocol=https> temp_cred.txt
echo host=github.com>> temp_cred.txt
echo username=jimp5978>> temp_cred.txt
echo password=[GitHub_토큰]>> temp_cred.txt
git credential-manager store < temp_cred.txt
del temp_cred.txt
echo ✓ GitHub 인증 정보 설정 완료

REM 작업 디렉토리 생성
echo.
echo [3/7] 작업 디렉토리 준비 중...
if not exist "C:\work" mkdir C:\work
cd /d C:\work
echo ✓ 작업 디렉토리 준비 완료

REM 저장소 클론
echo.
echo [4/7] GitHub 저장소 클론 중...
if exist "DSHI_TY_QC_RAP" (
    echo 기존 폴더 발견, 업데이트 중...
    cd DSHI_TY_QC_RAP
    git pull origin master
) else (
    git clone https://github.com/jimp5978/DSHI_TY_QC_RAP.git
    cd DSHI_TY_QC_RAP
)
echo ✓ 저장소 클론 완료

REM MCP 설정 (이 부분은 수동으로 Claude에게 요청)
echo.
echo [5/7] MCP 서버 설정...
echo ⚠️  다음 명령어를 Claude에게 요청하세요:
echo.
echo "claude mcp add --scope user git-github npx mcp-git -e GITHUB_TOKEN=[GitHub_토큰] -e GITHUB_USERNAME=jimp5978"
echo.

REM 가이드 파일 열기
echo [6/7] MySQL 설정 가이드 열기...
if exist "mysql-setup-guide.md" (
    start notepad mysql-setup-guide.md
    echo ✓ MySQL 가이드 열림
) else (
    echo ⚠️  가이드 파일을 찾을 수 없습니다.
)

echo.
echo [7/7] 설정 완료!
echo ========================================
echo ✅ 자동 설정이 완료되었습니다!
echo.
echo 📋 다음 단계:
echo 1. Claude에게 위의 MCP 명령어 요청
echo 2. 열린 MySQL 가이드에서 DB 정보 확인
echo 3. Claude에게 MySQL 연결 설정 요청
echo.
echo 📁 현재 위치: %CD%
echo ========================================
pause