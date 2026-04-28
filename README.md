# EvolvePro Workshop

AI 기반 단백질 진화 최적화 도구 **EvolvePro**를 실습하기 위한 핸즈온 워크숍 자료입니다.

EvolvePro는 Protein Language Model(PLM) 임베딩과 Active Learning을 결합해 적은 수의 실험 데이터로 유망한 단백질 변이체를 반복적으로 선택합니다.

## Documentation

워크숍 문서는 GitHub Pages에서 볼 수 있습니다.

<https://mulatta.github.io/evolve-pro-workshop/>

## Contents

- WSL2 설치 및 터미널 환경 준비
- SSH를 통한 실습 서버 접속
- EvolvePro 설치
- 변이체 서열 및 활성 데이터 준비
- PLM 임베딩 추출
- EVOLVEpro 실행
- 결과 시각화 및 트러블슈팅

## Workflow

```text
1. Process → 2. PLM → 3. EVOLVEpro → 4. Plot
```

| Step | Description |
| --- | --- |
| Process | Prepare variant sequences and activity data |
| PLM | Extract embeddings with a protein language model |
| EVOLVEpro | Train an active-learning model and select variants |
| Plot | Visualize and inspect optimization results |

## Local development

This repository uses Nix for reproducible builds.

Build the documentation:

```sh
nix build .#docs
```

Serve the documentation locally:

```sh
just docs
```

Build the slides:

```sh
nix build .#slides
```

Run the slide development server:

```sh
just slide
```

## Repository layout

```text
docs/       Workshop documentation
slides/     Slidev presentation
nix/        Nix build definitions
```

## Reference

Jiang et al., “Rapid in silico directed evolution by a protein language model with EVOLVEpro”, *Science* (2024).
