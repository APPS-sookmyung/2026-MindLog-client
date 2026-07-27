# 개발 컨벤션
---
## Commit Convention
- feat : 새로운 기능 구현
- fix : 버그 및 오류 수정
- docs : README.md 등 문서 수정
- design : CSS 등 사용자 UI 디자인 변경
- style : 코드 포맷 변경, 세미콜론 누락, 코드 수정이 없는 경우
- move : 프로젝트 파일 및 코드 이동
- remove : 불필요한 코드 및 파일 삭제
- rename : 파일 및 폴더명 변경
- refactoer : 코드 리팩터링
- comment : 필요한 주석 추가 및 변경
- release : 버전 릴리즈
- !hotfix : 급하게 치명적인 버그를 고쳐야 하는 경우
- !Breaking change : 커다란 API 변경의 경우
- test : 테스트 추가, 테스트 리팩터링 (프로덕션 코드 변경 X)
- chore : 빌드 테스트 업데이트, 패키지 매니저 설정하는 경우 (프로덕션 코드 변경 X)

### 커밋 메시지 예시
- `ex) git commit -m "#1 feat: 회원가입 기능 완료"`

## Branch Convention
- main : 출시 가능한 프로덕션 코드를 모아두는 브랜치
- develop : feature 브랜치에서 기능 개발이 끝난 후 다음 버전 개발을 위한 코드를 모아두는 브랜치
- feature : 하나의 기능을 개발하기 위한 브랜치, 기능 개발 완료되면 develop 브랜치로 머지
- fix : 버그 및 에러 수정
- docs : README 문서 수정
- refactor : 코드 리팩터링 (기능 변경 없이 코드만 수정할 때)
- modify : 코드 수정 (기능의 변화가 있을 때)
- chore : gradle 세팅 및 이외의 모든 것

### Branch Naming 예시
- 브랜치 이름/# 이슈 번호-기능 이름 `ex) feature/#1-login`

## Issue Convention
- feat : 기능 추가
- fix : 버그 및 에러 수정
- docs : README 문서 수정
- refactor : 코드 리팩터링 (기능 변경 없이 코드만 수정할 때)
- modify : 코드 수정 (기능의 변화가 있을 때)
- chore : gradle 세팅 및 이외의 모든 것

### Issue Naming 예시
- `ex) feat: user api 구현`

## Git Flow
- 기본적으로 git flow 전략을 이용한다.
- main, develop, feature 3가지 브랜치를 기본으로 한다.
- main → develop → feature 규칙을 따른다.
- 이슈를 사용하는 경우 브랜치 이름: feature/이슈 번호-기능 이름
```
1. Issue를 생성한다.
2. feature Branch를 생성한다.
3. add - commit - push - pull request 과정을 거친다.
4. PR 작성되면 작성자 외의 팀원이 코드 리뷰를 한다.
5. 코드 리뷰가 완료되면 PR 작성자가 develop Branch로 merge한다.
6. merge 작업이 있을 경우, 다른 브랜치에서 작업을 진행 중이던 개발자는 본인 브랜치로 merge 작업을 pull
7. 종료된 Issue와 PR의 label과 project를 관리한다.
```