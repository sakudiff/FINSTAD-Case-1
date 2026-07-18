# FINSTAD Case 1 — Group 3

**Course:** FINSTAD | **Section:** C01

A consolidated financial database and empirical analysis of four assets (AAPL, BDO, BTC, SPY) with four FRED macroeconomic indicators over 2020–2025. Includes data cleaning, SQL-based financial analysis, descriptive statistics, visualizations, and an investment recommendation.

## Group Members

- CRUZ, Ricardo Miguel Iñigo
- GALEDO, Enrique Lorenzo Hermoso
- SEBALLOS, Josiah Dweyn Panganiban
- SEECHUNG, Camille Castro
- SISON, Aaron Joshua Estacio

## Key Resources

| Resource | Link |
|---|---|
| **Final Report (PDF)** | [`reports/finstad_report.pdf`](reports/finstad_report.pdf) |
| **Appendix — Complete R Code (PDF)** | [`scripts/finstad_analysis.pdf`](scripts/finstad_analysis.pdf) |
| **Executive Dashboard** | [finstadgroup3-executive-dashboard.netlify.app](https://finstadgroup3-executive-dashboard.netlify.app/) |
| **GitHub Repository** | [github.com/sakudiff/FINSTAD-Case-1](https://github.com/sakudiff/FINSTAD-Case-1) |

## Key Findings

- Bitcoin delivered the highest total return but also the highest volatility and downside risk, making it unsuitable as a primary holding.
- BDO Unibank had the highest risk-adjusted return and the lowest cross-asset correlations, providing the strongest diversification benefit.
- Asset performance varied significantly across macroeconomic regimes (high VIX, rising rates, high inflation), confirming the value of multi-asset diversification.
- The recommended portfolio allocates USD 1,000,000 across AAPL (35%), BDO (30%), SPY (20%), and BTC (15%), balancing return, risk, and diversification.

## Data Sources

| Dataset | Source | Period |
|---|---|---|
| AAPL (Apple Inc) | Yahoo Finance | 2020–2025 |
| BDO Unibank | Philippine Stock Exchange | 2020–2025 |
| Bitcoin (BTC) | CoinMarketCap / Yahoo Finance | 2020–2025 |
| SPY (SPDR S&P 500 ETF) | Yahoo Finance | 2020–2025 |
| CPI, DGS10, FEDFUNDS, VIX | FRED (Federal Reserve) | 2020–2025 |

## Report Sections

| Section | Description | Status |
|---|---|---|
| Executive Summary | Overview of findings | Complete |
| Introduction | Motivation and objectives | Complete |
| Data Sources | Data provenance and description | Complete |
| Data Cleaning | Calendar alignment, forward-fill methodology | Complete |
| Database Integration | SQLite relational database construction | Complete |
| SQL Financial Analysis | Q1–Q10 investigations | Complete |
| Descriptive Statistics and Visualizations | Statistical summaries and charts | Complete |
| Investment Recommendation | USD 1,000,000 portfolio allocation | Complete |
| Conclusion | Summary and limitations | Complete |

## Project Structure

```
├── data/                   # Raw and processed datasets (CSV, SQLite)
├── scripts/                # R analysis code (.qmd) and rendered appendix
├── reports/                # LaTeX report, sections, figures, and compiled PDF
│   ├── sections/           # Individual chapter .tex files
│   └── figures/            # All charts and visualizations
├── dashboard/              # Interactive executive dashboard (Quarto)
└── docs/                   # Archived planning docs and old README
```

## Software Requirements

- **R** 4.x with packages: dplyr, tidyr, DBI, RSQLite, ggplot2, scales, knitr, slider, plotly
- **Quarto** 1.4 and later — for rendering the dashboard and appendix
- **LaTeX** (TeX Live 2025 and later) with xelatex and biber — for compiling the report
- **SQLite** — embedded database for integrated financial data
