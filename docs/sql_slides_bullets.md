# SQL Financial Investigation — Slide Bullet Points

---

## SQL Q1: Risk-Adjusted Returns

### Slide 1 — Table

**Research Question:** Which asset delivered the highest return per unit of risk over the 2020 to 2025 sample period?

- Computed a Sharpe-like ratio by dividing each asset's mean daily return by its standard deviation.
- Sorted assets descending: AAPL (0.0627), BTC (0.0613), SPY (0.0534), BDO (0.0310).
- Constructed the metric via `group_by(Asset) %>% summarise(Mean_Daily_Return, SD_Daily_Return) %>% mutate(Risk_Adjusted_Return)`.
- Extended the query with `arrange(desc(Risk_Adjusted_Return))` to produce the final ranking.
- Added a benchmark reference line at SPY's ratio (0.0534) to contextualize relative performance.

### Slide 2 — Figure (fig_q1.pdf)

- **Figure 1** plots the risk-adjusted return as horizontal bars, ranked top to bottom by efficiency.
- A dashed vertical line at SPY's benchmark level divides beaters from laggards.
- AAPL led the hierarchy at 0.0627, built on a 0.121% mean daily return against 1.93% volatility.
- BTC followed at 0.0613, achieving near-parity through higher return magnitude (0.233%) at 3.80% volatility.
- BDO ranked last at 0.0310, producing a 2x spread between top and bottom of the ranking.
- Answered the research question: AAPL delivered the highest return per unit of risk, while BDO lagged despite its near-zero correlation advantage.

---

## SQL Q2: COVID Crash Analysis

### Slide 1 — Table

**Research Question:** How did each asset perform during the COVID-19 market crash of February to March 2020?

- Filtered the dataset to observations between 1 February and 31 March 2020.
- Computed cumulative returns within each asset group using `cumprod(1 + Daily_Return) - 1` ordered by date.
- Summarised start and end dates, total cumulative return, and observation count per asset.
- Found that BTC declined 31.1% across 42 trading days, the largest cumulative loss.
- SPY lost 19.2% and AAPL lost 16.1%, both over 42 trading days.
- BDO lost only 5.3% over 42 days, the smallest COVID drawdown in the sample.
- BDO's mild drawdown reflected delayed crisis transmission to Philippine equities rather than genuine resilience.

### Slide 2 — Figure (fig_q2.pdf)

- **Figure 2** traces cumulative returns as line paths from February through March 2020.
- SPY and AAPL declined in near lockstep, reflecting the broad US equity selloff.
- BTC exhibited sharp intra-period reversals with violent single-day bounces followed by deeper declines.
- BDO showed a delayed and shallower decline that contrasted with the immediate US equity collapse.
- Confirmed that the proposition of cryptocurrency as a crisis hedge is rejected — BTC recorded the largest cumulative loss at 31.1%.
- Answered the research question: all assets suffered losses, with BTC and SPY hit hardest, while BDO's minimal drawdown reflected market structure lag, not fundamental hedging.

---

## SQL Q3: Cross-Asset Correlation

### Slide 1 — Table

**Research Question:** What is the cross-asset correlation of daily returns, and which assets offer the strongest diversification potential?

- Transformed daily returns into wide format via `pivot_wider(names_from = Asset, values_from = Daily_Return)`.
- Computed the Pearson correlation matrix using `cor(use = "pairwise.complete.obs")`.
- Reshaped the matrix to long format via `pivot_longer` for visual mapping.
- Found the AAPL-SPY pair produced the highest coefficient at 0.787, a mechanical consequence of Apple's weighting in the S&P 500.
- BDO formed a distinct diversification tier with correlations between 0.088 and 0.131 to all other assets.

### Slide 2 — Figure (fig_q3.pdf)

- **Figure 3** displays the pairwise correlation matrix as a colour-coded heatmap with numeric labels.
- Dark blue squares mark the strongest positive correlations (AAPL-SPY at 0.787), light green squares mark the near-zero pairs.
- BDO's average cross-correlation of 0.109 means it retains more than 89% of its stand-alone variance as diversifying power.
- The BDO-BTC pair at 0.088 was the lowest in the matrix, offering the strongest portfolio diversification.
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
- All assets have 1,566 observations after the forward-fill procedure.

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
- BTC's worst day at -37.2% (12 March 2020) was more than three times SPY's worst day at -10.9%.
- BDO's worst day at -13.4% was better balanced with its best day at 15.7%, showing more symmetric risk for a Philippine bank stock.
- Only AAPL and SPY showed roughly symmetric extremes, with worst-day losses comparable to best-day gains.

### Slide 2 — Figure (fig_q5.pdf)

- **Figure 5** plots best and worst trading days as grouped bars per asset, blue for gains and red for losses.
- The asymmetry in the BTC and BDO tails is visually stark — the red bars extend far beyond the blue bars.
- BTC's 37.2% decline on 12 March 2020 was a cascading liquidation event: levered longs margin-called, stop-loss orders triggered further declines, and the cascade exhausted every bid in the order book.
- The 3.4x ratio between BTC's and SPY's worst-day losses defines the risk-budgeting challenge for a multi-asset portfolio.
- Answered the research question: assets with the highest unconditional volatility also have the most asymmetric tails, and those tails are structurally unhedgeable through conventional correlation-based methods.

---

## SQL Q6: Moving Average Crossover Analysis

### Slide 1 — Table

**Research Question:** How frequently do short-term price trends deviate from medium-term baselines across different assets?

- Calculated 20-day and 60-day simple moving averages per asset using `stats::filter(Close, rep(1/20, 20), sides = 1)`.
- Assigned a `Signal` — Bearish, Bullish, or Neutral — based on whether the 20-day MA sat above or below the 60-day MA.
- Grouped by Asset and Signal to compute mean and standard deviation of daily returns per regime.
- BTC generated 15 crossovers, more than twice as many as AAPL (6), SPY (8), or BDO (6).
- AAPL's bullish mean return (0.15%) was 1.2x its bearish return (0.13%), the narrowest gap among the assets.
- BDO and SPY showed bearish mean returns exceeding bullish means, reflecting the sample's strong upward drift.

### Slide 2 — Figure (fig_q6.pdf)

- **Figure 6** overlays the 20-day (blue) and 60-day (red) moving averages on closing prices from 2024 to 2025, faceted by asset.
- The crossover points mark every signal reversal — BTC's panel shows frequent MA crossings, reflecting noisy short-term price action.
- BTC's bullish mean return reached 0.35%, exceeding its bearish mean of 0.09%, offering a exploitable long-side bias.
- SPY's bullish mean (0.06%) was below its bearish mean (0.18%), driven by the sample's strong upward trend overwhelming short-term signals.
- Answered the research question: crossover frequency varies 2.5x across assets, and BTC's trend signal is too asymmetric to support a market-neutral approach.

---

## SQL Q7: Volume and Volatility Relationship

### Slide 1 — Table

**Research Question:** Does elevated trading volume systematically coincide with higher daily price volatility?

- Joined daily returns with volume data from the `assets_all` raw table via `left_join`.
- Defined the high-volume regime as days in the top quartile (`quantile(Volume, 0.75)`) per asset.
- Grouped by Asset and Volume_Regime to compute mean return, mean absolute return, and volatility.
- In every asset, the high-volume regime produced mean absolute returns approximately double the normal-volume regime (e.g. SPY: 1.60% vs. 0.61%; BTC: 3.05% vs. 1.83%).
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
- During high-fear periods, AAPL posted -0.51% and SPY -0.41%, while BDO showed -0.15% and BTC surprisingly -0.31%.
- BTC's mean return in high-fear periods was negative at -0.31%, contradicting the earlier finding that crypto hedges volatility.
- The high-fear regime contained 150 observations per asset, approximately 9.6% of the total sample.

### Slide 2 — Figure (fig_q8.pdf)

- **Figure 8** plots mean daily return by VIX regime as a grouped bar chart, blue for low fear and red for high fear.
- No asset's high-fear bar extended above zero — all four assets showed negative mean returns during VIX > 30 periods.
- AAPL's low-fear mean (0.25%) was substantially higher than BDO's (0.08%), establishing a clear calm-market hierarchy.
- The COVID-19 crash from Q2 drove the high-fear regime, with BTC's larger negative return reflecting extreme tail events.
- Answered the research question: VIX regime determines cross-asset return rankings — during high fear, all assets decline, with SPY showing the smallest mean negative return.

---

## SQL Q9: Interest Rate Sensitivity

### Slide 1 — Table

**Research Question:** How sensitive is each asset's daily return to changes in the 10-year Treasury yield?

- Computed daily changes in the 10-year yield via `DGS10_Change = DGS10 - lag(DGS10)` per asset.
- Assigned each day to Yields Rising, Yields Falling, or No Change based on the sign of the change.
- Grouped by Asset and Yield_Direction to produce conditional mean returns.
- During rising-yield periods, all four assets posted positive returns — BTC (0.23%), AAPL (0.15%), SPY (0.15%), BDO (0.08%).
- SPY was the only asset with a negative mean return (-0.01%) when yields fell, indicating falling yields signalled deteriorating growth expectations.

### Slide 2 — Figure (fig_q9.pdf)

- **Figure 9** plots mean daily return conditional on yield direction, orange for rising yields and blue for falling yields.
- Every asset shows a positive orange bar, contradicting the textbook DCF intuition that higher rates mechanically lower prices.
- The growth-signalling channel dominated the discount-rate channel: rising yields reflected improving growth expectations, not restrictive monetary policy.
- BDO showed near-zero sensitivity at 0.00% in falling-yield periods against 0.07% in rising-yield periods, a structurally negligible difference.
- Answered the research question: rate sensitivity varies by asset, but the dominant transmission channel is growth expectations — a short-equity-on-rising-yields strategy would have been systematically wrong throughout the sample.

---

## SQL Q10: Inflation Hedge Performance

### Slide 1 — Table

**Research Question:** Which assets served as the most effective inflation hedges during the high-inflation period of 2021 to 2023?

- Filtered the dataset to the window where CPI year-on-year exceeded 5% (June 2021 to February 2023).
- Computed cumulative returns per asset using `cumprod(1 + Daily_Return) - 1` within the filtered window.
- Summarised start and end dates, CPI boundaries, total cumulative return, and mean daily return per asset.
- BDO generated the highest cumulative return at 45.3%, followed by AAPL at 28.7%.
- SPY eked out a 2.4% gain, while BTC collapsed by 38.0% — the asset marketed as digital gold delivered the worst inflation-hedging performance.
- All four assets share 456 high-inflation observations after the forward-fill procedure.

### Slide 2 — Figure (fig_q10.pdf)

- **Figure 10** plots cumulative return during the high-inflation window as horizontal bars, ranked best to worst.
- BDO's bar leads at +45.3%, SPY's near-zero at +2.4%, and BTC's extends deep into negative territory at -38.0%.
- BDO's performance was structural rather than coincidental: Philippine banks widen net interest margins when floating-rate loans reprice upward while deposit rates adjust slowly.
- BTC's 38.0% loss was the most informative negative data point: no cash flows, no contractual repricing mechanism, and no fundamental valuation floor meant the asset collapsed when the Fed withdrew liquidity.
- Answered the research question: an emerging-market commercial bank — not gold, not Bitcoin — provided the most effective inflation hedge, while the asset with the highest stand-alone total return in Q4 became the worst performer during the inflation window.
