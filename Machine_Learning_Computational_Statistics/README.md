<div align="center">

# Machine Learning & Computational Statistics

### Comprehensive ML Course: From Linear Models to Deep Learning

[![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)](https://www.python.org/)
[![scikit-learn](https://img.shields.io/badge/scikit--learn-1.3+-orange.svg)](https://scikit-learn.org/)
[![NumPy](https://img.shields.io/badge/NumPy-Scientific-013243.svg)](https://numpy.org/)
[![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-F37626.svg)](https://jupyter.org/)

**Author:** Georgios Kitsakis
**Institution:** Athens University of Economics and Business (AUEB)

[Overview](#overview) • [Homeworks](#homeworks) • [Final Project](#final-project) • [Installation](#installation)

---

</div>

## Overview

This repository contains a complete machine learning curriculum covering foundational algorithms, statistical methods, and advanced techniques. The coursework progresses from basic linear models to sophisticated deep learning applications, culminating in a hyperspectral image classification project.

### 🎯 Course Structure

- **8 Homework Assignments:** Incremental skill building
- **Final Project:** Hyperspectral Image Classification
- **Topics:** Regression, Classification, Neural Networks, SVMs, Decision Trees, Ensemble Methods

---

## Homeworks

### 📘 Homework 1: Introduction to Machine Learning
- Linear regression basics
- Cost functions and gradient descent
- Python/NumPy fundamentals

### 📗 Homework 2: Linear & Non-Linear Regression

**Topics:** Feature transformation, polynomial regression, interaction terms

**Key Concepts:**
- **Linear Model:** $y = w_0 + w_1x_1 + w_2x_2 + \epsilon$
- **Polynomial Features:** $y = w_0 + w_1x + w_2x^2 + w_3x^3 + \epsilon$
- **Interaction Terms:** $y = w_0 + w_1x_1 + w_2x_2 + w_3(x_1 \cdot x_2) + \epsilon$

**Implementation:**
- MSE evaluation for different feature representations
- Comparison of linear vs. transformed models
- Overfitting analysis with high-degree polynomials

📁 [Homework_2_8.ipynb](Homework_2/) - Demonstrates feature engineering techniques

---

### 📙 Homework 3: Classification with Transformations

**Topics:** Non-linear classification, decision boundaries, feature engineering for classification

**Problem:** Binary classification with non-linear decision boundary

**Approach:**
- Original features: $(x_1, x_2)$
- Transformed features: $(x_1^2, x_2^2)$
- Demonstrates how feature transformation enables linear classifiers to learn non-linear boundaries

📁 [Exercise_15.ipynb](Homework_3/) - Non-linear classification via feature transformation

---

### 📕 Homework 4-7: Advanced Topics
- **Homework 4:** Support Vector Machines (SVMs)
- **Homework 5:** Decision Trees and Random Forests
- **Homework 6:** Ensemble Methods (Bagging, Boosting)
- **Homework 7:** Neural Networks basics

---

### 📓 Homework 8: Advanced Machine Learning

**Topics:** MATLAB integration, advanced algorithms

**Files:**
- [HW8.ipynb](Homework_8/) - Python implementation
- [Dataset.mat](Homework_8/) - MATLAB data format
- [HW8.mat](Homework_8/) - Results

**Techniques:**
- Cross-platform data handling (MATLAB ↔ Python)
- SciPy for `.mat` file I/O
- Advanced model evaluation

---

## Final Project: Hyperspectral Image Classification

<div align="center">
<img src="https://via.placeholder.com/800x300/3F51B5/FFFFFF?text=Hyperspectral+Image+Classification" alt="Hyperspectral Project">
</div>

### 🎯 Project Overview

**Dataset:** Salinas Hyperspectral Image
**Dimensions:** 220×120 pixels, 204 spectral bands
**Classes:** 16 land cover types
**Task:** Pixel-wise classification using spectral unmixing and supervised learning

---

### 📊 Part A: Spectral Unmixing

**Problem:** Decompose each pixel into linear combinations of pure material spectra (endmembers)

**Mathematical Model:**
$$\mathbf{y} = \mathbf{X}\boldsymbol{\theta} + \boldsymbol{\epsilon}$$

Where:
- $\mathbf{y}$ = Observed pixel spectrum (204×1)
- $\mathbf{X}$ = Endmember matrix (204×7)
- $\boldsymbol{\theta}$ = Abundance vector (7×1)
- $\boldsymbol{\epsilon}$ = Noise

#### Methods Implemented

**1. Standard Least Squares**
$$\min_{\boldsymbol{\theta}} ||\mathbf{y} - \mathbf{X}\boldsymbol{\theta}||^2$$

**2. Sum-to-One Constraint**
$$\min_{\boldsymbol{\theta}} ||\mathbf{y} - \mathbf{X}\boldsymbol{\theta}||^2 \quad \text{s.t.} \quad \sum_{i=1}^{7} \theta_i = 1$$

**3. Non-Negativity Constraint**
$$\min_{\boldsymbol{\theta}} ||\mathbf{y} - \mathbf{X}\boldsymbol{\theta}||^2 \quad \text{s.t.} \quad \theta_i \geq 0 \, \forall i$$

**4. Full Constraints (Non-Negativity + Sum-to-One)**
$$\min_{\boldsymbol{\theta}} ||\mathbf{y} - \mathbf{X}\boldsymbol{\theta}||^2 \quad \text{s.t.} \quad \theta_i \geq 0, \, \sum_{i=1}^{7} \theta_i = 1$$

**5. LASSO (L1 Regularization)**
$$\min_{\boldsymbol{\theta}} ||\mathbf{y} - \mathbf{X}\boldsymbol{\theta}||^2 + \alpha ||\boldsymbol{\theta}||_1 \quad \text{s.t.} \quad \theta_i \geq 0$$

#### Results: Reconstruction Error

| Method | Avg Reconstruction Error |
|--------|--------------------------|
| Standard LS | 0.0234 |
| Sum-to-One | 0.0256 |
| Non-Negativity | 0.0241 |
| Full Constraints | 0.0258 |
| **LASSO** | **0.0227** (Best) |

**Key Finding:** LASSO performs best due to sparsity-inducing regularization, which aligns with the physical expectation that each pixel contains only a few dominant materials.

---

### 📊 Part B: Supervised Classification

**Features:** 7-dimensional abundance vectors from spectral unmixing
**Train/Test Split:** 80% / 20%
**Evaluation:** 10-fold cross-validation

#### Classifiers Compared

**1. Naïve Bayes**
- **Assumption:** Features are conditionally independent given class
- **Validation Error:** 5.21% (±0.60%)
- **Test Accuracy:** **94.79%**

**2. Minimum Euclidean Distance**
- **Method:** Assign to nearest class centroid
- **Validation Error:** 12.45% (±0.69%)
- **Test Accuracy:** **87.55%**

**3. k-Nearest Neighbors (k=5)**
- **Method:** Majority vote from 5 nearest neighbors
- **Validation Error:** 0.89% (±0.21%)
- **Test Accuracy:** **99.11%** ⭐

**4. Quadratic Discriminant Analysis (QDA)**
- **Assumption:** Each class has its own covariance matrix
- **Validation Error:** Not reported (direct training)
- **Test Accuracy:** **99.23%** ⭐⭐

**5. Bayesian Gaussian Mixture**
- **Method:** Model each class as mixture of Gaussians
- **Test Accuracy:** 13.14% (poor performance)
- **Issue:** Overfitting / poor initialization

#### Final Results

| Classifier | Test Accuracy | Confusion Matrix Quality |
|------------|---------------|--------------------------|
| **QDA** | **99.23%** | Excellent (few errors) |
| **k-NN** | **99.11%** | Excellent |
| **Naïve Bayes** | 94.79% | Good |
| Euclidean Distance | 87.55% | Moderate |
| Bayesian Mixture | 13.14% | Poor |

**Winner:** QDA achieved the highest accuracy due to its ability to model class-specific covariance structures, which captures the spectral variability of different land cover types.

---

### 🔑 Key Insights

✅ **Spectral Unmixing:** LASSO outperforms standard methods by promoting sparsity (most pixels contain 2-3 dominant materials)

✅ **Classification:** QDA and k-NN excel due to the well-separated nature of spectral classes in abundance space

✅ **Feature Engineering:** Using abundance vectors as features (instead of raw 204-band spectra) dramatically improves classifier performance and reduces computational cost

✅ **Physical Constraints:** Sum-to-one and non-negativity constraints improve interpretability but slightly increase reconstruction error (trade-off between accuracy and physical realism)

---

### 📁 Project Files

```
Project-P-2024-25/
├── FinalProject_MLCS.ipynb          # Main implementation
├── Project_AUEB.ipynb               # Draft version
├── data/
│   ├── Salinas_cube.mat             # Hyperspectral image (220×120×204)
│   ├── Salinas_gt.mat               # Ground truth labels
│   ├── Salinas_endmembers.mat       # Pure material spectra (7 endmembers)
│   └── classification_labels_Salinas.mat
└── Project_P-2024-2025-Kitsakis.pdf # Final report
```

---

## Installation

### Prerequisites
- Python 3.8+
- Jupyter Notebook
- 8GB+ RAM (for hyperspectral data)

### Setup

**1. Clone repository:**
```bash
git clone https://github.com/kitsakisGk/machine-learning-computational-statistics.git
cd machine-learning-computational-statistics
```

**2. Install dependencies:**
```bash
pip install -r requirements.txt
```

**3. Launch Jupyter:**
```bash
jupyter notebook
```

---

## Technologies Used

| Library | Purpose |
|---------|---------|
| **NumPy** | Numerical computing, matrix operations |
| **SciPy** | Optimization (`minimize`, `lsq_linear`), MATLAB I/O |
| **scikit-learn** | ML algorithms (SVM, Random Forest, k-NN, QDA, Naïve Bayes) |
| **Matplotlib** | Visualization (abundance maps, confusion matrices) |
| **Seaborn** | Heatmaps for confusion matrices |

---

## Project Structure

```
machine-learning-computational-statistics/
│
├── Homework_1/               # Introduction
├── Homework_2/               # Linear & polynomial regression
│   └── Homework_2_8.ipynb
├── Homework_3/               # Classification with transformations
│   └── Exercise_15.ipynb
├── Homework_4/               # SVMs
├── Homework_5/               # Decision Trees
├── Homework_6/               # Ensemble methods
├── Homework_7/               # Neural networks
├── Homework_8/               # Advanced topics (MATLAB integration)
│   ├── HW8.ipynb
│   ├── Dataset.mat
│   └── HW8.mat
│
├── Final_exercises/          # Exam preparation
│
├── Project-P-2024-25/
│   └── Project-P-2024-25/
│       ├── FinalProject_MLCS.ipynb      # Main project notebook
│       ├── Project_AUEB.ipynb
│       ├── data/
│       │   ├── Salinas_cube.mat
│       │   ├── Salinas_gt.mat
│       │   └── Salinas_endmembers.mat
│       └── Project_P-2024-2025-Kitsakis.pdf
│
├── requirements.txt
├── .gitignore
└── README.md
```

---

## Learning Outcomes

### Mathematical Foundations

✅ **Linear Algebra:** Matrix operations, least squares, eigenvalues
✅ **Optimization:** Gradient descent, constrained optimization (SLSQP, interior point)
✅ **Probability:** Gaussian distributions, Bayes' theorem, likelihood estimation
✅ **Statistics:** Hypothesis testing, cross-validation, confidence intervals

### Machine Learning Algorithms

✅ **Regression:** Linear, polynomial, regularized (Ridge, LASSO)
✅ **Classification:** Logistic regression, SVM, decision trees, k-NN, Naïve Bayes, QDA
✅ **Ensemble Methods:** Random Forests, Gradient Boosting
✅ **Neural Networks:** Feedforward, backpropagation, activation functions

### Practical Skills

✅ **Feature Engineering:** Polynomial features, interaction terms, domain-specific transformations
✅ **Model Selection:** Cross-validation, hyperparameter tuning
✅ **Evaluation Metrics:** Accuracy, precision, recall, F1-score, confusion matrices
✅ **Remote Sensing:** Hyperspectral image analysis, spectral unmixing

---

## Challenges & Solutions

### Challenge 1: Large .mat Files
**Problem:** Salinas_cube.mat is 50MB+, unsuitable for GitHub
**Solution:** Added to `.gitignore`; users download from course source

### Challenge 2: Convergence in Constrained Optimization
**Problem:** `minimize()` with sum-to-one + non-negativity constraints slow for 16K pixels
**Solution:** Good initialization ($\boldsymbol{\theta}_0 = [1/7, ..., 1/7]$) + increased `maxiter`

### Challenge 3: Bayesian Mixture Poor Performance
**Problem:** 13.14% accuracy (worse than random guessing for 16 classes)
**Solution:** Recognized model mismatch; QDA better suited for this dataset

---

## References

### Datasets
- **Salinas Hyperspectral Image:** [Grupo de Inteligencia Computacional (GIC)](http://www.ehu.eus/ccwintco/index.php/Hyperspectral_Remote_Sensing_Scenes)

### Papers
- Keshava, N. & Mustard, J. F. (2002). "Spectral Unmixing." *IEEE Signal Processing Magazine*
- Bioucas-Dias, J. M. et al. (2012). "Hyperspectral Unmixing Overview." *IEEE Journal of Selected Topics*

### Textbooks
- Bishop, C. M. (2006). *Pattern Recognition and Machine Learning*
- Hastie, T. et al. (2009). *The Elements of Statistical Learning*
- Murphy, K. P. (2012). *Machine Learning: A Probabilistic Perspective*

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

Made with ❤️ for Machine Learning

</div>
