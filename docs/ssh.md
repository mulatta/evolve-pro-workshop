# SSH 설정

SSH(Secure Shell)는 원격 서버에 안전하게 접속하는 방법입니다. SSH 키를 생성하고, 서버 접속 설정을 합니다.

## SSH 키란?

SSH 키는 **개인키**와 **공개키** 한 쌍으로 구성됩니다:

- **개인키** (`id_ed25519`) — 내 컴퓨터에만 보관. 절대 공유하지 않습니다.
- **공개키** (`id_ed25519.pub`) — 서버에 등록. 관리자에게 전달합니다.

비밀번호 없이 자동으로 인증됩니다.

## 접속 구조

```
내 PC → eta (점프 호스트) → psi (GPU 서버)
         jump.sjanglab.org      10.100.0.2
         포트: 10022
```

보안을 위해 GPU 서버(psi)에 직접 접속하지 않고, **점프 호스트(eta)를 경유**합니다.

## 1. SSH 키 생성

터미널에서 다음 명령어를 입력합니다:

```bash
ssh-keygen -t ed25519
```

모든 질문에 ++enter++ 만 누르면 됩니다:

```
Generating public/private ed25519 key pair.
Enter file in which to save the key (/home/user/.ssh/id_ed25519): (Enter)
Enter passphrase (empty for no passphrase): (Enter)
Enter same passphrase again: (Enter)
```

## 2. 공개키 확인

```bash
cat ~/.ssh/id_ed25519.pub
```

다음과 비슷한 출력이 나옵니다:

```
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAA... user@hostname
```

## 3. 관리자에게 전달

출력된 공개키 **전체**를 복사하여 관리자에게 전달합니다.

함께 전달할 정보:

| 항목        | 예시                         |
| ----------- | ---------------------------- |
| 이름        | 홍길동                       |
| 사용자명    | `gildong`                    |
| SSH 공개키  | `ssh-ed25519 AAAA...` (전체) |
| 접근 호스트 | `psi`                        |

!!! info "계정 생성 대기"
    관리자가 서버에 계정을 생성한 후 접속이 가능합니다. 계정이 만들어졌다는 연락을 받은 후 다음 단계를 진행하세요.

## 4. SSH 설정 파일 작성

매번 긴 명령어를 입력하지 않도록 설정 파일을 만듭니다. 이 설정을 하면 `ssh psi` 한 줄로 접속할 수 있습니다.

먼저 소켓 디렉토리를 생성합니다:

```bash
mkdir -p ~/.ssh/sockets
```

그 다음, `~/.ssh/config` 파일을 생성합니다:

```bash
nano ~/.ssh/config
```

아래 내용을 붙여넣으세요. **`본인사용자명`을 관리자에게 받은 사용자명으로 변경**합니다:

```
Host eta psi rho tau
    User 본인사용자명
    Port 10022
    IdentityFile ~/.ssh/id_ed25519
    ControlMaster auto
    ControlPath ~/.ssh/sockets/%r@%h-%p
    ControlPersist 600

Host eta
    HostName jump.sjanglab.org

Host psi
    HostName 10.100.0.2
    ProxyJump eta
```

`nano` 편집기에서 저장하려면:

1. ++ctrl+o++ → ++enter++ (저장)
1. ++ctrl+x++ (종료)

!!! tip "ControlMaster란?"
    첫 연결의 소켓을 10분간 유지합니다. 이후 같은 호스트로의 SSH/SCP/rsync가 재인증 없이 즉시 연결됩니다.

## 5. 접속 테스트

```bash
ssh psi
```

처음 접속 시 호스트 확인 메시지가 나옵니다. `yes`를 입력합니다:

```
The authenticity of host ... can't be established.
ED25519 key fingerprint is SHA256:...
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
```

접속 성공 시:

```
[gildong@psi:~]$
```

## 접속이 안 될 때

| 증상                            | 원인                       | 해결                                                  |
| ------------------------------- | -------------------------- | ----------------------------------------------------- |
| `Connection refused`            | 계정 미생성 또는 포트 오류 | 관리자에게 확인. 포트가 10022인지 확인                |
| `Permission denied (publickey)` | SSH 키 불일치              | `cat ~/.ssh/id_ed25519.pub` 확인 후 재전달            |
| `Connection timed out`          | 네트워크 문제              | 인터넷 연결 확인. `ssh eta`로 점프 호스트 먼저 테스트 |

## 다음 단계

[서버 환경 확인 →](server.md)
