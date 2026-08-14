# Maternal & Perinatal Risk Modeling for Survival Outcome

This project examines maternal and perinatal factors associated with survival outcomes among matched multiple-birth pregnancies. The analysis focuses on births classified as survivor, infant death, or fetal death, with emphasis on how maternal characteristics and delivery-related factors vary across twin, triplet, and quadruplet pregnancies.

## Project overview

The analysis uses a SAS workflow to:

- import and clean a fixed-width multiple-birth dataset;
- define key study variables for infant, maternal, and delivery characteristics;
- summarize maternal/perinatal characteristics across birth types;
- model the probability of adverse birth outcome using logistic regression;
- evaluate model discrimination with ROC curves and odds ratio estimates.

This work is organized around a midterm project for Biostat 203A and includes both code and generated analytical outputs.

## Research objective

The primary goal is to identify maternal and perinatal risk patterns associated with mortality or fetal loss among multiple-birth pregnancies. The project evaluates whether variables such as maternal education, nativity, smoking status, no-risk conditions, delivery method, and abnormal infant conditions are associated with increased odds of adverse outcomes.

## Data and study population

The dataset is a matched multiple-birth records file covering 2016-2020, with records for:

- twins;
- triplets;
- quadruplets.

The outcome variable is constructed from the record category:

- Survivor;
- Infant death;
- Fetal death.

The cleaned analysis dataset includes selected variables related to:

- infant characteristics;
- delivery and clinical context;
- maternal demographics and risk factors;
- risk flags for infection and morbidity.

## Methodology

The SAS workflow performs the following tasks:

1. Data loading and variable parsing from a fixed-width text file.
2. Data cleaning and recoding into categorical variables with labeled formats.
3. Construction of a formatted analytic dataset.
4. Descriptive summaries by plurality using frequency tables.
5. Logistic regression for outcome modeling among twins, triplets, and quadruplets separately.
6. Odds ratio estimation with Wald confidence intervals.
7. ROC analysis to assess model discrimination.

## Key files in this repository

- [validation.sas](validation.sas): main SAS data cleaning, formatting, table creation, and modeling code.
- [DataLoad.html](DataLoad.html): generated HTML summary of the SAS data loading workflow.
- [Validation_FrankHsu.html](Validation_FrankHsu.html): validation/report output generated during analysis review.
- [LICENSE](LICENSE): project license.
- [203A Midterm Presentation Group 9.pptx](203A%20Midterm%20Presentation%20Group%209.pptx): presentation slide deck.
- [Biostat203_Midterm_Group9.docx](Biostat203_Midterm_Group9.docx): report document.
- [Biostat203_Midterm_Group9.pdf](Biostat203_Midterm_Group9.pdf): PDF report.
- [Source_Data_File.pdf](Source_Data_File.pdf): source documentation / data reference.

## Outputs and figures

The project includes generated analytical outputs such as:

- maternal and perinatal characteristics table across multiple birth outcomes;
- odds ratio estimates and Wald confidence intervals;
- ROC curves for the modeled outcomes;
- visual summaries of risk patterns by plurality.

Examples in the repository include:

- Maternal and Perinatal Characteristics Across Multiple Birth Outcomes.png
- Odds Ratio Estimates and Wald Confidence Intervals.png
- ROC Curves For Logistic Model (Grouped by Plurality).png

## Computational environment

The analysis was implemented in SAS 9.4 on a Linux environment and includes HTML log/output summaries produced by SAS Studio. The code is intended to be run in a SAS-compatible environment with access to the fixed-width source data file.

## Interpretation focus

The project is designed to support interpretation of how maternal and perinatal characteristics influence adverse outcomes in multiple births. Common emphasis areas include:

- differences by plurality (twin vs triplet vs quadruplet);
- maternal smoking and prenatal risk indicators;
- delivery method and preterm/low-birthweight patterns;
- abnormal infant conditions and survival status;
- model performance via ROC metrics and odds ratios.

## Notes

- The raw fixed-width input file is not included in the repository snapshot; the project code assumes the source dataset is available in the expected location.
- The generated report and presentation files are included as project artifacts and can be used for review or submission.
- This repository is intended as a reproducible statistical analysis and documentation package for the project.

## Suggested next steps

- validate variable definitions against the original source documentation;
- refine the final logistic model based on domain-driven covariate selection;
- document the main clinical findings in a concise abstract or executive summary.

---

This README is a working project summary and can be expanded further if you want a more formal academic-style description or a GitHub-ready version for public sharing.

