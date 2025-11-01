<div align="center">

# Probability & Statistics with R

### Statistical Inference and Probability Theory

[![R](https://img.shields.io/badge/R-4.0+-276DC3.svg)](https://www.r-project.org/)
[![RStudio](https://img.shields.io/badge/RStudio-IDE-75AADB.svg)](https://www.rstudio.com/)
[![Statistics](https://img.shields.io/badge/Statistics-Inference-green.svg)]()

**Author:** Georgios Kitsakis
**Institution:** Athens University of Economics and Business (AUEB)

[Overview](#overview) • [Assignments](#assignments) • [Topics](#topics) • [Installation](#installation)

---

</div>

## Overview

This repository contains statistical analysis projects implemented in R, covering probability theory, statistical inference, hypothesis testing, and real-world data applications. The coursework emphasizes both theoretical understanding and practical implementation of statistical methods.

### 🎯 Course Focus

- **Probability Distributions:** Normal, exponential, binomial, Poisson
- **Statistical Inference:** Confidence intervals, hypothesis testing
- **Real Data Analysis:** Call durations, drug trials, lottery data, COVID-19 vaccination
- **R Programming:** Data manipulation, visualization, statistical testing

---

## Assignments

### 📘 Assignment 1: Probability Theory & Distributions

**Focus:** Understanding probability distributions through simulation and analysis

<div align="center">
<img src="https://via.placeholder.com/700x200/E91E63/FFFFFF?text=Probability+Distributions+%26+Simulations" alt="Probability">
</div>

#### Topics Covered

**1. Call Duration Analysis**
- **Datasets:** 100 vs. 10,000 call durations
- **Distribution:** Exponential with rate parameter λ
- **Analysis:**
  - Histogram with probability density overlay
  - Expected value and variance calculations
  - Cost function analysis
  - Quartile computations

**2. Sample Size Effects**
- Comparison of small (n=100) vs. large (n=10,000) samples
- Central Limit Theorem demonstrations
- Convergence to theoretical distributions

#### Key Statistical Concepts

**Expected Value:**
$$E[X] = \int_{-\infty}^{\infty} x \cdot f(x) \, dx$$

**Variance:**
$$\text{Var}(X) = E[X^2] - (E[X])^2$$

**Quantiles:**
$$F(Q_p) = P(X \leq Q_p) = p$$

#### Files

- [Assigment_1_Probability.R](Assigment_1/) - Main R script
- [call_duration_100.txt](Assigment_1/) - Small sample
- [call_duration_10000.txt](Assigment_1/) - Large sample
- [Exercise3_Rcode.RData](Assigment_1/) - R workspace
- [Assignment 1_ Probability.pdf](Assigment_1/) - Report

---

### 📗 Assignment 2: Statistical Inference

**Focus:** Hypothesis testing, confidence intervals, real-world data analysis

<div align="center">
<img src="https://via.placeholder.com/700x200/3F51B5/FFFFFF?text=Hypothesis+Testing+%26+Inference" alt="Inference">
</div>

#### Topics Covered

**1. Hypothesis Testing**
- t-tests (one-sample, two-sample, paired)
- Chi-squared tests for independence
- ANOVA for multiple group comparisons

**2. Confidence Intervals**
- Mean estimation with confidence bounds
- Proportion confidence intervals
- Margin of error calculations

**3. Real Datasets**
- **Drug Response Time:** `drug_response_time.txt`
- **Joker Lottery:** Multi-year analysis (2020-2023)
  - `Joker_2020.csv`, `Joker_2021.csv`, `Joker_2022.csv`, `Joker_2023.csv`

#### Exercises

- `exercise_2.R` - t-tests and confidence intervals
- `exercise_3.R` - Chi-squared independence tests
- `exercise_5.R` - ANOVA analysis
- `exercise_6.R` - Proportion tests
- `exercise_7.R` - Paired t-tests
- `exercise_8.R` - Lottery data analysis

#### Statistical Methods

**t-Test:**
$$t = \frac{\bar{x} - \mu_0}{s / \sqrt{n}}$$

**Chi-Squared Test:**
$$\chi^2 = \sum \frac{(O_i - E_i)^2}{E_i}$$

**Confidence Interval (95%):**
$$\bar{x} \pm t_{0.025, n-1} \cdot \frac{s}{\sqrt{n}}$$

#### Files

- [Assignment_2_kitsakis.pdf](Assigment_2/) - Report
- Multiple R scripts for different exercises
- Real-world datasets (drug trials, lottery)

---

### 📙 Assignment 3: Advanced Statistical Analysis

**Focus:** Multivariate analysis, regression, COVID-19 data

<div align="center">
<img src="https://via.placeholder.com/700x200/4CAF50/FFFFFF?text=Advanced+Statistics+%26+COVID+Analysis" alt="Advanced Stats">
</div>

#### Topics Covered

**1. COVID-19 Vaccination Analysis**
- **Dataset:** `covid_vaccination_deaths.csv`
- **Analysis:** Mortality rates, vaccination efficacy
- **Methods:** Correlation analysis, regression models

**2. Advanced Inference**
- **Dataset:** `exercise_2_data.csv`
- **Techniques:** Multiple regression, interaction effects

**3. Applied Statistics**
- Multivariate hypothesis testing
- Model diagnostics and validation

#### Exercises

- `exercise_1.R` - COVID-19 vaccination data
- `exercise_2.R` - Multiple regression
- `exercise_3.R` - Model comparison
- `exercise_4.R` - Advanced inference

#### Files

- [Assignment_3.pdf](Assignment_3/) - Report
- [covid_vaccination_deaths.csv](Assignment_3/)
- [exercise_2_data.csv](Assignment_3/)
- R scripts for each exercise

---

### 📕 Final Exam

**Format:** Handwritten solutions + compiled PDF

**Coverage:** Comprehensive assessment of all topics

#### Contents

- 35 JPG images (handwritten exam solutions)
- [Complete_Probability_and_Statistics_Solutions_Fixed.pdf](final exam/) - Full solutions
- [Questions_and_answers.pdf](final exam/) - Exam questions

---

## Topics Covered

### Probability Theory

✅ **Discrete Distributions:** Binomial, Poisson, geometric
✅ **Continuous Distributions:** Normal, exponential, uniform, chi-squared, t-distribution
✅ **Expected Value & Variance:** Theoretical calculations and empirical estimation
✅ **Quantiles & Percentiles:** Computing and interpreting

### Statistical Inference

✅ **Point Estimation:** Sample mean, sample variance, maximum likelihood
✅ **Interval Estimation:** Confidence intervals for means, proportions, differences
✅ **Hypothesis Testing:** Null/alternative hypotheses, p-values, Type I/II errors
✅ **Test Selection:** t-tests, chi-squared, ANOVA, F-test

### Applied Statistics

✅ **Real Data Analysis:** Cleaning, visualization, interpretation
✅ **Model Building:** Linear regression, ANOVA, interaction effects
✅ **Diagnostics:** Residual plots, normality tests, outlier detection
✅ **Reporting:** Clear communication of statistical findings

---

## Installation

### Prerequisites

- **R:** Version 4.0 or higher
- **RStudio:** Recommended IDE
- **R Packages:** (installed automatically when running scripts)
  - `ggplot2` - Visualization
  - `dplyr` - Data manipulation
  - `tidyr` - Data tidying

### Setup

**1. Install R:**
- Windows/Mac: https://cran.r-project.org/
- Linux: `sudo apt install r-base`

**2. Install RStudio (optional but recommended):**
- https://www.rstudio.com/products/rstudio/download/

**3. Clone repository:**
```bash
git clone https://github.com/kitsakisGk/probability-statistics-r.git
cd probability-statistics-r
```

**4. Open R scripts in RStudio and run**

---

## Project Structure

```
probability-statistics-r/
│
├── Assigment_1/                  # Probability Theory
│   ├── Assigment_1_Probability.R
│   ├── call_duration_100.txt
│   ├── call_duration_10000.txt
│   └── Exercise3_Rcode.RData
│
├── Assigment_2/                  # Statistical Inference
│   ├── exercise_2.R
│   ├── exercise_3.R
│   ├── exercise_5.R
│   ├── exercise_6.R
│   ├── exercise_7.R
│   ├── exercise_8.R
│   ├── drug_response_time.txt
│   ├── Joker_2020.csv
│   ├── Joker_2021.csv
│   ├── Joker_2022.csv
│   └── Joker_2023.csv
│
├── Assignment_3/                 # Advanced Statistics
│   ├── exercise_1.R
│   ├── exercise_2.R
│   ├── exercise_3.R
│   ├── exercise_4.R
│   ├── covid_vaccination_deaths.csv
│   └── exercise_2_data.csv
│
├── final exam/
│   ├── [35 JPG images]
│   ├── Complete_Probability_and_Statistics_Solutions_Fixed.pdf
│   └── Questions_and_answers.pdf
│
├── .gitignore
└── README.md
```

---

## Key Learning Outcomes

### Theoretical Knowledge

✅ **Probability Foundations:** Random variables, distributions, moments
✅ **Inference Theory:** Estimators, sampling distributions, asymptotic properties
✅ **Hypothesis Testing:** Test construction, power analysis, multiple comparisons

### Practical Skills

✅ **R Programming:** Data structures, functions, control flow
✅ **Data Visualization:** Histograms, boxplots, scatterplots, Q-Q plots
✅ **Statistical Modeling:** Fitting distributions, regression analysis
✅ **Reproducible Research:** R Markdown, version control

### Real-World Applications

✅ **Healthcare:** Drug trials, vaccination efficacy (COVID-19 data)
✅ **Telecommunications:** Call duration modeling
✅ **Gaming/Lottery:** Joker lottery statistical analysis
✅ **General:** Applying statistical rigor to diverse datasets

---

## Statistical Methods Reference

### Common Tests

| Test | When to Use | R Function |
|------|-------------|------------|
| **One-sample t-test** | Compare mean to known value | `t.test(x, mu=μ0)` |
| **Two-sample t-test** | Compare two group means | `t.test(x, y)` |
| **Paired t-test** | Compare paired observations | `t.test(x, y, paired=TRUE)` |
| **Chi-squared test** | Test independence (categorical) | `chisq.test(table)` |
| **ANOVA** | Compare ≥3 group means | `aov(y ~ group)` |
| **Shapiro-Wilk** | Test normality | `shapiro.test(x)` |

### Confidence Intervals

```r
# Mean (normal distribution)
t.test(data)$conf.int

# Proportion
prop.test(x, n)$conf.int
```

---

## Challenges & Solutions

### Challenge 1: Large Exam Files (35 JPGs)
**Problem:** JPG scans are large and unsuitable for GitHub
**Solution:** Added to `.gitignore`; kept compiled PDF only

### Challenge 2: R Package Dependencies
**Problem:** Different versions across assignments
**Solution:** Document required packages in each script header

### Challenge 3: Data File Formats
**Problem:** Mix of `.txt`, `.csv`, `.RData`
**Solution:** Standardized loading functions in each script

---

## References

### Textbooks
- **Probability:** Ross, S. (2014). *A First Course in Probability*
- **Statistics:** Wackerly, D. et al. (2008). *Mathematical Statistics with Applications*
- **R Programming:** Wickham, H. (2016). *R for Data Science*

### Online Resources
- [R Documentation](https://www.rdocumentation.org/)
- [CRAN Task Views](https://cran.r-project.org/web/views/)
- [Quick-R](https://www.statmethods.net/)

---

## License

This project is licensed under the MIT License.

## Contact

**Georgios Kitsakis**
- GitHub: [@kitsakisGk](https://github.com/kitsakisGk)
- LinkedIn: [Add your LinkedIn]

---

<div align="center">

**Athens University of Economics and Business**
*Master's in Data Science*

Made with ❤️ for Statistical Analysis

</div>
