# Unveiling the Hidden Link between Digital Servitization and Firm Performance: A Meta-analysis

This repository contains the replication data and Stata code for the meta-analysis paper titled "Unveiling the Hidden Link between Digital Servitization and Firm Performance: A Meta-analysis". 

The objective of this repository is to ensure the transparency, robustness, and exact replicability of the statistical insights and econometric models presented in the study.

## Project Overview
This project synthesizes empirical evidence from existing literature to evaluate how digital servitization affects firm performance. By utilizing a meta-analytical approach, we account for study-specific heterogeneities, publication biases, and contextual moderators.

## Key Features
* Curated Meta-Dataset: Includes a standardized Excel database with effect sizes, sample sizes, and comprehensive moderator variables extracted from the literature.
* Automated Stata Script: A fully commented .do file that executes the entire analytical pipeline with a single click.
* Advanced Meta-Analysis Econometrics: Implements random-effects models, heterogeneity tests, and publication bias diagnostics (Funnel plots, Egger's test).
* Moderator Analysis: Includes meta-regressions to unveil the hidden boundary conditions of the digital servitization-performance link.

## Repository Structure
* data/: Contains the Excel file (meta_dataset.xlsx) with the raw and coded study effects.
* scripts/: Contains the Stata do-file (replication_analysis.do) used for estimation.
* output/: (Optional) Recommended folder to store generated plots, tables, or log files.

## How to Run

### Prerequisites
To replicate the analysis, you will need:
* Stata (Version 16 or higher recommended).
* Microsoft Excel (for viewing or editing the raw dataset).

### Execution Steps
1. Clone or Download this repository to your local machine.
2. Open Stata.
3. Set your working directory to the folder where you downloaded the files by running:
   cd "C:/path/to/your/folder"
4. Run the replication script (the script will automatically verify and install any required meta-analysis packages, such as meta):
   do scripts/replication_analysis.do

## Citation / Reference
If you use this dataset or code in your research, please cite the original paper:
Bustinza, O. F., Rabetino-Sabugo, R., Vendrell-Herrero, F. (2026). Unveiling the Hidden Link between Digital Servitization and Firm Performance: A Meta-analysis. Asian Business & Management.
