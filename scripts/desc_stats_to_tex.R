# Standalone TeX exporter for descriptive statistics and correlation matrix
# Called from finstad_analysis.qmd via source()
# Reads CSVs produced by the QMD, writes LaTeX table snippets for the paper

data_dir <- if (dir.exists("data")) "data" else "../data"
out_dir  <- if (dir.exists("reports/sections")) "reports/sections" else "../reports/sections"

desc <- read.csv(file.path(data_dir, "descriptive_stats.csv"), stringsAsFactors = FALSE)

sink(file.path(out_dir, "descriptive_stats_table.tex"))
cat("\\begin{table}[H]\n\\centering\n")
cat("\\caption{Descriptive Statistics of Final Dataset Variables}\n")
cat("\\label{tab:descriptive_stats}\n")
n_cols <- ncol(desc) - 1L
cat(sprintf("\\begin{tabular}{l%s}\n", paste(rep("r", n_cols), collapse = "")))
cat("\\toprule\n")
cat(paste(names(desc), collapse = " & "), "\\\\\n")
cat("\\midrule\n")
for (i in seq_len(nrow(desc))) {
  vals <- desc[i, ]
  formatted <- vapply(seq_along(vals), function(j) {
    if (j == 1L) return(as.character(vals[[j]]))
    sprintf("%.4f", as.numeric(vals[[j]]))
  }, character(1L))
  cat(paste(formatted, collapse = " & "), "\\\\\n")
}
cat("\\bottomrule\n\\end{tabular}\n\\end{table}\n")
sink()

cor_mat <- read.csv(file.path(data_dir, "correlation_matrix.csv"),
                    stringsAsFactors = FALSE, row.names = 1L)

sink(file.path(out_dir, "correlation_matrix_table.tex"))
cat("\\begin{table}[H]\n\\centering\n")
cat("\\caption{Correlation Matrix: Daily Returns \\& Macroeconomic Variables}\n")
cat("\\label{tab:correlation_matrix}\n")
n_vars <- ncol(cor_mat)
cat(sprintf("\\begin{tabular}{l%s}\n", paste(rep("r", n_vars), collapse = "")))
cat("\\toprule\n")
cat(" & ", paste(colnames(cor_mat), collapse = " & "), "\\\\\n")
cat("\\midrule\n")
for (i in seq_len(nrow(cor_mat))) {
  cat(rownames(cor_mat)[i])
  for (j in seq_len(ncol(cor_mat))) {
    cat(sprintf(" & %.4f", cor_mat[i, j]))
  }
  cat("\\\\\n")
}
cat("\\bottomrule\n\\end{tabular}\n\\end{table}\n")
sink()
