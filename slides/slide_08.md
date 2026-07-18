5
SQL Section Q3
SQL Section Q3
SQL Section Q3
What is the cross-asset correlation of daily returns, and which assets offer the strongest diversification potential?
Transformed daily returns into wide format via `pivot_wider(names_from = Asset, values_from = Daily_Return)`.
Computed the Pearson correlation matrix using `cor(use = "pairwise.complete.obs")`.
Reshaped the matrix to long format via `pivot_longer` for visual mapping.
Found the AAPL-SPY pair produced the highest coefficient at 0.787, a mechanical consequence of Apple's
weighting in the S&P 500.
BDO formed a distinct diversification tier with average cross-correlation of 0.090.
