# Statistics in R — Lab 9

This repository contains R exercises for statistical inference, including
hypothesis tests and confidence intervals for means, variances, and
proportions.

The main script for this lab is [`lab_9.R`](./lab_9.R).

## Requirements

- R (base R is sufficient)
- The survey data used in the earlier labs, loaded into the current R session

The script uses two data frames:

- `Ankieta` — the complete survey dataset
- `Ankieta.M` — the subset of survey responses for men

The script does not import these data frames itself. Load or create them
before running `lab_9.R`. The data should contain at least the following
columns:

- `Ankieta.M$Wzrost`
- `Ankieta.M$Waga`
- `Ankieta$M.zamieszkania`
- `Ankieta$Sz.średnia`

Column names contain Polish characters and punctuation, so they must match the
names used above.

## Running the lab

1. Open R or RStudio.
2. Set the working directory to the repository folder.
3. Load the survey data.
4. Run the script:

   ```r
   source("lab_9.R")
   ```

Alternatively, open `lab_9.R` in RStudio and run the code sections
interactively.

## Contents of `lab_9.R`

### 1. One-sample test for the mean height

Tests whether the mean height of men is greater than 179 cm using a
one-sided Student's *t*-test:

```r
t.test(Ankieta.M$Wzrost, mu = 179, alternative = "greater")
```

### 2. Distribution check and inference for men's weight

The script:

- checks normality with the Shapiro–Wilk test;
- calculates a 96% confidence interval for the mean weight;
- defines `przedzial.odchylenie()`, a helper function that calculates a
  confidence interval for the population standard deviation using the
  chi-squared distribution;
- calculates a 99% confidence interval for the standard deviation;
- tests whether the mean weight differs from 77 kg.

The helper function has the following interface:

```r
przedzial.odchylenie(zmienna, ufnosc)
```

where `zmienna` is a numeric vector and `ufnosc` is the confidence level
expressed as a value between 0 and 1.

### 3. Paired measurements before and after treatment

The vectors `Przed` and `Po` contain blood-pressure measurements taken before
and after treatment. The script:

- checks whether the paired differences are normally distributed;
- performs a one-sided paired *t*-test;
- tests whether the mean measurement before treatment is greater than the
  mean measurement after treatment.

### 4. Paired measurements before and after training

The vectors `Przedszkoleniem` and `Poszkoleniu` contain measurements before
and after training. The same normality and paired-sample testing approach is
used to assess whether the training produced a significant improvement.

### 5. Confidence interval and test for a population proportion

Using `Ankieta$M.zamieszkania`, the script estimates the proportion of
students living in rented accommodation and calculates a 96% confidence
interval for that proportion.

It also tests whether the proportion of students living in a dormitory is
different from 0.4.

### 6. Confidence interval and test for another population proportion

Using `Ankieta$Sz.średnia`, the script:

- calculates a 97% confidence interval for the proportion of respondents
  who graduated from a general-education secondary school;
- tests whether that proportion is greater than 0.78 at the 0.01
  significance level.

## Statistical functions used

All functions used by the script are provided by base R:

- `t.test()` — tests and confidence intervals for means
- `shapiro.test()` — Shapiro–Wilk normality test
- `qchisq()` — chi-squared distribution quantiles
- `prop.test()` — tests and confidence intervals for proportions
- `table()` — frequency tables

## Interpreting results

The script prints test statistics, *p*-values, and confidence intervals to the
R console. For hypothesis tests, compare the *p*-value with the significance
level `alpha`:

- if `p <= alpha`, reject the null hypothesis;
- if `p > alpha`, do not reject the null hypothesis.

The explanatory comments in the script contain the intended conclusions for
the provided sample data. If the survey data changes, rerun the analyses and
interpret the newly generated results rather than relying on those comments.
