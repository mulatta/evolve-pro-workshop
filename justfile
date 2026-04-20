[private]
default:
    @just --list

# Start slidev dev server
slide:
    cd slides && bunx slidev slides.md
