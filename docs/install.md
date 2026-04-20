# EvolvePro 설치

서버에 EvolvePro를 설치하고 두 개의 conda 환경을 생성합니다.

## 1. 코드 다운로드

```bash
cd /workspace/$USER/
git clone https://github.com/mat10d/EvolvePro.git
cd EvolvePro
```

## 2. EVOLVEpro 환경 생성

EvolvePro 코어 라이브러리를 위한 환경입니다:

```bash
conda env create -f environment.yml
conda activate evolvepro
```

## 3. PLM 환경 생성

단백질 언어 모델(PLM) 임베딩 추출을 위한 별도 환경입니다:

```bash
sh setup_plm.sh
conda activate plm
```

!!! info "왜 환경을 두 개 만드나요?"
    PyTorch 등 딥러닝 라이브러리와 EVOLVEpro 코어 라이브러리의 의존성이 충돌할 수 있습니다. 환경을 분리하여 이 문제를 방지합니다.

    - `evolvepro` — 모델 학습, 데이터 처리
    - `plm` — PLM 임베딩 추출 (PyTorch, ESM 등)

## 4. 설치 확인

### EVOLVEpro 환경

```bash
conda activate evolvepro
python -c "import evolvepro; print('evolvepro OK')"
```

### PLM 환경

```bash
conda activate plm
python -c "import torch; print(f'PyTorch OK, CUDA: {torch.cuda.is_available()}')"
python -c "import esm; print('ESM OK')"
```

### 예상 출력

```
evolvepro OK
PyTorch OK, CUDA: True
ESM OK
```

!!! warning "`CUDA: False`가 나오는 경우"
    GPU 드라이버 문제입니다. `nvidia-smi`를 실행하여 GPU가 정상인지 확인하고, 관리자에게 문의하세요.

## 다음 단계

[데이터 준비 →](data.md)
