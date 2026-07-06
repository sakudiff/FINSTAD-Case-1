# FINSTAD Case 1 — Project Repository

**Course:** FINSTAD \| **Section:** C01 \| **Group:** 3

### Group Members:

1.  CRUZ, Ricardo Miguel Iñigo
2.  GALEDO, Enrique Lorenzo Hermoso
3.  SEBALLOS, Josiah Dweyn Panganiban
4.  SEECHUNG, Camille Castro
5.  SISON, Aaron Joshua Estacio

------------------------------------------------------------------------

### Task Sign-Up Sheet

This project has been broken down into granular tasks mapping the coding (`.qmd`) and writing (`.tex`) requirements. Please put your name next to the sections you will take on.

- [x] **Sec 1-2: Intro & Data Sources** *(App A1-A3)*
  - **R Code:** Load all 8 CSVs. Generate summary table of missing values, duplicates, and initial observations.
  - **Paper:** Write **Sec 1** (Introduction) and **Sec 2** (Data Sources and Acquisition).
  - **Assignee:** Enrique
- [x] **Sec 3-4: Cleaning & Integration** *(App A4-A6)*
  - **R Code:** Clean data, calculate daily returns, execute `dplyr` joins, set up SQLite master database.
  - **Paper:** Write **Sec 3** (Data Cleaning) and **Sec 4** (Database Integration) including the observation reduction table.
  - **Assignee:** Aaron
- [x] **Sec 5: SQL Q1-Q3** *(App A7-A9)*
  - **R Code:** Write `DBI/RSQLite` queries for the first 3 financial questions.
  - **Paper:** Write **Sec 5** (SQL-Based Financial Investigation) for Q1-Q3.
  - **Assignee:** Aaron
- [x] **Sec 5: SQL Q4-Q7** *(App A10-A13)*
  - **R Code:** Write `DBI/RSQLite` queries for 4 more financial questions.
  - **Paper:** Write **Sec 5** (SQL-Based Financial Investigation) for Q4-Q7.
  - **Assignee:** Iñigo
- [x] **Sec 5: SQL Q8-Q10** *(App A14-A16)*
  - **R Code:** Write `DBI/RSQLite` queries for the last 3 financial questions.
  - **Paper:** Write **Sec 5** (SQL-Based Financial Investigation) for Q8-Q10.
  - **Assignee:** Aaron
- [ ] **Sec 6: Descriptive Statistics** *(N/A)*
  - **R Code:** Code `summarise()` for mean, variance, skewness, kurtosis, min/max.
  - **Paper:** Write **Sec 6** (Descriptive Statistical Analysis).
  - **Assignee:** Enrique
- [x] **Sec 7: Data Visualization** *(App A17)*
  - **R Code:** Generate `ggplot2` charts for SQL findings.
  - **Paper:** Write **Sec 7** (Data Visualization).
  - **Assignee:** Josiah
- [ ] **Sec 8: Exploratory Analysis** *(App A18)*
  - **R Code:** Exploratory data visualization and synthesis.
  - **Paper:** Write **Sec 8** (Exploratory Financial Analysis).
  - **Assignee:** Camille
- [ ] **Sec 9, 11: Recommendation & Conclusion** *(N/A)*
  - **R Code:** *(No code required, relies on previous outputs)*
  - **Paper:** Write **Sec 9** (Investment Recommendation) and **Sec 11** (Conclusion).
  - **Assignee:** Camille
- [ ] **Sec 10: Exec Dashboard** *(N/A)*
  - **R Code:** Code the 1-page dashboard layout in `.qmd` (or format in PPT).
  - **Paper:** Write **Sec 10** (Executive Dashboard) and **Executive Summary**.
  - **Assignee:** Josiah
- [ ] **Presentation Deck**
  - **R Code:** Migrate the best charts and tables from `.qmd` into slides.
  - **Paper:** Create the 10-minute **Presentation Deck** (Canva/PPT).
  - **Assignee:** Josiah
- [x] **Lead LaTeX Editor**
  - **R Code:** Ensure the `.qmd` outputs successfully compile into the final `.pdf`.
  - **Paper:** Manage `finstad_report.tex` formatting, table layouts, and APA citations.
  - **Assignee:** Assistant

## Table of Contents

-   [Project Structure](#project-structure)
-   [Welcome to GitHub! (A Guide for Beginners)](#welcome-to-github-a-guide-for-beginners)
    -   [Navigating the GitHub Website](#navigating-the-github-website)
-   [How to Get this Code into R Studio (Cloning)](#how-to-get-this-code-into-r-studio-cloning)
-   [How to Contribute & Save Your Work (The Pull Request Workflow)](#how-to-contribute--save-your-work-the-pull-request-workflow)
    -   [What is a Branch?](#what-is-a-branch)
    -   [What is a Pull Request (PR)?](#what-is-a-pull-request-pr)
    -   [A Quick Tour of R Studio — Where Do I Type What?](#a-quick-tour-of-r-studio--where-do-i-type-what)
    -   [The Step-by-Step Workflow](#the-step-by-step-workflow)
-   [Our Two Main Files: The .qmd and The .tex — What's the Difference?](#our-two-main-files-the-qmd-and-the-tex--whats-the-difference)
    -   [How They Work Together](#how-they-work-together-the-simple-flow)
-   [LaTeX Basics: How to Add Content to Your .tex File](#latex-basics-how-to-add-content-to-your-tex-file)
    -   [Adding Regular Text](#adding-regular-text)
    -   [Making Text Bold, Italic, or Underlined](#making-text-bold-italic-or-underlined)
    -   [Adding Section Headings](#adding-section-headings)
    -   [Adding a Table](#adding-a-table)
    -   [Adding an Image (Chart / Figure)](#adding-an-image-chart--figure)
    -   [Adding a Bullet List](#adding-a-bullet-list)
    -   [Adding a Numbered List](#adding-a-numbered-list)
    -   [Adding Math (If Needed)](#adding-math-if-needed)
    -   [How to Put Your R Output Into the .tex](#how-to-put-your-r-output-into-the-tex)
-   [Pro Tips for Working with Both Files](#pro-tips-for-working-with-both-files)

------------------------------------------------------------------------

## Project Structure {#project-structure}

Here is how our project files are organized:

-   `/data/` — Where we will store our downloaded datasets (CSV, Excel). This includes our chosen US Asset, PH Asset, Crypto, SPY, and FRED macroeconomic data.
-   `/scripts/` — Where our analysis code lives. The main file here is `finstad_analysis.qmd` (a Quarto Markdown file) — this is where we write R code, run analysis, make charts, and test our findings.
-   `/reports/` — Where our formatted report lives. The main file here is `finstad_report.tex` (a LaTeX file) — this is where we assemble the final APA-formatted PDF paper using the polished results from our analysis.
-   `/presentations/` — Where we will store our presentation slide deck and Executive Dashboard.
-   `guidelines.md` — The project requirements and rubric provided by the instructor.

------------------------------------------------------------------------

## Welcome to GitHub! (A Guide for Beginners) {#welcome-to-github-a-guide-for-beginners}

If you haven't used GitHub before, don't worry! Think of GitHub as a highly organized **Google Drive specifically for code**.

Instead of saving files as `analysis_final_final_v2.R`, GitHub tracks every single change we make. It allows all of us to work on the project at the same time without accidentally deleting each other's work.

### Navigating the GitHub Website {#navigating-the-github-website}

When you view this repository on the GitHub website, you will see a list of folders and files. You can click on any folder (like `scripts/`) to see what's inside, or click on a file to read its contents. This page you are reading right now is the `README.md` file, which is automatically displayed on the front page of the repository.

------------------------------------------------------------------------

## How to Get this Code into R Studio (Cloning) {#how-to-get-this-code-into-r-studio-cloning}

To work on the project, you need to "clone" (download) this repository onto your computer using R Studio.

1.  Create a free account on [GitHub](https://github.com/).
2.  Open **R Studio**.
3.  Go to **File** \> **New Project...**
4.  Select **Version Control** \> **Git**.
5.  In the "Repository URL" box, paste the URL of this GitHub repository.
6.  Choose where you want to save the project folder on your computer.
7.  Click **Create Project**.

Now you have a local copy of our project on your computer!

------------------------------------------------------------------------

## How to Contribute & Save Your Work (The Pull Request Workflow)

When you make changes to files in R Studio, they only save to your personal computer. To share your work with the group on GitHub, we use a system called **Branches** and **Pull Requests (PRs)**.

### What is a Branch? {#what-is-a-branch}

Think of a branch as a separate sandbox or parallel universe. Instead of all 5 of us editing the exact same files at the same time (which causes messy conflicts), you create your own branch to work on your specific task.

### What is a Pull Request (PR)? {#what-is-a-pull-request-pr}

A Pull Request is how you ask the group to review your work before it gets added to the main, official version of the project. - **Why we use it:** It protects our main code from accidental deletions or breaking errors. It also lets us see what everyone else is doing. - **When will others see your changes?** They can see your branch immediately after you push it, but your code won't affect the official `main` project until the PR is merged.

### A Quick Tour of R Studio — Where Do I Type What?

If you open R Studio, you'll see a few different panels. Here's what each one is for:

-   **Source Editor (top-left)** — This is like a Word document for your code. You can write R scripts, open the `.qmd` file, edit this README, and save your work here. When you type code in the Source Editor, it doesn't run until you click the **Run** button or press **Ctrl+Enter**. Think of it as your notebook where you draft your analysis before "publishing" it.

-   **Console / Terminal (bottom-left)** — This is where commands actually get executed. There are actually *two* tabs here:

    -   The **Console** tab — This is for running R code line by line. If you type `2 + 2` here and press Enter, R calculates it immediately.
    -   The **Terminal** tab — This is for system commands like Git. **When the instructions below say "type these commands in the Terminal,"** click the **Terminal** tab first (next to the Console tab). Then type your `git` commands there.

-   **Environment / History (top-right)** — This shows all the data and variables you've loaded into R. If you import a dataset, it will appear here.

-   **Files / Plots / Packages / Help (bottom-right)** — This shows your project files, any charts you make, installed packages, and help documentation.

**The golden rule:** Write your R analysis code in the **Source Editor** (top-left), and type your Git commands in the **Terminal** tab (bottom-left).

### The Step-by-Step Workflow {#the-step-by-step-workflow}

**To save your work, open the "Terminal" tab in R Studio (usually next to the Console tab at the bottom left) and type these commands in order:**

#### Step 1: Create your own branch

Before you start typing any code today, make sure you are on a new branch. **You need to pick a branch name that describes what you're working on.** Replace `your-name` with your actual name and what you're doing (e.g., `feat/joshua-data-cleaning` for data cleaning, `feat/camille-visualizations` for charts, `feat/enrique-report` for writing the report):

``` bash
git switch -c feat/your-name-what-youre-doing
```

**⬆️ FILL THIS IN.** Example: `git switch -c feat/joshua-data-cleaning` *(This creates your sandbox and moves you into it).*

#### Step 2: Do your work!

Write your R code, make your graphs, save your files in R Studio.

#### Step 3: Package your changes (Stage & Commit)

When you are ready to upload your work, you need to label what you did.

``` bash
git add .
```

*(This tells Git "I want to save ALL the files I just edited").*

``` bash
git commit -m "Write a short description of what you changed here"
```

**⬆️ FILL THIS IN.** Example: `git commit -m "Added dplyr code for merging datasets"` *(Make sure to write a descriptive message so the group knows what you did).*

#### Step 4: Upload your branch to GitHub (Push)

Send your labeled work to the cloud!

``` bash
git push -u origin HEAD
```

#### Step 5: Open a Pull Request (PR)

Go to our project page on the GitHub website. You will see a green button that says **"Compare & pull request"**. Click it, write a short description of what you did, and click **"Create pull request"**.

Once the group reviews it and clicks **Merge**, your code becomes part of the official project!

------------------------------------------------------------------------

## Our Two Main Files: The `.qmd` and The `.tex` — What's the Difference?

You'll notice we have two important files in this project:

### `scripts/finstad_analysis.qmd` — The "Do the Work" File

-   **What it is:** A Quarto Markdown file (like a smart, mix-code-and-words document). Think of it as your lab notebook where you write R code, run it, see the results, and write your analysis all in one place.
-   **What it does:** You write R code inside special blocks called "code chunks." When you "render" this file, R runs all the code, generates the tables and charts, and stitches everything together into a final HTML or PDF document.
-   **When to use it:** During the analysis phase — when you're downloading data, cleaning it, merging it, running SQL queries, calculating statistics, making charts, and figuring out your findings.

### `reports/finstad_report.tex` — The "Make It Look Pretty" File

-   **What it is:** A LaTeX file (pronounced *lah-tech*). LaTeX is a typesetting system — think of it as the professional version of Microsoft Word, but instead of clicking buttons to bold text, you type commands like `\textbf{bold text}`. It's what academics use to write papers because it handles formatting, citations, tables, and page layout perfectly every time.
-   **What it does:** It takes the final polished results from your `.qmd` file and lays them out in a beautiful APA 7th-edition formatted report with proper headings, margins, page numbers, and a table of contents. When you compile it, it produces a PDF (you can find the latest one at `reports/finstad_report.pdf`).
-   **When to use it:** After the analysis is done — when you're ready to write the final report with your introduction, methodology, results, and investment recommendation.

### How They Work Together (The Simple Flow) {#how-they-work-together-the-simple-flow}

```         
Step 1: Do your analysis in the .qmd file
        (write R code, run it, see charts, find answers)
                │
                ▼
Step 2: Copy your final numbers, tables, and charts 
        into the .tex file as the "fancy report"
                │
                ▼
Step 3: Render the .tex file into a PDF 
        (beautiful, ready-to-submit paper)
```

> **💡 The `.tex` file compiles into a PDF.** Every time you "render" or "compile" the LaTeX file, it produces a polished, publication-ready PDF document. You can see the latest compiled version right here in our repository at **`reports/finstad_report.pdf`** — that's the finished report ready for submission!

**Think of it this way:** The `.qmd` file is where you cook the meal (do the messy work, taste-test, adjust seasoning). The `.tex` file is where you plate it for the final presentation (everything neat, garnished, and ready to serve).

------------------------------------------------------------------------

## LaTeX Basics: How to Add Content to Your `.tex` File

You don't need to become a LaTeX expert — just a few simple commands will let you add everything you need.

### Adding Regular Text {#adding-regular-text}

Just type normally between sections. Paragraphs are separated by a blank line:

``` latex
This is a normal paragraph. Everything here will  
appear in the report as plain text.

This is a new paragraph. See? Just leave a blank line.
```

### Making Text Bold, Italic, or Underlined {#making-text-bold-italic-or-underlined}

``` latex
\textbf{This will be bold}        → **This will be bold**
\textit{This will be italic}       → *This will be italic*
\underline{This will be underlined} → underlined
```

### Adding Section Headings {#adding-section-headings}

The template already has all the sections set up. But if you need to write your own:

``` latex
\section{Title of My Section}        → 1. Title of My Section
\subsection{Subsection Title}         → 1.1 Subsection Title
\subsubsection{Smaller Subsection}    → 1.1.1 Smaller Subsection
```

### Adding a Table {#adding-a-table}

Here's a simple table you can copy-paste and fill in with your numbers:

``` latex
\begin{table}[H]
  \centering
  \begin{tabular}{lccc}
    \toprule
    Asset & Mean Return & Std Dev & Sharpe Ratio \\
    \midrule
    SPY   & 0.85\%      & 1.25\%  & 0.68          \\
    BTC   & 2.10\%      & 4.50\%  & 0.47          \\
    \bottomrule
  \end{tabular}
  \caption{Daily Returns Summary}
  \label{tab:returns}
\end{table}
```

**Quick table anatomy:** - `{lccc}` — Means: left-aligned column, then 3 centered columns (`l` = left, `c` = center, `r` = right) - Columns are separated with `&`, rows end with `\\` - `\toprule`, `\midrule`, `\bottomrule` — fancy horizontal lines

### Adding an Image (Chart / Figure)

Save your chart as a PNG file in the `/reports/` folder, then add:

``` latex
\begin{figure}[H]
  \centering
  \includegraphics[width=\textwidth]{my_chart.png}
  \caption{Cumulative Returns of Assets (2020–2025)}
  \label{fig:cumulative_returns}
\end{figure}
```

**Pro tip:** The `[width=\textwidth]` part scales the image to fit the page width. You can use `width=0.5\textwidth` for half-width, or `height=8cm` for a specific height.

### Adding a Bullet List {#adding-a-bullet-list}

``` latex
\begin{itemize}
  \item First point
  \item Second point
  \item Third point
\end{itemize}
```

### Adding a Numbered List {#adding-a-numbered-list}

``` latex
\begin{enumerate}
  \item Step one
  \item Step two
  \item Step three
\end{enumerate}
```

### Adding Math (If Needed) {#adding-math-if-needed}

``` latex
The Sharpe ratio is calculated as: $\frac{R_p - R_f}{\sigma_p}$
```

### How to Put Your R Output Into the .tex

When you run code in your `.qmd` file and get a result like:

```         
Mean return of SPY: 0.85%
```

You simply: **Type that number into the .tex file** in the appropriate section. Or better yet, if the `.qmd` produces a table or chart, save it as a PNG/CSV and use the `\includegraphics` or `\begin{tabular}` commands above to insert it.

------------------------------------------------------------------------

## Pro Tips for Working with Both Files {#pro-tips-for-working-with-both-files}

1.  **Do all your heavy lifting in the .qmd** — Download data, clean it, run your 10 SQL investigations, calculate stats, make charts. The .qmd is built for this.
2.  **Only bring the final polished results into the .tex** — Nobody needs to see your debugging code or the 15 versions of the same chart you tried. The .tex is the final draft.
3.  **Keep your chart filenames simple** — Save as `returns.png`, `correlation.png`, `portfolio.png` so it's easy to reference in the .tex.
4.  **Render the .tex every time you make changes** to see if the PDF looks right. If you get an error, don't panic — usually it's a missing `}` or `\\` — read the error message, fix it, and render again.
5.  **You can render the .tex in R Studio** — Open the file, then click the "Compile PDF" button (it looks like a little PDF icon) or use the keyboard shortcut **Ctrl+Shift+K** (Windows/Linux) / **Cmd+Shift+K** (Mac).

------------------------------------------------------------------------

## If You Cannot Render Locally: The CI Pipeline

Not everyone has R, LaTeX, or the required packages installed on their machine. Installing a full TeX distribution can take hours and consume several gigabytes of disk space. This is a known obstacle, and this repository provides a direct path around it.

Every time you push a commit to GitHub, an automated pipeline runs in the cloud. It installs R, installs Quarto, downloads every required LaTeX package, renders the `.qmd` appendix, compiles the `.tex` report, and commits the resulting PDFs back to the repository. You never touch a terminal. You never wait for a package to compile.

Here is exactly what happens when you push:

```         
You: git add . && git commit -m "added Q4 analysis" && git push
        |
GitHub Actions:
  1. Syntax check: parses all R code in the .qmd, catches typos and missing braces
  2. Render (Ubuntu, macOS, Windows): runs the full pipeline on all three operating systems
     - Installs R, Quarto, LaTeX, biber, and all R packages
     - Runs quarto render on finstad_analysis.qmd, generating all figures
     - Copies the appendix PDF to the reports folder
     - Runs latexmk on finstad_report.tex, resolving all citations
     - Uploads the completed PDFs as downloadable artifacts
  3. Commit: takes the Ubuntu-built PDFs and commits them back to the repository
     - reports/finstad_report.pdf
     - scripts/finstad_analysis.pdf
        |
You: git pull
     -> you now have the fresh PDFs with your changes rendered
```

To view the latest report without pulling, open the repository on GitHub, navigate to the **Actions** tab, select the most recent workflow run, and download the PDFs under **Artifacts**. The report PDF is also directly viewable in the repository at `reports/finstad_report.pdf` after the workflow commits it.

This means every group member can contribute to the `.qmd` and `.tex` files regardless of what software they have installed. Edit the source files, commit, push, pull the rendered PDFs. That is the entire workflow.

The three-OS matrix (Ubuntu, macOS, Windows) exists for a reason: if a change breaks the build on one platform but not others, the pipeline catches it. A green checkmark across all three means the document compiles identically on any machine your professor might open it on.