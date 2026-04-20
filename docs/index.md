# EvolvePro Workshop

AI 기반 단백질 진화 최적화 도구 **EvolvePro**를 사용하기 위한 핸즈온 가이드입니다.

## EvolvePro란?

EvolvePro는 Protein Language Model(PLM) 임베딩과 Active Learning을 결합하여 단백질을 최적화하는 도구입니다.

- 단백질 서열에서 PLM 임베딩을 추출
- Random Forest 회귀 모델로 활성을 예측
- **라운드당 10개** 데이터포인트로 반복 학습
- 다목적 최적화 가능 (활성, 안정성 등)

기존 방법이 수천 개의 변이체를 스크리닝해야 했다면, EvolvePro는 **수십 개**로 최적 변이체에 도달합니다.

> Jiang et al., "Rapid in silico directed evolution by a protein language model with EVOLVEpro", *Science* (2024)

## 워크플로우

```
1. Process → 2. PLM → 3. EVOLVEpro → 4. Plot
```

| 단계          | 설명                                                |
| ------------- | --------------------------------------------------- |
| **Process**   | 변이체 서열과 활성 데이터를 FASTA/CSV로 정리        |
| **PLM**       | ESM-2 등 언어 모델로 임베딩 벡터 추출 (GPU 필요)    |
| **EVOLVEpro** | Random Forest로 활성 예측 → 다음 라운드 변이체 선택 |
| **Plot**      | 결과 시각화 및 최적 변이체 분석                     |

## 사전 준비물

| 항목          | 설명                       |
| ------------- | -------------------------- |
| 컴퓨터        | Windows, macOS, 또는 Linux |
| 인터넷        | 서버 접속에 필요           |
| 관리자 연락처 | SSH 계정 발급 요청용       |

## 진행 순서

1. [WSL2 설치](wsl2.md) (Windows 사용자만)
1. [SSH 설정](ssh.md)
1. [서버 환경 확인](server.md)
1. [EvolvePro 설치](install.md)
1. [데이터 준비](data.md)
1. [PLM 임베딩 추출](plm.md)
1. [EVOLVEpro 실행](run.md)
1. [결과 시각화](visualize.md)

문제가 생기면 [트러블슈팅](troubleshooting.md)을 참고하세요.
