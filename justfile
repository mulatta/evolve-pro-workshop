[private]
default:
    @just --list

# Start slidev dev server
slide:
    cd slides && bunx slidev slides.md

# Build static slides
slide-build:
    nom build .#slides

# Preview built slides
slide-preview: slide-build
    python3 -m http.server -d result/ 8080
