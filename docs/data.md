# 데이터 준비

EvolvePro는 두 가지 입력 파일이 필요합니다: FASTA 파일(서열)과 CSV 파일(활성 데이터).

## 입력 파일 형식

### FASTA 파일

각 변이체의 아미노산 서열을 담고 있습니다:

```
>WT
MSKGEELFTGVVPILVELDGDVNGHKFSVSGEGEGDATYGK...
>A1V
VSKGEELFTGVVPILVELDGDVNGHKFSVSGEGEGDATYGK...
>A1L
LSKGEELFTGVVPILVELDGDVNGHKFSVSGEGEGDATYGK...
```

- `>` 뒤에 변이체 이름
- 다음 줄에 아미노산 서열

### CSV 파일

각 변이체의 실험 측정값을 담고 있습니다:

```csv
variant,activity
WT,1.0
A1V,0.85
A1L,1.23
S2T,0.92
```

## 예제 데이터 확인

EvolvePro에는 예제 데이터셋이 포함되어 있습니다:

```bash
conda activate evolvepro
cd /workspace/$USER/EvolvePro
ls data/dms/
```

각 데이터셋 디렉토리에 FASTA와 CSV 파일이 있습니다.

## 다음 단계

[PLM 임베딩 추출 →](plm.md)
