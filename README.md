# quarto-notebooks

Reproducible scientific notebooks rendered with [Quarto](https://quarto.org) and managed with [uv](https://docs.astral.sh/uv/). Showcased in the [Notebook Gallery](https://radek-dev.github.io/notebook-gallery/).

**Live site:** https://radek-dev.github.io/quarto-notebooks/

| Notebook | Description |
| :-- | :-- |
| [`clt.qmd`](https://radek-dev.github.io/quarto-notebooks/clt.html) | The central limit theorem, simulated on synthetic data |

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

## Deployment

Pushing to `main` runs `.github/workflows/deploy.yml`, which installs the locked environment with uv, renders the site and publishes it to GitHub Pages. Set **Settings → Pages → Source** to **GitHub Actions**.
