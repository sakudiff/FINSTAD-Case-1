# SQL Financial Investigation — Slide Bullet Points

---

## SQL Q1: Risk-Adjusted Returns

### Slide 1 — Table

**Research Question:** Which asset delivered the highest return per unit of risk over the 2020 to 2025 sample period?

- Computed a Sharpe-like ratio by dividing each asset's mean daily return by its standard deviation.
- Sorted assets descending: BDO (0.0524), BTC (0.0520), AAPL (0.0392), SPY (0.0353).
- Constructed the metric via `group_by(Asset) %>% summarise(Mean_Daily_Return, SD_Daily_Return) %>% mutate(Risk_Adjusted_Return)`.
- Extended the query with `arrange(desc(Risk_Adjusted_Return))` to produce the final ranking.
- Added a benchmark reference line at SPY's ratio (0.0353) to contextualize relative performance.

### Slide 2 — Figure (fig_q1.pdf)

- **Figure 1** plots the risk-adjusted return as horizontal bars, ranked top to bottom by efficiency.
- A dashed vertical line at SPY's benchmark level divides beaters from laggards.
- BDO led the hierarchy at 0.0524, built on a 0.08% mean daily return against 1.54% volatility.
- BTC followed at 0.0520, achieving near-parity through higher return magnitude (0.17%) at 3.19% volatility.
- AAPL and SPY ranked below the Philippine asset, with AAPL at 0.0392 and SPY at 0.0353.
- Answered the research question: BDO delivered the highest return per unit of risk, driven by its low volatility rather than high absolute returns.

---

## SQL Q2: COVID Crash Analysis

### Slide 1 — Table

**Research Question:** How did each asset perform during the COVID-19 market crash of February to March 2020?

- Filtered the dataset to observations between 1 February and 31 March 2020.
- Computed cumulative returns within each asset group using `cumprod(1 + Daily_Return) - 1` ordered by date.
- Summarised start and end dates, total cumulative return, and observation count per asset.
- BDO posted a positive cumulative return of +41.67% across 60 trading days, gaining during the crisis.
- BTC declined 31.14% across 60 days, the largest cumulative loss.
- SPY lost 4.46% and AAPL lost 0.43%, both over 60 trading days.
- BDO's positive COVID return reflected the delayed and muted impact of the global selloff on Philippine equities rather than genuine crisis alpha.

### Slide 2 — Figure (fig_q2.pdf)

- **Figure 2** traces cumulative returns as line paths from February through March 2020.
- SPY and AAPL declined modestly, reflecting the broad US equity selloff compressed into a narrow window.
- BTC exhibited sharp intra-period reversals with violent single-day bounces followed by deeper declines.
- BDO showed a pronounced upward trajectory that contrasted sharply with the US equity collapse.
- Confirmed that the proposition of cryptocurrency as a crisis hedge is rejected — BTC recorded the largest cumulative loss at 31.14%.
- Answered the research question: crisis impact was highly asset-specific, with BDO gaining as Philippine markets decoupled from global turmoil.

---

## SQL Q3: Cross-Asset Correlation

### Slide 1 — Table

**Research Question:** What is the cross-asset correlation of daily returns, and which assets offer the strongest diversification potential?

- Transformed daily returns into wide format via `pivot_wider(names_from = Asset, values_from = Daily_Return)`.
- Computed the Pearson correlation matrix using `cor(use = "pairwise.complete.obs")`.
- Reshaped the matrix to long format via `pivot_longer` for visual mapping.
- Found the AAPL-SPY pair produced the highest coefficient at 0.787, a mechanical consequence of Apple's weighting in the S&P 500.
- BDO formed a distinct diversification tier with average cross-correlation of 0.090.

### Slide 2 — Figure (fig_q3.pdf)

- **Figure 3** displays the pairwise correlation matrix as a colour-coded heatmap with numeric labels.
- Dark blue squares mark the strongest positive correlations (AAPL-SPY at 0.787), light green squares mark the near-zero pairs.
- BDO's average cross-correlation of 0.090 means it retains more than 91% of its stand-alone variance as diversifying power.
- The BDO-BTC pair at 0.076 was the lowest in the matrix, offering the strongest portfolio diversification.
- Answered the research question: BDO provides the greatest diversification benefit, but unconditional correlations overstate the protection available during systemic crises.

---

## SQL Q4: Asset Ranking by Total Return

### Slide 1 — Table

**Research Question:** How do the selected assets rank by total return from 2020 to 2025?

- Extracted start and end closing prices per asset from the filtered daily dataset.
- Computed total return as `(End_Close / Start_Close) - 1` and annualised return via the 365.25-day formula.
- Ranked by `Total_Return` descending to produce the performance hierarchy.
- BTC delivered 1,115.4% total return (51.6% annualised), far exceeding all other assets.
- BDO returned 5.7% total return (0.9% annualised), the lowest in the sample — essentially zero real capital appreciation across six years.
- All assets have 2,192 observations after the forward-fill procedure.

### Slide 2 — Figure (fig_q4.pdf)

- **Figure 4** plots total return as horizontal bars, ranked from best to worst.
- BTC's bar dominates the chart at 1,115.4%, reflecting its capture of the zero-interest-rate liquidity premium.
- AAPL returned 275.2% (24.7% annualised), driven by earnings growth and multiple expansion.
- SPY returned 129.1% (14.8% annualised), in line with broad equity market performance.
- Answered the research question: total return was driven more by asset class exposure to speculative liquidity than by any fundamental measure of business quality.

---

## SQL Q5: Best and Worst Trading Days

### Slide 1 — Table

**Research Question:** What were the best and worst single-day returns for each asset, and what do they reveal about structural tail risk?

- Identified each asset's maximum and minimum daily return using `which.max()` and `which.min()` within `group_by(Asset)`.
- Computed the return range as the difference between best and worst days.
- BTC's worst day at -37.2% (12 March 2020) was nearly four times SPY's worst day at -9.6%.
- BDO's worst day at -11.8% was smaller than its best day at 15.7%, showing relatively balanced tail risk for a Philippine bank stock.
- Only AAPL and SPY showed roughly symmetric extremes, with worst-day losses comparable to best-day gains.

### Slide 2 — Figure (fig_q5.pdf)

- **Figure 5** plots best and worst trading days as grouped bars per asset, blue for gains and red for losses.
- The asymmetry in the BTC tails is visually stark — the red bar for its worst day extends far beyond any other.
- BTC's 37.2% decline on 12 March 2020 was a cascading liquidation event: levered longs margin-called, stop-loss orders triggered further declines, and the cascade exhausted every bid in the order book.
- The 3.9x ratio between BTC's and SPY's worst-day losses defines the risk-budgeting challenge for a multi-asset portfolio.
- Answered the research question: assets with the highest unconditional volatility also have the most asymmetric tails, and those tails are structurally unhedgeable through conventional correlation-based methods.

---

## SQL Q6: Moving Average Crossover Analysis

### Slide 1 — Table

**Research Question:** How frequently do short-term price trends deviate from medium-term baselines across different assets?

- Calculated 20-day and 60-day simple moving averages per asset using `stats::filter(Close, rep(1/20, 20), sides = 1)`.
- Assigned a `Signal` — Bearish, Bullish, or Neutral — based on whether the 20-day MA sat above or below the 60-day MA.
- Grouped by Asset and Signal to compute mean and standard deviation of daily returns per regime.
- AAPL's bullish mean return (0.09%) exceeded its bearish return (0.01%), offering the clearest trend-following signal.
- BDO and SPY showed bearish mean returns exceeding bullish means, reflecting the sample's strong upward drift overwhelming short-term signals.

### Slide 2 — Figure (fig_q6.pdf)

- **Figure 6** overlays the 20-day (blue) and 60-day (red) moving averages on closing prices from 2024 to 2025, faceted by asset.
- BTC's bullish mean return reached 0.28%, the highest among all assets, while its bearish mean was just 0.02%.
- SPY's bullish mean (0.03%) was below its bearish mean (0.04%), driven by the sample's strong upward trend overwhelming short-term signals.
- BDO had the most balanced signal distribution with 1,085 bearish and 1,048 bullish observations.
- Answered the research question: crossover frequency varies across assets, and BTC's trend signal asymmetry undermines symmetric long-short strategies.

---

## SQL Q7: Volume and Volatility Relationship

### Slide 1 — Table

**Research Question:** Does elevated trading volume systematically coincide with higher daily price volatility?

- Joined daily returns with volume data from the `assets_all` raw table via `left_join`.
- Defined the high-volume regime as days in the top quartile (`quantile(Volume, 0.75)`) per asset.
- Grouped by Asset and Volume_Regime to compute mean return, mean absolute return, and volatility.
- In every asset, the high-volume regime produced mean absolute returns approximately double the normal-volume regime (e.g. SPY: 1.33% vs. 0.46%; BTC: 3.05% vs. 1.83%).
- BDO and SPY showed negative mean daily returns in high-volume days, consistent with adverse repricing events rather than benign liquidity provision.

### Slide 2 — Figure (fig_q7.pdf)

- **Figure 7** compares mean absolute daily return across high-volume and normal-volume regimes as a grouped bar chart per asset.
- The red bars (high volume) are consistently double the blue bars (normal volume), a uniform pattern across all four assets.
- BTC's high-volume regime produced 3.05% mean absolute return, the highest in the sample, connecting directly to its tail risk profile from Q5.
- Mixture-of-distributions logic explains the pattern: volume and volatility are jointly driven by information arrival rates, not passive liquidity.
- Answered the research question: elevated volume systematically coincides with doubled price volatility, creating a measurable implementation shortfall tax on active management.

---

## SQL Q8: VIX Regime Analysis

### Slide 1 — Table

**Research Question:** How does asset behaviour change during high-fear (VIX > 30) versus low-fear (VIX < 20) market regimes?

- Filtered to observations with non-missing VIX values and partitioned into three regimes: VIX < 20, 20-30, and VIX > 30.
- Grouped by Asset and VIX_Regime to compute conditional mean return, standard deviation, and observation count.
- During high-fear periods, BDO was the only asset with a positive mean daily return (0.14%), while AAPL posted -0.34%, SPY -0.24%, and BTC -0.16%.
- BTC's negative high-fear mean contradicted the narrative that cryptocurrency hedges volatility.
- The high-fear regime contained 206 observations per asset, approximately 9.4% of the total sample.

### Slide 2 — Figure (fig_q8.pdf)

- **Figure 8** plots mean daily return by VIX regime as a grouped bar chart, blue for low fear and red for high fear.
- BDO's bar was the only positive red bar — every other asset's high-fear bar extended below the zero line.
- AAPL's low-fear mean (0.13%) was substantially higher than BDO's (0.05%), establishing a clear calm-market hierarchy.
- The COVID-19 crash from Q2 drove the high-fear regime, with BDO's positive return reflecting its decoupling from global risk-on dynamics.
- Answered the research question: VIX regime determines cross-asset return rankings — during high fear, BDO uniquely delivered positive returns, likely reflecting domestic monetary insulation rather than genuine crisis alpha.

---

## SQL Q9: Interest Rate Sensitivity

### Slide 1 — Table

**Research Question:** How sensitive is each asset's daily return to changes in the 10-year Treasury yield?

- Computed daily changes in the 10-year yield via `DGS10_Change = DGS10 - lag(DGS10)` per asset.
- Assigned each day to Yields Rising, Yields Falling, or No Change based on the sign of the change.
- Grouped by Asset and Yield_Direction to produce conditional mean returns.
- During rising-yield periods, all four assets posted positive returns — BTC (0.20%), BDO (0.13%), AAPL (0.11%), SPY (0.10%).
- During falling-yield periods, BDO posted 0.12% and BTC 0.17%, while SPY was near-zero at 0.01%.

### Slide 2 — Figure (fig_q9.pdf)

- **Figure 9** plots mean daily return conditional on yield direction, orange for rising yields and blue for falling yields.
- Every asset shows a positive orange bar, contradicting the textbook DCF intuition that higher rates mechanically lower prices.
- The growth-signalling channel dominated the discount-rate channel: rising yields reflected improving growth expectations, not restrictive monetary policy.
- BDO showed positive returns in both regimes (0.13% rising, 0.12% falling), the most consistent performance across yield environments.
- Answered the research question: rate sensitivity varies by asset, but the dominant transmission channel is growth expectations.

---

## SQL Q10: Inflation Hedge Performance

### Slide 1 — Table

**Research Question:** Which assets served as the most effective inflation hedges during the high-inflation period of 2021 to 2023?

- Filtered the dataset to the window where CPI year-on-year exceeded 5% (June 2021 to February 2023).
- Computed cumulative returns per asset using `cumprod(1 + Daily_Return) - 1` within the filtered window.
- Summarised start and end dates, CPI boundaries, total cumulative return, and mean daily return per asset.
- AAPL generated the highest cumulative return at 27.8%, followed by BDO at 24.8%.
- SPY gained 11.3%, while BTC collapsed by 38.0% — the asset marketed as digital gold delivered the worst inflation-hedging performance.
- All four assets share 638 high-inflation observations.

### Slide 2 — Figure (fig_q10.pdf)

- **Figure 10** plots cumulative return during the high-inflation window as horizontal bars, ranked best to worst.
- AAPL's bar leads at +27.8%, BDO follows at +24.8%, SPY at +11.3%, and BTC extends deep into negative territory at -38.0%.
- AAPL's pricing power allowed it to pass input cost increases to consumers without triggering demand destruction.
- BDO's performance reflected the endowment effect: Philippine banks widen net interest margins when floating-rate loans reprice upward while deposit rates adjust slowly.
- BTC's 38.0% loss was the most informative negative data point: no cash flows, no contractual repricing mechanism, and no fundamental valuation floor meant the asset collapsed when the Fed withdrew liquidity.
- Answered the research question: AAPL and BDO provided the most effective inflation hedges, while the asset with the highest stand-alone total return in Q4 became the worst performer during the inflation window.
