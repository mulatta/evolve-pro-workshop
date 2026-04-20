# PLM 임베딩 추출

ESM-2 모델로 각 변이체의 임베딩 벡터를 생성합니다. 이 단계에서는 `plm` conda 환경을 사용합니다.

## 실행

```bash
conda activate plm
cd /workspace/$USER/EvolvePro

python evolvepro/plm/esm/extract.py \
  esm2_t48_15B_UR50D \
  data/dms/brenan/brenan.fasta \
  output/plm/esm/brenan \
  --toks_per_batch 512 \
  --include mean \
  --concatenate_dir output/plm/esm/
```

## 파라미터 설명

| 파라미터                            | 설명                                    |
| ----------------------------------- | --------------------------------------- |
| `esm2_t48_15B_UR50D`                | ESM-2 15B 파라미터 모델                 |
| `data/dms/brenan/brenan.fasta`      | 입력 FASTA 파일                         |
| `output/plm/esm/brenan`             | 출력 디렉토리                           |
| `--toks_per_batch 512`              | 배치당 토큰 수 (GPU 메모리에 맞게 조절) |
| `--include mean`                    | 평균 풀링 임베딩 사용                   |
| `--concatenate_dir output/plm/esm/` | 결합된 결과 저장 디렉토리               |

!!! info "첫 실행 시 모델 다운로드"
    첫 실행 시 ESM-2 모델을 자동으로 다운로드합니다. 15B 모델은 크기가 크므로 시간이 걸릴 수 있습니다.

!!! warning "GPU 메모리 부족 시"
    `CUDA out of memory` 에러가 나면 `--toks_per_batch` 값을 줄이세요:

    ```bash
    # 512 → 256 → 128 순서로 줄여봅니다
    --toks_per_batch 256
    ```

## 출력 확인

```bash
ls output/plm/esm/
```

`brenan.csv` 파일이 생성되었는지 확인합니다.

## 다음 단계

[EVOLVEpro 실행 →](run.md)
