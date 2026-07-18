DATA CLEANING 
DATA CLEANING 
DATA CLEANING 
Unified three asset calendars (NYSE, PSE, 24/7) into one 1,566-day business calendar to remove
exchange-specific holiday dependencies (Ghysels et al., 2016)
LOCF-forward-filled monthly CPI and FEDFUNDS (step functions) to avoid interpolating non-existent
prices (Fama, 1970)
Recalculated BTC returns as business-day closes (Mon/Fri) since 24/7 formula used Sunday closes
lost after weekend removal (Corbet et al., 2018)
LOCF-forward-filled asset closes on exchange holidays with zero returns on non-trading days
(Schmidbauer et al., 2018)
Computed CPI YoY on raw monthly data pre-fill to avoid fill-induced inflation spikes
All joins yielded identical 1,566-row outputs (zero unmatched); retained left_join to preserve asset
calendar as base
