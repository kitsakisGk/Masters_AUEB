<div align="center">

# Numerical Optimization

### Applied Optimization Algorithms for Engineering and Data Science

[![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)](https://www.python.org/)
[![NumPy](https://img.shields.io/badge/NumPy-Scientific-013243.svg)](https://numpy.org/)
[![SciPy](https://img.shields.io/badge/SciPy-Optimization-8CAAE6.svg)](https://scipy.org/)
[![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-F37626.svg)](https://jupyter.org/)

**Author:** Georgios Kitsakis
**Institution:** Athens University of Economics and Business (AUEB)

[Overview](#overview) • [Exercises](#exercises) • [Installation](#installation) • [Results](#results)

---

</div>

## Overview

This repository contains implementations of numerical optimization algorithms applied to real-world engineering and data science problems. The projects demonstrate expertise in constrained/unconstrained optimization, linear algebra methods, and their applications to illumination design, classification, and web graph analysis.

### 🎯 Key Concepts Covered

- **Least Squares Optimization** (constrained & unconstrained)
- **Singular Value Decomposition (SVD)**
- **Eigenvalue Methods & Power Iteration**
- **PageRank Algorithm**
- **Convex Optimization with Constraints**
- **Numerical Linear Algebra**

---

## Exercises

### 📋 Exercise 1: Lamp Illumination Optimization

**Problem:** Design an optimal lighting system for a 25×25 meter area using 10 lamps to achieve uniform illumination.

<div align="center">
<img src="https://via.placeholder.com/600x200/0D47A1/FFFFFF?text=Lamp+Illumination+Optimization" alt="Illumination Optimization">
</div>

#### 🎯 Objectives

1. **Inverse Square Law Modeling:** Implement $A_{ij} = d_{ij}^{-2}$ for illumination matrix
2. **Unconstrained Least Squares:** Minimize $||Ap - l||^2$ for optimal lamp powers
3. **Constrained Optimization:** Add constraints:
   - Total power budget: $\sum_{i=1}^{10} p_i = 10$
   - Non-negativity: $p_i \geq 0$
4. **Position Optimization:** Find optimal 3D lamp positions (with height constraints 4-6m)

#### 📊 Results

| Configuration | RMS Error | Improvement |
|--------------|-----------|-------------|
| All lamps power = 1 | 0.2417 | Baseline |
| Unconstrained LS | 0.1404 | 41.9% |
| Constrained LS (power budget) | 0.1558 | 35.5% |
| **Optimized positions** | **0.1036** | **57.1%** |

#### 🔑 Key Techniques

- **Matrix formulation** of physical illumination model
- **Sequential Least Squares Programming (SLSQP)** for constraints
- **Random search** for position optimization
- **Visualization** of 2D illumination heatmaps

#### 📁 Files

- [Assignment_1.ipynb](Exercise_1/Assignment_1.ipynb) - Full implementation notebook
- [ls_lamp.pdf](Exercise_1/ls_lamp.pdf) - Problem description

---

### 📋 Exercise 2: SVD for Handwritten Digit Classification

**Problem:** Use Singular Value Decomposition for dimensionality reduction and classification of handwritten digits.

<div align="center">
<img src="https://via.placeholder.com/600x200/1B5E20/FFFFFF?text=SVD+Classification+Pipeline" alt="SVD Classification">
</div>

#### 🎯 Objectives

1. **SVD Decomposition:** $X = U\Sigma V^T$ on digit image dataset
2. **Dimensionality Reduction:** Project high-dimensional images to low-dimensional subspace
3. **Basis Vector Analysis:** Visualize principal components (eigendigits)
4. **Classification:** Build classifier using reduced features

#### 📊 Implementation Details

**Dataset:**
- Handwritten digits (0-9)
- High-dimensional pixel features
- Matrix formulation: each row = flattened image

**SVD Pipeline:**
1. **Data centering:** Subtract mean from features
2. **SVD computation:** Extract left singular vectors (basis)
3. **Dimensionality reduction:** Keep top-k components
4. **Reconstruction analysis:** Measure information retention

**Visualization Outputs:**
- **Basis vectors (eigendigits):** First principal components
- **Singular value plot:** Explained variance by component
- **Heatmap:** Feature importance matrix

#### 🔑 Key Techniques

- **Gram-Schmidt orthogonalization** for basis construction
- **Truncated SVD** for efficient computation
- **Eigenvalue analysis** for variance explained
- **Classification** with reduced features

#### 📁 Files

- [Assignment_2.ipynb](Exercise_2/Assignment_2.ipynb) - Main implementation
- [data.xlsx](Exercise_2/data.xlsx) - Handwritten digits dataset
- [Basis_vectors_GS.png](Exercise_2/Basis_vectors_GS.png) - Visualization of eigendigits
- [heatmap.png](Exercise_2/heatmap.png) - Feature correlation heatmap

---

### 📋 Exercise 3: PageRank Algorithm Implementation

**Problem:** Implement Google's PageRank algorithm using eigenvalue methods to rank web pages by importance.

<div align="center">
<img src="https://via.placeholder.com/600x200/4A148C/FFFFFF?text=PageRank+Algorithm" alt="PageRank">
</div>

#### 🎯 Objectives

1. **Graph Representation:** Model web as directed graph (nodes = pages, edges = links)
2. **Transition Matrix:** Construct column-stochastic matrix from link structure
3. **Power Iteration:** Compute dominant eigenvector via iterative method
4. **Teleportation Factor:** Handle dangling nodes with damping parameter $\alpha$

#### 📐 Mathematical Formulation

**PageRank Equation:**
$$\mathbf{r} = (1-\alpha)\mathbf{M}\mathbf{r} + \alpha\mathbf{e}/n$$

Where:
- $\mathbf{r}$ = PageRank vector (stationary distribution)
- $\mathbf{M}$ = Column-stochastic transition matrix
- $\alpha$ = Teleportation probability (typically 0.15)
- $\mathbf{e}$ = Vector of ones

**Power Iteration Algorithm:**
```
r^(0) = [1/n, ..., 1/n]  # Uniform initialization
while ||r^(k+1) - r^(k)|| > tolerance:
    r^(k+1) = (1-α)·M·r^(k) + α·e/n
```

#### 📊 Dataset

- **Source:** Stanford web graph (`stanweb.dat`)
- **Nodes:** ~281,000 web pages
- **Edges:** ~2.3 million hyperlinks
- **Format:** Sparse edge list (source → target)

#### 🔑 Key Techniques

- **Sparse matrix representation** for memory efficiency
- **Power iteration** for dominant eigenvector computation
- **Convergence analysis** with L1 norm
- **Ranking interpretation** of eigenvalue centrality

#### 📊 Results

- **Convergence:** Typically <50 iterations for $\epsilon = 10^{-6}$
- **Top-ranked pages:** Stanford homepage, CS department, faculty pages
- **Long tail distribution:** Most pages have low PageRank (scale-free property)

#### 📁 Files

- [Assignment_3.ipynb](Exercise_3/project_pagerank/Assignment_3.ipynb) - Implementation
- [stanweb.dat](Exercise_3/project_pagerank/stanweb.dat) - Stanford web graph (64MB)
- [pagerank.pdf](Exercise_3/project_pagerank/pagerank.pdf) - Algorithm description
- [eig_PR_eng.pdf](Exercise_3/project_pagerank/eig_PR_eng.pdf) - Eigenvalue analysis

---

## Installation

### Prerequisites

- Python 3.8 or higher
- Jupyter Notebook
- pip package manager

### Setup

**1. Clone the repository:**
```bash
git clone https://github.com/kitsakisGk/numerical-optimization.git
cd numerical-optimization
```

**2. Create virtual environment (recommended):**
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

**3. Install dependencies:**
```bash
pip install -r requirements.txt
```

**4. Launch Jupyter:**
```bash
jupyter notebook
```

---

## Technologies Used

### Core Libraries

- **NumPy** - Numerical computing, matrix operations
- **SciPy** - Optimization algorithms (SLSQP, minimize)
- **Matplotlib** - 2D plotting and visualization
- **Pandas** - Data manipulation (Exercise 2)
- **Jupyter** - Interactive notebook environment

### Algorithms Implemented

| Algorithm | Application | Complexity |
|-----------|-------------|------------|
| **Least Squares (normal equations)** | Lamp optimization | $O(n^3)$ |
| **SLSQP** | Constrained optimization | Iterative |
| **SVD** | Dimensionality reduction | $O(mn^2)$ |
| **Power Iteration** | PageRank eigenvector | $O(k \cdot nnz)$ |
| **Random Search** | Position optimization | $O(trials \cdot n^3)$ |

---

## Project Structure

```
numerical-optimization/
│
├── Exercise_1/
│   ├── Assignment_1.ipynb         # Lamp illumination optimization
│   └── ls_lamp.pdf                # Problem description
│
├── Exercise_2/
│   ├── Assignment_2.ipynb         # SVD classification
│   ├── data.xlsx                  # Handwritten digits dataset
│   ├── Basis_vectors_GS.png       # Eigendigits visualization
│   ├── heatmap.png                # Correlation heatmap
│   └── ima2.m                     # MATLAB support script
│
├── Exercise_3/
│   └── project_pagerank/
│       ├── Assignment_3.ipynb     # PageRank implementation
│       ├── stanweb.dat            # Stanford web graph
│       ├── pagerank.pdf           # Algorithm reference
│       └── eig_PR_eng.pdf         # Eigenvalue analysis
│
├── requirements.txt               # Python dependencies
├── .gitignore                     # Git ignore rules
└── README.md                      # This file
```

---

## Key Learning Outcomes

### Mathematical Foundations

✅ **Linear Algebra Applications**
- Matrix decompositions (SVD, eigenvalues)
- Iterative methods for large-scale systems
- Orthogonalization and projections

✅ **Optimization Theory**
- Convex vs. non-convex optimization
- Constrained optimization (equality/inequality)
- Lagrange multipliers and KKT conditions

✅ **Numerical Methods**
- Stability and convergence analysis
- Sparse matrix computations
- Approximation and error analysis

### Engineering Skills

✅ **Problem Formulation**
- Translating physical problems to mathematical models
- Designing objective functions and constraints
- Validating solutions against requirements

✅ **Algorithm Implementation**
- Efficient NumPy/SciPy usage
- Vectorization for performance
- Memory management for large datasets

✅ **Visualization & Interpretation**
- Heatmaps for spatial data
- Convergence plots
- Histogram distributions

---

## Results Summary

### Exercise 1: Lamp Optimization

**Achievement:** Reduced illumination non-uniformity by **57.1%** through combined power and position optimization.

**Impact:**
- Practical applications in architectural lighting design
- Demonstrates constrained resource allocation
- Showcases random search for non-convex optimization

### Exercise 2: SVD Classification

**Achievement:** Successfully reduced dimensionality while preserving discriminative information for digit classification.

**Impact:**
- Foundation for modern dimensionality reduction (PCA, t-SNE)
- Demonstrates linear algebra in machine learning
- Interpretable principal components (eigendigits)

### Exercise 3: PageRank

**Achievement:** Implemented scalable PageRank algorithm converging in <50 iterations on 281K node graph.

**Impact:**
- Core algorithm powering Google Search
- Demonstrates eigenvalue methods for graph analysis
- Sparse matrix optimization techniques

---

## Challenges & Solutions

### Challenge 1: Lamp Position Optimization (Non-Convex)
**Problem:** Optimizing lamp positions is non-convex with many local minima
**Solution:** Implemented random search with multiple initializations

### Challenge 2: PageRank Convergence
**Problem:** Large sparse matrix requires efficient storage and iteration
**Solution:** Used sparse matrix formats and vectorized power iteration

### Challenge 3: SVD Computational Cost
**Problem:** Full SVD on large matrices is computationally expensive
**Solution:** Truncated SVD keeping only top-k singular values

---

## Future Extensions

- [ ] **Exercise 1:** Gradient-based position optimization (e.g., L-BFGS)
- [ ] **Exercise 2:** Compare SVD with modern dimensionality reduction (UMAP, Autoencoders)
- [ ] **Exercise 3:** Personalized PageRank with user-specific teleportation
- [ ] Add GPU acceleration for large-scale computations
- [ ] Implement stochastic optimization methods (SGD, Adam)

---

## References

### Academic Papers
- **PageRank:** Page, L. et al. (1999). "The PageRank Citation Ranking"
- **SVD Applications:** Wall, M. E. et al. (2003). "Singular Value Decomposition and Principal Component Analysis"

### Textbooks
- Boyd & Vandenberghe - *Convex Optimization*
- Nocedal & Wright - *Numerical Optimization*
- Trefethen & Bau - *Numerical Linear Algebra*

### Documentation
- [SciPy Optimize](https://docs.scipy.org/doc/scipy/reference/optimize.html)
- [NumPy Linear Algebra](https://numpy.org/doc/stable/reference/routines.linalg.html)

---

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

**Georgios Kitsakis**
- GitHub: [@kitsakisGk](https://github.com/kitsakisGk)
- LinkedIn: [Add your LinkedIn]

---

<div align="center">

**Athens University of Economics and Business**
*Master's in Data Science*

Made with ❤️ for Mathematical Optimization

</div>
