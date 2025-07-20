# Claude Code MCP 설정 가이드

이 저장소는 Claude Code에서 MCP(Model Context Protocol) 서버들을 설정하고 관리하기 위한 가이드를 포함합니다.

## 📁 파일 목록

### [mysql-setup-guide.md](./mysql-setup-guide.md)
회사 MySQL 데이터베이스 연결을 위한 완전한 설정 가이드
- 회사에서 확인해야 할 MySQL 정보 체크리스트
- Claude에게 요청할 정확한 명령어 템플릿
- 보안 고려사항 및 문제 해결 방법

## 🚀 사용 방법

1. **회사에서**: `mysql-setup-guide.md` 파일을 열어 MySQL 정보 수집
2. **Claude에게**: 가이드의 명령어 템플릿을 복사해서 요청
3. **집에서**: 설정된 MySQL MCP로 원격 데이터베이스 작업

## ⚙️ 현재 설치된 MCP 서버

- ✅ **git-github**: GitHub 연동 (인증 완료)
- ✅ **mcp_mysql**: MySQL 연결 (회사 DB 정보 필요)
- ✅ **mcp-scan**: 보안 스캐너
- ✅ **mcp-installer**: MCP 서버 설치 도구

## 📝 업데이트 로그

- **2025-07-20**: 초기 설정 및 MySQL 가이드 생성
- Git/GitHub 인증 설정 완료
- Windows 환경 최적화 완료

---
*생성일: 2025-07-20*  
*Claude Code Assistant로 생성됨*