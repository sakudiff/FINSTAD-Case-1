5
SQL Section Q1
SQL Section Q1
SQL Section Q1
Which asset delivered the highest return per unit of risk over the 2020 to 2025 sample period?
Computed a Sharpe-like ratio by dividing each asset's mean daily return by its standard deviation.
Sorted assets descending: BDO (0.0524), BTC (0.0520), AAPL (0.0392), SPY (0.0353).
Constructed the metric via `group_by(Asset) |> summarise(Mean_Daily_Return, SD_Daily_Return) |> mutate(Risk_Adjusted_Return)`.
Extended the query with `arrange(desc(Risk_Adjusted_Return))` to produce the final ranking.
Added a benchmark reference line at SPY's ratio (0.0353) to contextualize relative performance.
