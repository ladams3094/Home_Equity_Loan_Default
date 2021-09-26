# Home Equity Loan Default Prediction & Interpretation

Here is a demo application of the default predictor: https://luke-adams.shinyapps.io/hmeq-shiny-app/

## Business case


## Table of contents

<details open>
  <summary>Show/hide</summary>
  <br>
  
  1. [File descriptions](#file-descriptions)
  2. [Technologies used](#technologies-used)
  3. [Structure](#structure-of-notebooks)
  4. [Executive summary](#executive-summary)<br>
      4.1 [EDA and preprocessing](#eda-and-preprocessing)<br>
      4.2 [Modeling](#modeling)<br>
      4.3 [Evaluation and interpretability](#evaluation-and-interpretability)<br>
      4.4 [Deployment](#deployment)
  
</details>


## File descriptions

<details>
  <summary>Show/hide</summary>
  <br>
  For input after I add files to git
  
</details>


## Technologies used

<details open>
  <summary>Show/hide</summary>
  <br>

R libraries: <br>
  
- **tidyverse** <br>
- **tidymodels** <br>
- **here** <br>
- **skimr** <br>
- **janitor** <br>
- **caret** <br>
- **visdat** <br>
- **themis** <br>
- **DALEX** <br>
- **pdp** <br>
- **iml** <br>
- **doMC** <br>
  
</details>

## Notebook structure

<details open>
  <summary>Show/hide</summary>
  <br>

1. EDA and Preprocessing
   - 1.1 Imports
   - 1.2 Glimpse Data
   - 1.3 Skim Data
   - 1.4 Visualize Data
     - 1.4.1 Missing values
     - 1.4.2 Response variable
     - 1.4.3 Feature variables
     - 1.4.4 Variable relationships
  
2. Modeling & Hyperparameter Tuning
   - 2.1 Imports
   - 2.2 Train / Test Split
   - 2.3 Performance Metrics
   - 2.4 Logistic Regression
     - 2.4.1 Recipe
     - 2.4.2 Model specification
     - 2.4.3 Create workflow
     - 2.4.4 Fit model
     - 2.4.5 Performance
   - 2.5 Random Forest
     - 2.5.1 Recipe
     - 2.5.2 Model specification
     - 2.5.3 Create workflow
     - 2.5.4 Initial tune
     - 2.5.5 Fine tune
     - 2.5.6 Model selection
     - 2.5.7 Finalize model
     - 2.5.8 Save model
  
3. Evaluation and Interpretation
   - 3.1 Imports
   - 3.2 Performance 
     - 3.2.1 Confusion matrix
   - 3.3 Global Interpretation
     - 3.3.1 Variable-importance
     - 3.3.2 Partial-dependence profiles
   - 3.4 Local Interpretation
     - 3.4.1 Break-down plots
     - 3.4.2 Shapley values
     - 3.4.3 Ceteris-paribus profiles
  
4. Depoloyment
   - 4.1 Shiny Application
  
  
</details>

## Executive summary

### EDA and preprocessing

<details open>
  <summary>Show/hide</summary>
  <br>
  
</details>

### Modeling

<details open>
  <summary>Show/hide</summary>
  <br>
  
</details>

### Evaluation and interpretability

<details open>
  <summary>Show/hide</summary>
  <br>
  
  https://ema.drwhy.ai/summaryInstanceLevel.html <br>
  https://ema.drwhy.ai/summaryModelLevel.html
  
</details>

### Deployment

<details open>
  <summary>Show/hide</summary>
  <br>
  
</details>
