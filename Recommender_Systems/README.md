# Recommender Systems

<div align="center">

## Collaborative Filtering, Content-Based & Topic Modeling for Recommendations

![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)
![pandas](https://img.shields.io/badge/pandas-grey.svg)
![scikit-learn](https://img.shields.io/badge/scikit--learn-orange.svg)
![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-F37626.svg)

**Author:** Georgios Kitsakis
**Institution:** Athens University of Economics and Business (AUEB)

</div>

---

## 📖 Overview

This course covers the fundamental techniques and algorithms for building recommender systems:

- **Collaborative Filtering:** User-based and item-based recommendations
- **Content-Based Filtering:** Recommendations based on item features
- **Topic Modeling:** LDA for discovering latent topics in user preferences
- **Similarity Metrics:** Jaccard coefficient, cosine similarity
- **Evaluation:** Precision, recall, recommendation quality assessment

## 📁 Repository Structure

```
Recommender_Systems/
├── Week_1/                  # Collaborative Filtering
│   └── Based and User-Based Recommendations.ipynb
├── Week_2/                  # Topic Modeling for Recommendations
│   ├── LDA_movies.ipynb
│   └── Topic Modeling.ipynb
└── README.md
```

---

## 🎯 Week 1: Collaborative Filtering

### User-Based Collaborative Filtering

**Concept:** Recommend items that similar users have liked.

**Algorithm:**
1. Load user ratings and discretize (Positive/Neutral/Negative)
2. Compute user similarity using Jaccard coefficient
3. Find k most similar neighbors for target user
4. Aggregate neighbor ratings with similarity weighting
5. Recommend top-scoring unseen items

**Key Functions:**
- `load_user_ratings()` - Map users to their movie ratings
- `get_user_neighbors()` - Compute pairwise user similarities
- `recommend_ub()` - Generate user-based recommendations

### Item-Based Collaborative Filtering

**Concept:** Recommend items similar to those the user has liked.

**Algorithm:**
1. Load item ratings from all users
2. Compute item-item similarity using Jaccard coefficient
3. For each liked item, find similar items
4. Aggregate similarity scores across all liked items
5. Recommend top-scoring unseen items

**Key Functions:**
- `load_movie_ratings()` - Map movies to user ratings
- `get_movie_neighbors()` - Compute pairwise movie similarities
- `recommend_mb()` - Generate item-based recommendations

### Dataset

**MovieLens Small (ml-latest-small):**
- 100,836 ratings
- 9,742 movies
- 610 users
- Rating scale: 0.5 - 5.0 stars

---

## 🎯 Week 2: Topic Modeling for Recommendations

### LDA (Latent Dirichlet Allocation) for Movies

**Concept:** Discover latent topics in user rating patterns to understand user preferences and movie characteristics.

**Approach:**
1. Create "documents" from user rating histories
2. Each rating becomes a token: `{movieId}{sentiment}` (e.g., "260P" = Movie 260, Positive)
3. Train LDA model to discover latent topics
4. Analyze topics to understand user preference patterns

**Implementation:**
- Uses `tomotopy` library for efficient LDA training
- 30 topics discovered from user rating patterns
- 500 training iterations

**Topic Analysis:**
- Each topic represents a cluster of similarly-rated movies
- Topics reveal genre patterns, era preferences, sentiment trends
- Example topics:
  - "Well-liked Drama movies (classic, 1939-1994)"
  - "Disliked Action movies (2000s, 2000-2007)"
  - "Mixed Comedy movies (80s-90s)"

**Key Insights:**
- Users cluster into preference groups based on rating patterns
- Movies cluster based on who rates them similarly
- Topics can power hybrid recommendation systems

---

## 🛠️ Technologies Used

- **Python 3.8+** - Primary programming language
- **pandas** - Data manipulation and analysis
- **tomotopy** - Fast topic modeling (LDA)
- **scikit-learn** - Machine learning utilities
- **Jupyter Notebook** - Interactive analysis

---

## 📚 Key Concepts

### Collaborative Filtering
- **User-User Similarity:** Users who rate items similarly
- **Item-Item Similarity:** Items rated similarly by users
- **Jaccard Coefficient:** |A ∩ B| / |A ∪ B|
- **Neighborhood Methods:** k-NN for finding similar users/items

### Rating Discretization
- **Positive (P):** Rating > 3.0
- **Neutral (A):** Rating = 3.0
- **Negative (N):** Rating < 3.0

### Topic Modeling
- **LDA:** Probabilistic model for discovering topics
- **Document-Topic Distribution:** User preference profile
- **Topic-Word Distribution:** Movie clusters within topics

### Recommendation Strategies
- **Top-N Recommendations:** Rank and select top items
- **Similarity Weighting:** Weight votes by similarity score
- **Cold Start Problem:** New users/items with no ratings

---

## 🚀 Running the Notebooks

```bash
# Install dependencies
pip install pandas numpy scikit-learn tomotopy jupyter

# Launch Jupyter
cd Recommender_Systems
jupyter notebook

# Week 1: Run collaborative filtering
# Open: Week_1/Based and User-Based Recommendations.ipynb

# Week 2: Run topic modeling
# Open: Week_2/LDA_movies.ipynb
```

---

## 📊 Example Output

### User-Based Recommendation
```
I suggest the following movies because they have received
positive ratings from users who tend to like what you like:

 805 Time to Kill, A (1996)
 494 Executive Decision (1996)
 25 Leaving Las Vegas (1995)
 1356 Star Trek: First Contact (1996)
 376 River Wild, The (1994)
```

### Item-Based Recommendation
```
I suggest the following movies:

 1210 Star Wars: Episode VI - Return of the Jedi (1983)
 1196 Star Wars: Episode V - The Empire Strikes Back (1980)
 480 Jurassic Park (1993)
 1198 Raiders of the Lost Ark (1981)
 589 Terminator 2: Judgment Day (1991)
```

### LDA Topic Example
```
Topic 0: "Disliked Action movies (2000s, 2000-2007)"
  [-] Daredevil (2003) | Action|Crime
  [-] Mr. & Mrs. Smith (2005) | Action|Adventure|Comedy|Romance
  [+] Serenity (2005) | Action|Adventure|Sci-Fi
  [-] Spider-Man 3 (2007) | Action|Adventure|Sci-Fi|Thriller
```

---

## 🔑 Key Takeaways

1. **User-Based CF** works well when users have many ratings in common
2. **Item-Based CF** is more stable as item similarities change less over time
3. **LDA** reveals hidden structure in rating patterns beyond explicit genres
4. **Hybrid approaches** combining multiple methods often perform best
5. **Cold start** remains a challenge - need fallback strategies for new users/items

---

<div align="center">
<i>Part of the Master's in Data Science program at AUEB</i>
</div>
