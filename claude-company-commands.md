# 🤖 회사에서 Claude에게 요청할 완전 자동화 명령어

## 🎯 메인 명령어: 모든 설정 한 번에 완료

**회사 컴퓨터에서 Claude에게 이 전체 문구를 복사해서 요청하세요:**

---

```
회사 컴퓨터 완전 자동 설정을 진행해주세요. 다음 순서로 모든 작업을 완료해주세요:

=== 1단계: Git 기본 설정 ===
git config --global user.name "jimp5978"
git config --global user.email "jimp5978@gmail.com"  
git config --global credential.helper manager

=== 2단계: GitHub 인증 설정 ===
echo "protocol=https
host=github.com
username=jimp5978
password=[GitHub_토큰]" | git credential-manager store

=== 3단계: 작업 디렉토리 생성 및 저장소 클론 ===
mkdir C:\work 2>nul || echo "Directory exists"
cd C:\work
git clone https://github.com/jimp5978/DSHI_TY_QC_RAP.git
cd DSHI_TY_QC_RAP

=== 4단계: MCP Git 서버 설정 ===
claude mcp remove git-simple -s user 2>nul || echo "Not found"
claude mcp remove git-simple -s local 2>nul || echo "Not found"  
claude mcp add --scope user git-github npx mcp-git -e GITHUB_TOKEN=[GitHub_토큰] -e GITHUB_USERNAME=jimp5978

=== 5단계: 설정 확인 및 테스트 ===
claude mcp list
git status
git pull origin master

=== 6단계: MySQL 가이드 표시 ===
mysql-setup-guide.md 파일의 전체 내용을 표시해주세요.

=== 7단계: 다음 단계 안내 ===
설정 완료 후 다음 안내를 해주세요:
"✅ 회사 컴퓨터 설정이 완료되었습니다! 이제 mysql-setup-guide.md를 참고하여 회사 MySQL 서버 정보를 확인하고 연결 설정을 진행하세요."

모든 단계를 순서대로 실행하고 각 단계의 결과를 보고해주세요.
```

---

## 🔄 MySQL 설정 추가 명령어 (DB 정보 확인 후)

```
회사 MySQL 데이터베이스 연결을 설정해주세요:

1. 기존 MySQL MCP 제거:
claude mcp remove mcp_mysql

2. 새로운 MySQL 연결 정보로 설정:
claude mcp add --scope user mcp_mysql npx @benborla29/mcp-server-mysql -e MYSQL_HOST=[DB서버주소] -e MYSQL_USER=[사용자명] -e MYSQL_PASSWORD=[비밀번호] -e MYSQL_DATABASE=[DB명] -e MYSQL_PORT=[포트번호]

3. 연결 테스트:
디버그 모드로 MySQL MCP 연결 상태를 확인하고, 기본 데이터베이스 정보 조회를 시도해주세요.

※ 실제 DB 정보를 위 [대괄호] 부분에 입력해서 요청하세요.
```

## 🆘 개별 문제 해결 명령어

### Git 인증 문제
```
Git 인증을 다시 설정해주세요:
git credential-manager erase
echo "protocol=https
host=github.com  
username=jimp5978
password=[GitHub_토큰]" | git credential-manager store
```

### MCP 연결 문제
```
MCP Git 서버를 재설정해주세요:
claude mcp remove git-github -s user
claude mcp add --scope user git-github cmd.exe -a "/c" -a "npx" -a "-y" -a "mcp-git" -e GITHUB_TOKEN=[GitHub_토큰] -e GITHUB_USERNAME=jimp5978
```

### 파일 열기
```
MySQL 설정 가이드 파일을 열어서 내용을 모두 표시해주세요:
C:\work\DSHI_TY_QC_RAP\mysql-setup-guide.md
```

## ✅ 성공 확인 체크리스트

설정 완료 후 Claude에게 확인 요청:
```
다음 항목들이 정상 작동하는지 확인해주세요:
1. git status 실행
2. git pull origin master 실행  
3. claude mcp list 확인
4. GitHub 인증 테스트 (간단한 커밋 및 푸시)
5. MySQL MCP 연결 상태 확인
```

---

## 📝 사용 팁

1. **복사 시 주의**: 전체 명령어를 정확히 복사
2. **순서 중요**: 단계별로 순차 실행 필요
3. **에러 발생 시**: 개별 문제 해결 명령어 사용
4. **MySQL 정보**: 미리 확인해두면 더 빠른 설정 가능

**목표: 회사에서 10분 안에 모든 설정 완료! ⚡**

---
*집에서 미리 준비한 자동화 명령어*  
*회사에서 복사 붙여넣기만 하면 완료*