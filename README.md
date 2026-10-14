# quarto-notebooks

Reproducible scientific notebooks rendered with [Quarto](https://quarto.org) and managed with [uv](https://docs.astral.sh/uv/). Showcased in the [Notebook Gallery](https://radek-dev.github.io/notebook-gallery/).

**Live site:** https://radek-dev.github.io/quarto-notebooks/

| Notebook | Description |
| :-- | :-- |
| [`clt.qmd`](https://radek-dev.github.io/quarto-notebooks/clt.html) | The central limit theorem, simulated on synthetic data |

## Papers

| Paper | Description |
| :-- | :-- |
| [`papers/confidence-intervals.typ`](https://radek-dev.github.io/quarto-notebooks/papers/confidence-intervals.pdf) | Typst document: a confidence interval for a mean (PDF) |

Typst papers live in `papers/` and are compiled by `scripts/build_papers.py`, which `uv run quarto render` runs automatically (via the `typst` package, no extra install). To compile one on its own: `uv run typst compile papers/<name>.typ`. The PDFs are build output and are not committed.

Related: [notebook-gallery](https://github.com/radek-dev/notebook-gallery) · [marimo-notebooks](https://github.com/radek-dev/marimo-notebooks) · [streamlit-apps](https://github.com/radek-dev/streamlit-apps)

## Reproduce

Requires [uv](https://docs.astral.sh/uv/getting-started/installation/). Quarto itself is installed as a project dependency (`quarto-cli`), so nothing else is needed.

```sh
uv sync                 # create .venv from uv.lock
uv run quarto render    # build the site into _site/
uv run quarto preview   # live preview while editing
```

## Add a notebook

1. Add a `.qmd` file (or an `.ipynb`) and list it in `index.qmd`.
2. Add any new packages with `uv add <package>` so `pyproject.toml` and `uv.lock` stay in sync.
3. Add references to `references.bib`.
4. For a Typst paper, add `papers/<name>.typ` and link `papers/<name>.pdf` from `index.qmd`. For LaTeX, build the PDF separately (for example with Tectonic) and commit it under `papers/`; the `papers/*.pdf` resource rule publishes it.

## Deployment

Pushing to `main` runs `.github/workflows/deploy.yml`, which installs the locked environment with uv, renders the site and publishes it to GitHub Pages. Set **Settings → Pages → Source** to **GitHub Actions**.
