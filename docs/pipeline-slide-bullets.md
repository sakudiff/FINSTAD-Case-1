# Pipeline Figure Bullet Points

-   Three incompatible asset calendars (NYSE, PSE, 24/7) unified into a single five-day business calendar of 1,566 trading days to eliminate unreproducible exchange-specific holiday dependencies, justified by Ghysels et al. (2016)
-   Macroeconomic gaps from monthly CPI and meeting-based FEDFUNDS forward-filled via LOCF rather than interpolated because both series are step functions and interpolation would fabricate price levels that never existed, justified by Fama (1970)
-   BTC returns recalculated on business-day basis (Monday return = Mon Close / Fri Close - 1) because the original 24/7 formula referenced Sunday closes absent after weekend row removal, justified by Corbet et al. (2018)
-   Asset close prices forward-filled on exchange holidays via LOCF with non-trading day daily returns set to zero, justified by Schmidbauer et al. (2018)
-   CPI year-over-year computed on raw monthly data before forward-fill because computing on the step function produces artificial inflation spikes that are artifacts of the fill procedure rather than genuine economic signals
-   All four join types returned identical 1,566-row output after forward-fill with zero unmatched rows confirmed by anti_join; left_join retained to preserve asset calendar as analytical base

## Limitations

-   Mon-Fri calendar overcounts tradable days by 10 to 15 days per year per exchange because exchange-specific holiday lists reduce reproducibility and introduce external dependencies
-   LOCF may lag the actual policy rate by up to two weeks during structural breaks such as emergency FOMC rate cuts because the last known observation remains the best estimate until the next scheduled release
-   Weekend cryptocurrency trading days discarded under the portfolio construction framework because weekend-only BTC price movements carry no economic weight for a portfolio constrained to equity market hours