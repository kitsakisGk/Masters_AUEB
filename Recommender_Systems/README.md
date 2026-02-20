# Recommender Systems

<div align="center">

## Collaborative Filtering, Content-Based, Topic Modeling & User Segmentation

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
- **User Segmentation:** Behavioral segments and synthetic dataset generation
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
├── Week_3_4/                # Content-Based Filtering & Simulation
│   ├── IMDB.ipynb
│   ├── IMDB_v2.ipynb
│   ├── Recsys_Simulation.ipynb
│   └── imdb_top_1000.csv
├── Week_5/                  # User Segmentation & Restaurant Recommendations
│   ├── Restaurant_Rating_Generator.ipynb
│   ├── segment1.csv
│   └── segment2.csv
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

## 🎯 Week 3-4: Content-Based Filtering & Simulation

### Content-Based Filtering (IMDB.ipynb)

**Concept:** Recommend movies based on item feature similarity (no user ratings needed).

**Similarity Factors:**
- **Genre** - Jaccard similarity of genre sets
- **Director** - Shared directors between movies
- **Stars** - Shared cast members
- **Release Year** - Normalized year difference
- **Rating** - IMDB rating as quality signal

**Dataset:** IMDB Top 1000 movies with metadata (genres, directors, stars, ratings, overviews)

### Enhanced Content-Based with SBERT (IMDB_v2.ipynb)

**Concept:** Add semantic understanding by embedding movie overviews with Sentence-BERT.

**Enhancements over basic version:**
- **SBERT (all-MiniLM-L6-v2)** - Encode movie overviews into dense vectors
- **Cosine Similarity** - Semantic text matching for plot descriptions
- **Explainable Scores** - Breakdown showing contribution of each factor
- **6 weighted factors:** genre, director, stars, release year, overview, rating

**Example Output:**
```
Toy Story → Toy Story 2 (score: 4.45)
  Factors: director=1.0, genre=1.0, ryear=0.96, rating=0.79, overview=0.37, star=0.33
```

### RecSys Simulation Framework (Recsys_Simulation.ipynb)

**Concept:** Simulate a full recommendation system with synthetic users to evaluate algorithms.

**Simulation Pipeline:**
1. **User Generation** - Create 100 synthetic users with random preference weights
2. **Seed Movies** - Each user gets 5 random seed movies they like
3. **Like Threshold** - Computed as mean similarity + 1.5 × std deviation
4. **Random Recommender** - Baseline: recommend random movies and check if user likes them
5. **Smart Recommender** - Uses content-based similarity to recommend movies similar to user's seed movies
6. **Evaluation** - Compare average likes per 50 recommendations

**Results:**
| Recommender | Avg Likes / 50 Recs | Hit Rate |
|---|---|---|
| Random | ~10/50 | ~20% |
| Smart (Content-Based) | ~48/50 | ~96% |

**Key Insight:** The smart recommender leverages multi-factor similarity (genre, director, stars, year, overview, rating) to dramatically outperform random selection, validating the content-based approach.

---

## 🎯 Week 5: User Segmentation & Restaurant Recommendations

### Restaurant Rating Generator (Restaurant_Rating_Generator.ipynb)

**Concept:** Simulate a restaurant recommendation dataset with distinct user segments to study how user preferences affect recommendation quality.

**Simulation Pipeline:**
1. **Restaurant Generation** - Create 100 synthetic restaurants with attributes: cuisine types, price range, delivery options, average rating & delivery time, payment methods
2. **User Segmentation** - Two behaviorally distinct user segments:
   - **Segment 1 - One-Trick Pony:** Older users (~60yo), single cuisine preference, rate based on high rating (>4) and fast delivery (≤35 min)
   - **Segment 2 - Young & Price-Driven:** Younger users (~25yo), multiple cuisine preferences, rate based on price tier with higher quality thresholds for expensive restaurants
3. **Rating Generation** - Generate CSV rating files for each segment based on segment-specific criteria
4. **Random Recommender** - Baseline recommender evaluated against each segment's preferences

**Key Takeaways:**
- User segmentation reveals that one-size-fits-all recommendations fail different user types
- Segment 1 cares about quality and speed; Segment 2 is budget-conscious with broader tastes
- Synthetic data generation enables controlled evaluation of recommendation strategies

---

## 🛠️ Technologies Used

- **Python 3.8+** - Primary programming language
- **pandas** - Data manipulation and analysis
- **tomotopy** - Fast topic modeling (LDA)
- **sentence-transformers** - SBERT for semantic embeddings
- **PyTorch** - Deep learning backend for SBERT
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

### Content-Based Filtering
- **Feature-Based Similarity:** Compare item attributes directly
- **Weighted Scoring:** Assign importance to each feature
- **SBERT Embeddings:** Semantic text similarity for descriptions
- **Explainability:** Score breakdown per factor

### Evaluation
- **Simulated Users:** Generate synthetic preferences for testing
- **Hit Rate:** Fraction of recommendations users liked
- **Baseline Comparison:** Random recommender as lower bound

---

## 🚀 Running the Notebooks

```bash
# Install dependencies
pip install pandas numpy scikit-learn tomotopy jupyter
pip install sentence-transformers torch

# Launch Jupyter
cd Recommender_Systems
jupyter notebook

# Week 1: Collaborative filtering
# Open: Week_1/Based and User-Based Recommendations.ipynb

# Week 2: Topic modeling
# Open: Week_2/LDA_movies.ipynb

# Week 3-4: Content-based filtering & simulation
# Open: Week_3_4/IMDB.ipynb
# Open: Week_3_4/Recsys_Simulation.ipynb

# Week 5: User segmentation & restaurant recommendations
# Open: Week_5/Restaurant_Rating_Generator.ipynb
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

### Content-Based Recommendation
```
Toy Story → Recommendations:
 Toy Story 2 (score: 4.45)
 Toy Story 3 (score: 3.35)
 Toy Story 4 (score: 3.27)
 Monsters, Inc. (score: 2.99)
```

---

## 🔑 Key Takeaways

1. **User-Based CF** works well when users have many ratings in common
2. **Item-Based CF** is more stable as item similarities change less over time
3. **LDA** reveals hidden structure in rating patterns beyond explicit genres
4. **Content-Based** doesn't need user ratings - uses item features directly
5. **SBERT embeddings** capture semantic plot similarity beyond keyword matching
6. **Simulation frameworks** enable systematic evaluation of recommendation algorithms
7. **User Segmentation** shows that different user types require tailored recommendation strategies
8. **Hybrid approaches** combining multiple methods often perform best

---

<div align="center">
<i>Part of the Master's in Data Science program at AUEB</i>
</div>
