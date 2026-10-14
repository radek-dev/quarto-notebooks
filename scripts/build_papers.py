"""Compile every Typst paper in papers/ to a PDF next to its source."""

from pathlib import Path

import typst

for source in sorted(Path("papers").glob("*.typ")):
    target = source.with_suffix(".pdf")
    typst.compile(str(source), output=str(target))
    print(f"compiled {source} -> {target}")
