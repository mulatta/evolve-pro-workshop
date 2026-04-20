# EVOLVEpro 실행

DMS(Deep Mutational Scanning) 워크플로우로 모델을 학습하고 최적 변이체를 예측합니다. 이 단계에서는 `evolvepro` conda 환경을 사용합니다.

## 실행

```bash
conda activate evolvepro
cd /workspace/$USER/EvolvePro

python scripts/dms/dms_main.py \
  --dataset_name brenan \
  --experiment_name workshop_test \
  --model_name esm2_t48_15B_UR50D \
  --embeddings_path output/plm/esm/brenan.csv \
  --labels_path data/dms/brenan/brenan.csv \
  --num_simulations 3 \
  --num_iterations 5 \
  --measured_var activity \
  --learning_strategies topn \
  --num_mutants_per_round 10 \
  --num_final_round_mutants 50 \
  --regression_types randomforest \
  --output_dir output/dms/workshop_test
```

## 주요 파라미터

| 파라미터 | 값 | 설명 |
|----------|-----|------|
| `--num_simulations` | 3 | 반복 실험 횟수 (통계적 안정성) |
| `--num_iterations` | 5 | Active learning 라운드 수 |
| `--num_mutants_per_round` | 10 | 라운드당 선택할 변이체 수 |
| `--num_final_round_mutants` | 50 | 마지막 라운드에서 예측할 변이체 수 |
| `--learning_strategies` | topn | 변이체 선택 전략 |
| `--regression_types` | randomforest | 회귀 모델 종류 |

## 학습 전략 옵션

어떤 변이체를 다음 라운드에 선택할 것인가?

| 전략 | 설명 | 특성 |
|------|------|------|
| `random` | 무작위 선택 | 기준선 비교용 |
| `topn` | 예측 상위 N개 선택 | 활용(exploitation) 중심 |
| `topn2bottomn2` | 상위/하위 각 N/2개 선택 | 탐색+활용 균형 |
| `dist` | 다양성 기반 선택 | 탐색(exploration) 중심 |

## 회귀 모델 옵션

| 모델 | 설명 |
|------|------|
| `randomforest` | Random Forest (기본, 권장) |
| `ridge` | Ridge 회귀 |
| `lasso` | Lasso 회귀 |
| `gradientboosting` | Gradient Boosting |
| `knn` | K-Nearest Neighbors |
| `gp` | Gaussian Process |

## 출력 확인

```bash
ls output/dms/workshop_test/
```

## 다음 단계

[결과 시각화 →](visualize.md)
