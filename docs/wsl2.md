# WSL2 설치

!!! info "macOS/Linux 사용자"
    이 페이지는 **Windows 사용자만** 해당합니다. macOS나 Linux를 사용하고 있다면 [SSH 설정](ssh.md)으로 건너뛰세요.

WSL2(Windows Subsystem for Linux)를 설치하면 Windows에서 Linux 터미널을 사용할 수 있습니다.

## 1. PowerShell 관리자 권한으로 실행

1. 시작 메뉴에서 **PowerShell** 검색
2. **마우스 우클릭** → "관리자 권한으로 실행"

## 2. WSL 설치

```powershell
wsl --install
```

이 명령어가 Ubuntu를 자동으로 설치합니다. 완료되면 **PC를 재부팅**하세요.

## 3. Ubuntu 초기 설정

재부팅 후 시작 메뉴에서 **Ubuntu**를 실행합니다.

```
Enter new UNIX username: (원하는 사용자명 입력)
New password: (비밀번호 입력)
Retype new password: (비밀번호 재입력)
```

!!! warning "비밀번호 입력 시 화면에 아무것도 표시되지 않습니다"
    이것은 정상입니다. 타이핑 후 Enter를 누르세요.

## 4. 터미널 기본 명령어

앞으로 자주 사용할 명령어입니다.

| 명령어 | 설명 | 예시 |
|--------|------|------|
| `ls` | 파일 목록 | `ls` |
| `cd` | 디렉토리 이동 | `cd Documents` |
| `cd ..` | 상위 디렉토리로 이동 | `cd ..` |
| `cd ~` | 홈 디렉토리로 이동 | `cd ~` |
| `pwd` | 현재 위치 확인 | `pwd` |
| `mkdir` | 디렉토리 생성 | `mkdir my_project` |
| `cat` | 파일 내용 보기 | `cat README.md` |
| `cp` | 파일 복사 | `cp file1.txt file2.txt` |

!!! tip "유용한 단축키"
    - ++arrow-up++ : 이전 명령어 불러오기
    - ++tab++ : 파일명 자동완성

## 다음 단계

[SSH 설정 →](ssh.md)
