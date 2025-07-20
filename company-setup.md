# 🏢 회사 컴퓨터 완전 자동 설정 가이드

회사 컴퓨터에서 한 번의 Claude 요청으로 모든 설정을 완료하는 가이드입니다.

## 🚀 원클릭 설정: Claude에게 이 문구를 복사해서 요청하세요

```
회사 컴퓨터에서 Git 및 MCP 설정을 완전히 자동화해주세요:

1. Git 사용자 정보 설정:
   - 사용자명: jimp5978
   - 이메일: jimp5978@gmail.com

2. GitHub 인증 설정:
   - PAT: [여기에_GitHub_토큰_입력]
   - credential manager에 저장

3. 저장소 클론 및 설정:
   - https://github.com/jimp5978/DSHI_TY_QC_RAP.git 클론
   - MySQL 설정 가이드 파일 자동으로 열기

4. MCP Git 서버 설정:
   - GitHub 토큰과 함께 git-github MCP 설정
   - 연결 테스트 실행

5. MySQL 설정 준비:
   - mysql-setup-guide.md 파일 내용 표시
   - MySQL 연결 정보 수집 체크리스트 제공

모든 설정 완료 후 MySQL 가이드를 열어서 데이터베이스 연결 정보를 확인할 수 있도록 해주세요.
```

## 📋 준비 작업 (Claude 요청 전)

### 1. 회사 MySQL 정보 미리 확인
다음 정보를 미리 찾아두세요:
- [ ] MySQL 서버 IP/도메인: `_______________`
- [ ] 포트 번호: `_______________` (보통 3306)
- [ ] 사용자명: `_______________`
- [ ] 비밀번호: `_______________`
- [ ] 데이터베이스명: `_______________`

### 2. 네트워크 접근 확인
- [ ] 외부에서 MySQL 서버 접근 가능한지 확인
- [ ] 방화벽 설정 확인
- [ ] VPN 연결 필요 여부 확인

## 🔧 단계별 수동 설정 (자동화 실패 시)

### Step 1: Git 기본 설정
```bash
git config --global user.name "jimp5978"
git config --global user.email "jimp5978@gmail.com"
git config --global credential.helper manager
```

### Step 2: GitHub 인증 설정
```bash
echo "protocol=https
host=github.com
username=jimp5978
password=[GitHub_토큰]" | git credential-manager store
```

### Step 3: 저장소 클론
```bash
git clone https://github.com/jimp5978/DSHI_TY_QC_RAP.git
cd DSHI_TY_QC_RAP
```

### Step 4: MCP Git 서버 설정
```bash
claude mcp add --scope user git-github npx mcp-git -e GITHUB_TOKEN=[GitHub_토큰] -e GITHUB_USERNAME=jimp5978
```

## 🗃️ MySQL 설정 (정보 확인 후)

위에서 미리 확인한 MySQL 정보로 Claude에게 요청:

```
MySQL MCP 서버 연결 정보를 업데이트해주세요:

- 호스트: [확인한 MySQL 서버 주소]
- 포트: [확인한 포트 번호]
- 사용자명: [확인한 사용자명]  
- 비밀번호: [확인한 비밀번호]
- 데이터베이스: [확인한 DB명]

설정 완료 후 연결 테스트를 실행하고, 기본 테이블 목록도 조회해주세요.
```

## ✅ 설정 완료 확인

모든 설정이 완료되면:
1. [ ] Git push/pull 테스트 성공
2. [ ] MySQL 연결 테스트 성공
3. [ ] MCP 서버들 정상 동작 확인
4. [ ] 기본 데이터베이스 작업 테스트

## 🆘 문제 해결

### Git 인증 실패
```bash
git credential-manager erase
# 위 Step 2 다시 실행
```

### MCP 연결 실패
```bash
claude mcp list
claude mcp remove git-github
# Step 4 다시 실행
```

### MySQL 연결 실패
- 네트워크 연결 확인
- 방화벽 설정 확인  
- 사용자명/비밀번호 재확인
- IT 팀에 포트 오픈 요청

---

## 🎯 최종 목표

설정 완료 후 회사에서 집 컴퓨터와 동일하게:
- ✅ GitHub 저장소 push/pull
- ✅ 회사 MySQL 데이터베이스 원격 접근
- ✅ Claude를 통한 모든 Git 및 DB 작업

**성공하면 어디서든 동일한 개발 환경! 🚀**

---
*생성일: 2025-07-20*  
*집에서 설정, 회사에서 실행용*