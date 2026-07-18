5
SQL Section Q9
SQL Section Q9
SQL Section Q9
How sensitive is each asset's daily return to changes in the 10-year Treasury yield?
- Computed daily changes in the 10-year yield via `DGS10_Change = DGS10 - lag(DGS10)` per asset.
- Assigned each day to Yields Rising, Yields Falling, or No Change based on the sign of the change.
- Grouped by Asset and Yield_Direction to produce conditional mean returns.
- During rising-yield periods, all four assets posted positive returns — BTC (0.20%), BDO (0.13%), AAPL (0.11%), SPY (0.10%).
- During falling-yield periods, BDO posted 0.12% and BTC 0.17%, while SPY was near-zero at 0.01%.
