# 결과 시각화

EVOLVEpro 실행 결과를 플롯으로 시각화하고, 로컬 컴퓨터로 복사합니다.

## 결과 확인

```bash
ls output/dms/workshop_test/
```

## 시각화 실행

```bash
conda activate evolvepro
cd /workspace/$USER/EvolvePro

python scripts/plot.py \
  --input_dir output/dms/workshop_test \
  --output_dir output/plots/workshop_test
```

## 결과 파일을 로컬로 복사

서버에서 생성된 플롯을 내 컴퓨터로 가져옵니다. **내 컴퓨터의 터미널**에서 실행합니다 (서버가 아닙니다):

```bash
scp -r psi:/workspace/$USER/EvolvePro/output/plots/workshop_test ./
```

!!! tip "`scp`란?"
    `scp`(Secure Copy)는 SSH를 이용한 파일 복사 명령어입니다. [SSH 설정](ssh.md)에서 `~/.ssh/config`를 작성했으므로 `psi:`만으로 접속됩니다.

## 다음 단계

문제가 있다면 [트러블슈팅](troubleshooting.md)을 참고하세요.
