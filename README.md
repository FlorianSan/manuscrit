# Thesis Template (Université de Toulouse)

This is a thesis template, clone and use it on local or server.

Local:
- Install LaTeX: `sudo apt install latexmk texlive-latex-extra texlive-bibtex-extra biber texlive-lang-french` (or `sudo apt install latexmk texlive-full`)
- Compile project: `make`
- Open the result PDF file: `make read`

[Overleaf](www.overleaf.com):
- In local, run `zip -r thesis.zip * -x '*.git*' -x 'Makefile' -x 'main.pdf' -x 'README.md'`
- On web interface, select New Project > Upload Project > `thesis.zip`

## Files structures

- Style
  - `tlsflyleaf*`: cover page format
  - `StyleThese*`: main content format
  - `FormatAndDefs.tex`: useful packages and settings

- Content
  - `main.tex`
  - `chapters/`
  - `figures/`
  - `biblio.bib`

- Result PDF
  - `main.pdf`

## Known issues

### Bold small caps
Bold small caps for author's name is only bold when using `TeX Live` version >= 2020 and `pdfLaTeX` compiler. Example:
```
\documentclass{article}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{lmodern}

\begin{document}
\fontfamily{cmr}\textbf{\textsc{Sample}}
\end{document}
```

Solutions:
- Use older version of TeX Live. For Overleaf, change it in project settings, 2019 works fine.
- Or use normal small caps, remove `\textbf` before `\textsc{\@author}` in `tlsflyleaf.sty` (2 locations).
- Or replace `\usepackage{lmodern}` by `\usepackage{fix-cm}` in `FormatAndDefs.tex`. (Provided by Overleaf support team)
- Or use `XeLaTeX` or `LuaLaTeX` as compiler and replace usepackages (inputenc, fontenc, lmodern) to `\usepackage{fontspec}`, `\setmainfont{CMU Serif}`. (Provided by Overleaf support team)

## Other version

Branch `original-version`: Original Project from: [https://redmine.laas.fr/projects/latex-laas] and [git://redmine.laas.fr/laas/latex-laas/modele-these.git].

