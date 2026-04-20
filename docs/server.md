# 서버 환경 확인

서버에 접속한 후 GPU, 작업 디렉토리, conda를 확인합니다.

## GPU 확인

```bash
nvidia-smi
```

GPU 이름, 메모리 용량, 현재 사용률이 표시됩니다.

!!! info "GPU 공유"
    GPU 자원은 다른 사용자와 공유됩니다. 장시간 점유 시 다른 사용자와 조율하세요.

## 작업 디렉토리

모든 작업은 `/workspace/본인사용자명/`에서 진행합니다:

```bash
cd /workspace/$USER/
```

디렉토리 내용을 확인합니다:

```bash
ls /workspace/$USER/
```

!!! warning "홈 디렉토리가 아닌 `/workspace/`를 사용하세요"
    `/workspace/`는 고속 SSD(RAID0)입니다. 홈 디렉토리(`~`)보다 훨씬 빠릅니다.

## conda 확인

```bash
conda --version
```

conda가 없다면:

```bash
source /opt/conda/etc/profile.d/conda.sh
conda --version
```

## 다음 단계

[EvolvePro 설치 →](install.md)
