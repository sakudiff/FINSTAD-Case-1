library(DBI)
library(RSQLite)
library(dplyr)
library(tidyr)
library(lubridate)

con <- dbConnect(RSQLite::SQLite(), "data/master_dataset.sqlite")
fin_data <- tbl(con, "integrated_data")
fix_date <- function(x) as.Date(as.numeric(x), origin = "1970-01-01")
sd <- "reports/sections"

# Q6
q6_raw <- fin_data |> select(Date, Asset, Close, Daily_Return) |> collect()
q6_raw$Date <- fix_date(q6_raw$Date)
q6_ma <- q6_raw |> filter(!is.na(Close)) |>
  group_by(Asset) |> arrange(Date) |>
  mutate(MA20 = as.numeric(stats::filter(Close, rep(1/20, 20), sides = 1)),
         MA60 = as.numeric(stats::filter(Close, rep(1/60, 60), sides = 1)),
         Signal = case_when(MA20 > MA60 ~ "Bullish", MA20 < MA60 ~ "Bearish", TRUE ~ "Neutral")) |>
  ungroup()
q6 <- q6_ma |> filter(!is.na(MA20), !is.na(MA60), !is.na(Daily_Return)) |>
  group_by(Asset, Signal) |>
  summarise(Mean_Daily_Return = mean(Daily_Return, na.rm = TRUE),
            SD_Daily_Return = sd(Daily_Return, na.rm = TRUE),
            Observations = n(), .groups = "drop") |>
  arrange(Asset, desc(Mean_Daily_Return))

sink(file.path(sd, "q6_table.tex"))
cat("\\begin{table}[H]\n\\centering\n\\caption{Q6 Data Output}\n\\label{tab:q6}\n")
cat("\\begin{tabular}{llrrr}\n\\toprule\n")
cat("Asset & Signal & Mean\\_Daily\\_Return & SD\\_Daily\\_Return & Obs \\\\\n\\midrule\n")
for (i in 1:nrow(q6)) {
  cat(sprintf("%s & %s & %.4f & %.4f & %d \\\\\n",
              q6$Asset[i], q6$Signal[i], q6$Mean_Daily_Return[i],
              q6$SD_Daily_Return[i], q6$Observations[i]))
}
cat("\\bottomrule\n\\end{tabular}\n\\end{table}\n")
sink()
cat("Wrote q6_table.tex\n")

# Q7 - Volume data from raw CSVs
aapl <- read.csv("data/AAPL.csv")
bdo  <- read.csv("data/BDO.csv", fileEncoding = "UTF-8-BOM")
btc  <- read.csv("data/BTC.csv")
spy  <- read.csv("data/SPY.csv")

aapl$Date <- as.Date(ymd_hms(aapl$Date))
bdo$Date  <- mdy(bdo$Date)
btc$Date  <- as.Date(ymd_hms(btc$Date))
spy$Date  <- as.Date(ymd_hms(spy$Date))

cd <- seq.Date(as.Date("2020-01-01"), as.Date("2025-12-31"), by = "day")
cd <- cd[!weekdays(cd) %in% c("Saturday", "Sunday")]
can <- data.frame(Date = cd)

jf <- function(x) {
  x <- x |> filter(Date >= "2020-01-01", Date <= "2025-12-31")
  can |> left_join(x, by = "Date") |> arrange(Date)
}
aapl <- jf(aapl); bdo <- jf(bdo); btc <- jf(btc); spy <- jf(spy)
bdo <- bdo |> rename(Close = Price)
parse_bdo_volume <- function(x) {
  x <- gsub(",", "", x)
  mult <- ifelse(grepl("M", x, ignore.case = TRUE), 1e6,
                 ifelse(grepl("K", x, ignore.case = TRUE), 1e3, 1))
  x_num <- as.numeric(gsub("[A-Za-z%]", "", x))
  x_num * mult
}
bdo$Volume <- parse_bdo_volume(bdo$Vol.)
aapl$Volume <- as.numeric(aapl$Volume)
btc$Volume <- as.numeric(btc$Volume)
spy$Volume <- as.numeric(spy$Volume)

calc_dr <- function(df) df |> arrange(Date) |> mutate(Daily_Return = (Close / lag(Close)) - 1)
aapl <- calc_dr(aapl); bdo <- calc_dr(bdo); btc <- calc_dr(btc); spy <- calc_dr(spy)

assets_all <- bind_rows(
  aapl |> mutate(Asset = "AAPL"), bdo |> mutate(Asset = "BDO"),
  btc |> mutate(Asset = "BTC"), spy |> mutate(Asset = "SPY")
)

fin_data2 <- fin_data |> collect()
fin_data2$Date <- fix_date(fin_data2$Date)

q7 <- assets_all |> select(Date, Asset, Volume) |>
  mutate(Date = as.Date(Date), Volume = as.numeric(Volume)) |>
  inner_join(fin_data2 |> select(Date, Asset, Daily_Return), by = c("Date", "Asset")) |>
  filter(!is.na(Daily_Return), !is.na(Volume), Volume > 0) |>
  group_by(Asset) |>
  mutate(Threshold = quantile(Volume, 0.75, na.rm = TRUE),
         Regime = if_else(Volume >= Threshold, "High Volume Days", "Normal Volume Days"),
         AbsRet = abs(Daily_Return)) |>
  ungroup() |>
  group_by(Asset, Regime) |>
  summarise(Observations = n(),
            Mean_Daily_Return = mean(Daily_Return, na.rm = TRUE),
            Mean_Absolute_Return = mean(AbsRet, na.rm = TRUE),
            Volatility = sd(Daily_Return, na.rm = TRUE),
            Average_Volume = mean(Volume, na.rm = TRUE),
            .groups = "drop") |>
  arrange(Asset, Regime)

sink(file.path(sd, "q7_table.tex"))
cat("\\begin{table}[H]\n\\centering\n\\caption{Q7 Data Output}\n\\label{tab:q7}\n")
cat("\\begin{tabular}{llrrrrr}\n\\toprule\n")
cat("Asset & Volume\\_Regime & Obs & Mean\\_Daily\\_Return & Mean\\_Abs\\_Return & Volatility & Avg\\_Volume \\\\\n\\midrule\n")
for (i in 1:nrow(q7)) {
  cat(sprintf("%s & %s & %d & %.4f & %.4f & %.4f & %.0f \\\\\n",
              q7$Asset[i], q7$Regime[i], q7$Observations[i],
              q7$Mean_Daily_Return[i], q7$Mean_Absolute_Return[i],
              q7$Volatility[i], q7$Average_Volume[i]))
}
cat("\\bottomrule\n\\end{tabular}\n\\end{table}\n")
sink()
cat("Wrote q7_table.tex\n")

# Q8
q8_raw <- fin_data |> filter(!is.na(VIX)) |> select(Asset, Date, Daily_Return, VIX) |> collect()
q8_raw$Date <- fix_date(q8_raw$Date)
q8 <- q8_raw |>
  mutate(VIX_Regime = case_when(
    VIX > 30 ~ "High Volatility (VIX > 30)",
    VIX < 20 ~ "Low Volatility (VIX < 20)",
    TRUE ~ "Moderate (20 <= VIX <= 30)"
  )) |>
  group_by(Asset, VIX_Regime) |>
  summarise(Mean_Daily_Return = mean(Daily_Return, na.rm = TRUE),
            SD_Daily_Return = sd(Daily_Return, na.rm = TRUE),
            Observations = n(), .groups = "drop") |>
  arrange(Asset, VIX_Regime)

sink(file.path(sd, "q8_table.tex"))
cat("\\begin{table}[H]\n\\centering\n\\caption{Q8 Data Output}\n\\label{tab:q8}\n")
cat("\\begin{tabular}{llrrr}\n\\toprule\n")
cat("Asset & VIX\\_Regime & Mean\\_Daily\\_Return & SD\\_Daily\\_Return & Obs \\\\\n\\midrule\n")
for (i in 1:nrow(q8)) {
  cat(sprintf("%s & %s & %.4f & %.4f & %d \\\\\n",
              q8$Asset[i], q8$VIX_Regime[i], q8$Mean_Daily_Return[i],
              q8$SD_Daily_Return[i], q8$Observations[i]))
}
cat("\\bottomrule\n\\end{tabular}\n\\end{table}\n")
sink()
cat("Wrote q8_table.tex\n")

# Q9
q9_raw <- fin_data |> filter(!is.na(DGS10)) |> select(Asset, Date, Daily_Return, DGS10) |> collect()
q9_raw$Date <- fix_date(q9_raw$Date)
q9 <- q9_raw |> group_by(Asset) |> arrange(Date) |>
  mutate(Chg = DGS10 - lag(DGS10)) |> ungroup() |> filter(!is.na(Chg)) |>
  mutate(Yield_Direction = case_when(
    Chg > 0 ~ "Yields Rising", Chg < 0 ~ "Yields Falling", TRUE ~ "No Change"
  )) |>
  group_by(Asset, Yield_Direction) |>
  summarise(Mean_Daily_Return = mean(Daily_Return, na.rm = TRUE),
            SD_Daily_Return = sd(Daily_Return, na.rm = TRUE),
            Observations = n(), .groups = "drop") |>
  arrange(Asset, Yield_Direction)

sink(file.path(sd, "q9_table.tex"))
cat("\\begin{table}[H]\n\\centering\n\\caption{Q9 Data Output}\n\\label{tab:q9}\n")
cat("\\begin{tabular}{llrrr}\n\\toprule\n")
cat("Asset & Yield\\_Direction & Mean\\_Daily\\_Return & SD\\_Daily\\_Return & Obs \\\\\n\\midrule\n")
for (i in 1:nrow(q9)) {
  cat(sprintf("%s & %s & %.4f & %.4f & %d \\\\\n",
              q9$Asset[i], q9$Yield_Direction[i], q9$Mean_Daily_Return[i],
              q9$SD_Daily_Return[i], q9$Observations[i]))
}
cat("\\bottomrule\n\\end{tabular}\n\\end{table}\n")
sink()
cat("Wrote q9_table.tex\n")

# Q10
q10_raw <- fin_data |> select(Date, Asset, Daily_Return, CPI_YoY) |> collect()
q10_raw$Date <- fix_date(q10_raw$Date)
q10 <- q10_raw |>
  filter(!is.na(CPI_YoY) & CPI_YoY > 0.05, !is.na(Daily_Return)) |>
  group_by(Asset) |> arrange(Date) |>
  mutate(Cum = cumprod(1 + Daily_Return) - 1) |>
  summarise(Start_Date = as.character(min(Date)),
            End_Date = as.character(max(Date)),
            Start_CPI_YoY = first(CPI_YoY),
            End_CPI_YoY = last(CPI_YoY),
            Total_Cumulative_Return = last(Cum),
            Mean_Daily_Return = mean(Daily_Return, na.rm = TRUE),
            Observations = n(), .groups = "drop") |>
  arrange(desc(Total_Cumulative_Return))

sink(file.path(sd, "q10_table.tex"))
cat("\\begin{table}[H]\n\\centering\n\\caption{Q10 Data Output}\n\\label{tab:q10}\n")
cat("\\begin{tabular}{lllrrrrr}\n\\toprule\n")
cat("Asset & Start\\_Date & End\\_Date & Start\\_CPI\\_YoY & End\\_CPI\\_YoY & Total\\_Cumulative\\_Return & Mean\\_Daily\\_Return & Obs \\\\\n\\midrule\n")
for (i in 1:nrow(q10)) {
  cat(sprintf("%s & %s & %s & %.4f & %.4f & %.4f & %.4f & %d \\\\\n",
              q10$Asset[i], q10$Start_Date[i], q10$End_Date[i],
              q10$Start_CPI_YoY[i], q10$End_CPI_YoY[i],
              q10$Total_Cumulative_Return[i], q10$Mean_Daily_Return[i],
              q10$Observations[i]))
}
cat("\\bottomrule\n\\end{tabular}\n\\end{table}\n")
sink()
cat("Wrote q10_table.tex\n")

dbDisconnect(con)
