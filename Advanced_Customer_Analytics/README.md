# Advanced Customer Analytics

<div align="center">

## Customer Segmentation, RFM Analysis & Predictive Modeling

![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)
![pandas](https://img.shields.io/badge/pandas-grey.svg)
![scikit-learn](https://img.shields.io/badge/scikit--learn-orange.svg)
![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-F37626.svg)

**Author:** Georgios Kitsakis
**Institution:** Athens University of Economics and Business (AUEB)

</div>

---

## 📖 Overview

This course focuses on advanced analytics techniques for understanding customer behavior, segmentation, and lifetime value prediction. Topics include:

- **RFM Analysis:** Recency, Frequency, Monetary segmentation
- **Customer Segmentation:** Clustering techniques (K-means, Hierarchical)
- **Predictive Modeling:** Churn prediction, CLV estimation
- **Marketing Analytics:** Campaign effectiveness, A/B testing
- **Recommendation Systems:** Collaborative filtering

## 📁 Repository Structure

```
Advanced_Customer_Analytics/
├── Week_1/              # Introduction to Customer Analytics
├── Week_2/              # RFM Analysis & Segmentation
├── Week_3/              # Predictive Modeling
├── Week_4/              # Advanced Topics
├── Week_5/              # Multimodal Topic Mining with BERTopic
├── Assignment_1/        # Interpretable Predictions - Clothing Recommendations
├── Assignment_2/        # Visual Data Predictions - Flickr30k Topic Mining
└── README.md
```

## 🎯 Key Topics

### Week 1: Foundations
- Customer data exploration
- Descriptive statistics
- Data preprocessing for customer analytics

### Week 2: RFM Analysis
- Recency, Frequency, Monetary metrics
- Customer segmentation strategies
- Clustering algorithms

### Week 3: Predictive Models
- Churn prediction models
- Customer lifetime value (CLV)
- Logistic regression for classification

### Week 4: Advanced Techniques
- Marketing mix modeling
- Attribution analysis
- Recommendation systems

### Week 5: Multimodal Topic Mining
- BERTopic for visual and text data
- CLIP embeddings for multimodal analysis
- Image-caption topic discovery
- FAGE brand case study

### Assignment 1: Interpretable Predictions
- Women's Clothing E-Commerce dataset (23,486 reviews)
- Recommendation prediction using XGBoost (82.7% accuracy)
- Interpretable AI: DiCE counterfactuals, LIME, SHAP, Anchors
- Feature importance analysis

### Assignment 2: Visual Data Predictions
- Flickr30k dataset (31,783 captioned images)
- Multimodal topic mining with BERTopic + CLIP
- Topic classification with 97.6% accuracy (Logistic Regression)
- Image-text semantic alignment

## 🛠️ Installation

```bash
# Install core dependencies
pip install pandas numpy scikit-learn matplotlib seaborn jupyter
pip install lifetimes statsmodels

# For Assignment 1 (Interpretable AI)
pip install dice-ml xgboost lime shap

# For Assignment 2 & Week 5 (Multimodal Topic Mining)
pip install bertopic[vision] kagglehub
```

## 📊 Technologies Used

- **Python 3.8+**
- **pandas:** Data manipulation
- **scikit-learn:** Machine learning algorithms
- **Matplotlib/Seaborn:** Visualization
- **lifetimes:** CLV modeling
- **BERTopic:** Topic modeling with transformers
- **CLIP:** Multimodal embeddings (OpenAI)
- **XGBoost:** Gradient boosting
- **DiCE, LIME, SHAP:** Interpretable AI
- **kagglehub:** Dataset management
- **Jupyter Notebook:** Interactive analysis

## 📚 Key Concepts

- RFM (Recency, Frequency, Monetary) Analysis
- K-means and Hierarchical Clustering
- Customer Lifetime Value (CLV)
- Churn Prediction
- A/B Testing
- Cohort Analysis
- Multimodal Topic Mining
- CLIP Embeddings for Image-Text Alignment
- Interpretable AI (Counterfactuals, LIME, SHAP)
- BERTopic for Visual Data

---

<div align="center">
<i>Part of the Master's in Data Science program at AUEB</i>
</div>
