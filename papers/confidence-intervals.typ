#set document(title: "Estimating a Mean with Confidence Intervals", author: "radek-dev")
#set page(paper: "a4", margin: 2.5cm, numbering: "1")
#set text(font: "Libertinus Serif", size: 11pt)
#set par(justify: true)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")
#show link: set text(fill: rgb("#1d4ed8"))

#align(center)[
  #text(size: 18pt, weight: "bold")[Estimating a Mean with Confidence Intervals] \
  #v(0.3em)
  radek-dev \
  #datetime.today().display("[day] [month repr:long] [year]")
]

#v(1em)
#block(inset: 1em, fill: luma(240), radius: 4pt)[
  *Abstract.* A short worked example of a Typst document: a $t$-based confidence
  interval for a mean, with an equation, table and figure. All numbers are
  illustrative and use synthetic data.
]

= Introduction

Given independent observations $x_1, dots, x_n$ with sample mean $overline(x)$
and sample standard deviation $s$, a $(1 - alpha)$ confidence interval for the
population mean is

$ overline(x) plus.minus t_(n-1, 1 - alpha slash 2) dot s / sqrt(n) $ <eq-ci>

@eq-ci assumes the data are approximately normal or $n$ is moderately
large.

= Worked example

Suppose $n = 25$, $overline(x) = 10.4$ and $s = 2.0$. With
$t_(24, 0.975) approx 2.064$, the half-width is
$2.064 dot 2.0 slash sqrt(25) approx 0.83$.

#figure(
  table(
    columns: 4,
    align: center,
    stroke: 0.5pt,
    table.header[*n*][*Mean*][*Std. dev.*][*95% CI*],
    [25], [10.4], [2.0], [\[9.57, 11.23\]],
  ),
  caption: [Summary statistics and the resulting interval.],
) <tab-summary>

@tab-summary lists the inputs and the interval.

= Interval widths

The width shrinks with $sqrt(n)$, so quadrupling the sample halves it.

#figure(
  {
    let widths = (4, 9, 16, 25, 36, 49)
    grid(
      columns: widths.len(),
      column-gutter: 0.6cm,
      align: bottom,
      ..widths.map(n => align(center + bottom)[
        #rect(width: 1.2cm, height: 5cm / calc.sqrt(n), fill: rgb("#1d4ed8"))
        #text(size: 9pt)[$n = #n$]
      ])
    )
  },
  caption: [Relative interval width falls as $1 slash sqrt(n)$.],
)

= Limitations

- Synthetic, illustrative numbers only.
- Assumes independent, roughly normal data; heavy tails or dependence need other methods.

= Reproducing this document

```sh
uv sync
uv run typst compile papers/confidence-intervals.typ
```
