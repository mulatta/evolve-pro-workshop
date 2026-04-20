# 트러블슈팅

## SSH 접속 문제

| 증상                            | 원인                       | 해결                                                             |
| ------------------------------- | -------------------------- | ---------------------------------------------------------------- |
| `Connection refused`            | 계정 미생성 또는 포트 오류 | 관리자에게 확인. `~/.ssh/config`에서 포트가 10022인지 확인       |
| `Permission denied (publickey)` | SSH 키 불일치              | `cat ~/.ssh/id_ed25519.pub`으로 공개키 확인 후 관리자에게 재전달 |
| `Connection timed out`          | 네트워크 문제              | 인터넷 연결 확인. `ssh eta`로 점프 호스트 먼저 테스트            |
| `Host key verification failed`  | 서버 키 변경됨             | `ssh-keygen -R jump.sjanglab.org`으로 기존 키 제거 후 재접속     |

### 단계별 디버깅

점프 호스트부터 순서대로 테스트합니다:

```bash
# 1단계: 점프 호스트 접속 테스트
ssh eta

# 2단계: GPU 서버 접속 테스트
ssh psi
```

1단계에서 실패하면 네트워크 또는 계정 문제, 2단계에서 실패하면 ProxyJump 설정 문제입니다.

## Python / conda 문제

| 증상                            | 해결                                                                       |
| ------------------------------- | -------------------------------------------------------------------------- |
| `conda: command not found`      | `source /opt/conda/etc/profile.d/conda.sh` 실행                            |
| `ModuleNotFoundError`           | 올바른 환경인지 확인: `conda activate evolvepro` 또는 `conda activate plm` |
| 어떤 환경이 활성화되었는지 모름 | `conda env list`로 현재 환경 확인 (별표 표시)                              |

## GPU 문제

| 증상                       | 해결                                                       |
| -------------------------- | ---------------------------------------------------------- |
| `CUDA out of memory`       | `--toks_per_batch` 줄이기: 512 → 256 → 128                 |
| `CUDA: False`              | `nvidia-smi`로 GPU 상태 확인. 드라이버 문제면 관리자 문의  |
| `RuntimeError: CUDA error` | 다른 사용자가 GPU를 점유 중일 수 있음. `nvidia-smi`로 확인 |

## 유용한 명령어

```bash
# GPU 상태 확인
nvidia-smi

# conda 환경 목록
conda env list

# 환경 전환
conda activate evolvepro
conda activate plm

# CPU/메모리 모니터링
htop

# 디스크 사용량
du -sh /workspace/$USER/*
```

## 추가 리소스

- [EvolvePro GitHub](https://github.com/mat10d/EvolvePro) — 이슈/버그 리포트
- [Google Colab 튜토리얼](https://colab.research.google.com/drive/1YCWvR73ItSsJn3P89yk_GY1g5GEJUlgy) — 설치 없이 브라우저에서 실습
- 논문: Jiang et al., "Rapid in silico directed evolution by a protein language model with EVOLVEpro", *Science* (2024)
