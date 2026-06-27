# FINSTAD Case 1 — Project Repository

**Course:** FINSTAD \| **Section:** C01 \| **Group:** 3

### Group Members:

1.  CRUZ, Ricardo Miguel Iñigo
2.  GALEDO, Enrique Lorenzo Hermoso
3.  SEBALLOS, Josiah Dweyn Panganiban
4.  SEECHUNG, Camille Castro
5.  SISON, Aaron Joshua Estacio

------------------------------------------------------------------------

## Project Structure

Here is how our project files are organized:

-   `/data/` — Where we will store our downloaded datasets (CSV, Excel). This includes our chosen US Asset, PH Asset, Crypto, SPY, and FRED macroeconomic data.
-   `/scripts/` — Where we keep our R scripts (e.g., `data_cleaning.R`, `analysis.R`).
-   `/reports/` — Where we will save our R Markdown (`.Rmd`) files and final Word/PDF reports.
-   `/presentations/` — Where we will store our presentation slide deck and Executive Dashboard.
-   `guidelines.md` — The project requirements and rubric provided by the instructor.

------------------------------------------------------------------------

## Welcome to GitHub! (A Guide for Beginners)

If you haven't used GitHub before, don't worry! Think of GitHub as a highly organized **Google Drive specifically for code**.

Instead of saving files as `analysis_final_final_v2.R`, GitHub tracks every single change we make. It allows all of us to work on the project at the same time without accidentally deleting each other's work.

### Navigating the GitHub Website

When you view this repository on the GitHub website, you will see a list of folders and files. You can click on any folder (like `scripts/`) to see what's inside, or click on a file to read its contents. This page you are reading right now is the `README.md` file, which is automatically displayed on the front page of the repository.

------------------------------------------------------------------------

## How to Get this Code into R Studio (Cloning)

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

### What is a Branch?
Think of a branch as a separate sandbox or parallel universe. Instead of all 5 of us editing the exact same files at the same time (which causes messy conflicts), you create your own branch to work on your specific task. 

### What is a Pull Request (PR)?
A Pull Request is how you ask the group to review your work before it gets added to the main, official version of the project. 
- **Why we use it:** It protects our main code from accidental deletions or breaking errors. It also lets us see what everyone else is doing.
- **When will others see your changes?** They can see your branch immediately after you push it, but your code won't affect the official `main` project until the PR is merged.



### A Quick Tour of R Studio — Where Do I Type What?

If you open R Studio, you'll see a few different panels. Here's what each one is for:

- **Source Editor (top-left)** — This is like a Word document for your code. You can write R scripts, open the `.qmd` file, edit this README, and save your work here. When you type code in the Source Editor, it doesn't run until you click the **Run** button or press **Ctrl+Enter**. Think of it as your notebook where you draft your analysis before "publishing" it.

- **Console / Terminal (bottom-left)** — This is where commands actually get executed. There are actually *two* tabs here:
  - The **Console** tab — This is for running R code line by line. If you type `2 + 2` here and press Enter, R calculates it immediately.
  - The **Terminal** tab — This is for system commands like Git. **When the instructions below say "type these commands in the Terminal,"** click the **Terminal** tab first (next to the Console tab). Then type your `git` commands there.

- **Environment / History (top-right)** — This shows all the data and variables you've loaded into R. If you import a dataset, it will appear here.

- **Files / Plots / Packages / Help (bottom-right)** — This shows your project files, any charts you make, installed packages, and help documentation.

**The golden rule:** Write your R analysis code in the **Source Editor** (top-left), and type your Git commands in the **Terminal** tab (bottom-left).


### The Step-by-Step Workflow

**To save your work, open the "Terminal" tab in R Studio (usually next to the Console tab at the bottom left) and type these commands in order:**

#### Step 1: Create your own branch
Before you start typing any code today, make sure you are on a new branch. Replace `your-name` with your actual name (e.g., `feat/joshua-data-cleaning`):

```bash
git switch -c feat/your-name
```
*(This creates your sandbox and moves you into it).*

#### Step 2: Do your work!
Write your R code, make your graphs, save your files in R Studio.

#### Step 3: Package your changes (Stage & Commit)
When you are ready to upload your work, you need to label what you did.

```bash
git add .
```
*(This tells Git "I want to save ALL the files I just edited").*

```bash
git commit -m "Added dplyr code for merging datasets"
```
*(Make sure to write a descriptive message).*

#### Step 4: Upload your branch to GitHub (Push)
Send your labeled work to the cloud!

```bash
git push -u origin HEAD
```

#### Step 5: Open a Pull Request (PR)
Go to our project page on the GitHub website. You will see a green button that says **"Compare & pull request"**. Click it, write a short description of what you did, and click **"Create pull request"**.

Once the group reviews it and clicks **Merge**, your code becomes part of the official project!