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
├── Assignment_1/        # Interpretable Predictions - Clothing Recommendations
├── Assignment_2/        # Visual Data Predictions - Yu-Gi-Oh! Card Topic Mining
├── Assignment_3/        # RAG Pipeline - Climate Change Q&A System
└── README.md
```

## 🎯 Assignments

### Assignment 1: Interpretable Predictions
- Women's Clothing E-Commerce dataset (23,486 reviews)
- Recommendation prediction using XGBoost (82.7% accuracy)
- Interpretable AI: DiCE counterfactuals, LIME, SHAP, Anchors
- Feature importance analysis

### Assignment 2: Visual Data Predictions
- Yu-Gi-Oh! Cards dataset (10,000+ trading cards with images and descriptions)
- Multimodal topic mining with BERTopic + CLIP
- Card archetype and theme classification
- Image-text semantic alignment for trading cards

### Assignment 3: RAG Pipeline
- End-to-end Retrieval-Augmented Generation system
- Climate change Q&A with TinyLlama and FAISS vector database
- Document preprocessing and chunking strategies
- Embedding-based retrieval with all-MiniLM-L6-v2
- Comprehensive evaluation with 10 test questions

## 🛠️ Installation

```bash
# Install core dependencies
pip install pandas numpy scikit-learn matplotlib seaborn jupyter
pip install lifetimes statsmodels

# For Assignment 1 (Interpretable AI)
pip install dice-ml xgboost lime shap

# For Assignment 2 (Multimodal Topic Mining)
pip install bertopic[vision] kagglehub

# For Assignment 3 (RAG Pipeline)
pip install llama-cpp-python sentence-transformers faiss-cpu
```

## 📊 Technologies Used

- **Python 3.8+**
- **pandas:** Data manipulation
- **scikit-learn:** Machine learning algorithms
- **Matplotlib/Seaborn:** Visualization
- **XGBoost:** Gradient boosting
- **DiCE, LIME, SHAP, Anchors:** Interpretable AI
- **BERTopic:** Topic modeling with transformers
- **CLIP:** Multimodal embeddings (OpenAI)
- **TinyLlama:** Lightweight LLM for text generation
- **FAISS:** Vector database for similarity search
- **sentence-transformers:** Embedding models
- **kagglehub:** Dataset management
- **Jupyter Notebook:** Interactive analysis

## 📚 Key Concepts

- **Interpretable AI:** Counterfactuals (DiCE), Local explanations (LIME), Feature importance (SHAP), Rule-based explanations (Anchors)
- **Multimodal Topic Mining:** BERTopic with CLIP embeddings for image-text analysis
- **Retrieval-Augmented Generation (RAG):** LLM-powered Q&A with vector database retrieval
- **Customer Analytics:** RFM Analysis, Segmentation, Predictive Modeling

---

<div align="center">
<i>Part of the Master's in Data Science program at AUEB</i>
</div>
