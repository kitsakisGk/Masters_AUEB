# Recommender Systems

<div align="center">

## Collaborative Filtering, Content-Based, Topic Modeling & User Segmentation

![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)
![pandas](https://img.shields.io/badge/pandas-grey.svg)
![tomotopy](https://img.shields.io/badge/tomotopy-LDA-green.svg)
![sentence--transformers](https://img.shields.io/badge/sentence--transformers-SBERT-orange.svg)
![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-F37626.svg)

**Author:** Georgios Kitsakis
**Institution:** Athens University of Economics and Business (AUEB)

</div>

---

## 📖 Overview

This course covers the fundamental techniques and algorithms for building recommender systems — from classical collaborative filtering to topic modeling, content-based similarity, and synthetic simulation for evaluation.

- **Collaborative Filtering:** User-based and item-based recommendations using Jaccard similarity
- **Topic Modeling:** LDA to discover latent preference patterns in rating data
- **Content-Based Filtering:** Item similarity using multi-factor weighted scoring + SBERT embeddings
- **Simulation & Segmentation:** Synthetic dataset generation with behaviorally distinct user segments
- **Evaluation:** Hit rate, baseline comparison, segment recovery with LDA anchor words

---

## 📁 Repository Structure

```
Recommender_Systems/
├── Week_1/                        # Collaborative Filtering
│   └── Based and User-Based Recommendations.ipynb
├── Week_2/                        # Topic Modeling for Recommendations
│   ├── LDA_movies.ipynb
│   └── Topic Modeling.ipynb
├── Week_3_4/                      # Content-Based Filtering & Simulation
│   ├── IMDB.ipynb
│   ├── IMDB_v2.ipynb
│   └── Recsys_Simulation.ipynb
├── Week_5/                        # User Segmentation & Restaurant Recommendations
│   ├── Restaurant_Rating_Generator.ipynb
│   └── Restaurant_Rating_Generator_professor.ipynb
├── Week_6/                        # Two Towers Retrieval Model
│   └── 2Towers.ipynb
├── Assignment_1/                  # HW1: Synthetic Video Game RecSys + LDA Segment Discovery
│   ├── Assignment_1_Kitsakis.ipynb
│   └── Assignment_1_Kitsakis_Colab.ipynb
└── README.md
```

---

## 🎯 Week 1: Collaborative Filtering

### User-Based Collaborative Filtering

**Concept:** Find users who rated things similarly to the target user, then recommend what they liked.

**Algorithm:**
1. Load user ratings and discretize (Positive / Neutral / Negative)
2. Compute pairwise user similarity using Jaccard coefficient
3. Find k most similar neighbors for the target user
4. Aggregate neighbor ratings weighted by similarity
5. Recommend top-scoring unseen items

**Key Functions:** `load_user_ratings()`, `get_user_neighbors()`, `recommend_ub()`

### Item-Based Collaborative Filtering

**Concept:** Find items that were rated similarly to items the user already likes, then recommend those.

**Algorithm:**
1. Compute pairwise item similarity using Jaccard coefficient
2. For each item the user liked, find the most similar items
3. Aggregate similarity scores and recommend the top unseen ones

**Key Functions:** `load_movie_ratings()`, `get_movie_neighbors()`, `recommend_mb()`

### Dataset
**MovieLens Small (ml-latest-small):** 100,836 ratings · 9,742 movies · 610 users · scale 0.5–5.0

**Example Output:**
```
User-Based: Time to Kill A (1996), Executive Decision (1996), Leaving Las Vegas (1995)
Item-Based: Star Wars V (1980), Star Wars VI (1983), Jurassic Park (1993)
```

---

## 🎯 Week 2: Topic Modeling for Recommendations

### LDA (Latent Dirichlet Allocation) for Movies

**Concept:** Treat each user's rating history as a "document" and discover latent topics that represent clusters of similarly-rated movies.

**Approach:**
1. Each rating becomes a token: `{movieId}{sentiment}` (e.g. `260P` = Movie 260, Positive)
2. Train LDA with `tomotopy` — 30 topics, 500 iterations
3. Interpret topics as preference clusters (genre × era × sentiment)

**Example Topics:**
```
Topic 0: "Disliked Action movies (2000s)"
  [-] Daredevil (2003), [-] Spider-Man 3 (2007), [+] Serenity (2005)

Topic 7: "Well-liked Drama movies (classic, 1939-1994)"
  [+] Schindler's List, [+] Shawshank Redemption, [+] Forrest Gump
```

**Key Insight:** Users cluster into preference groups; movies cluster by who rates them similarly. Topics can power hybrid recommendation systems without explicit genre labels.

---

## 🎯 Week 3-4: Content-Based Filtering & Simulation

### Basic Content-Based Filtering (`IMDB.ipynb`)

**Concept:** Recommend movies based on multi-attribute feature similarity — no user ratings needed.

**Similarity Factors:** Genre (Jaccard) · Director · Stars · Release Year · IMDB Rating

**Dataset:** IMDB Top 1000 movies with genres, directors, cast, ratings, and plot overviews

### Enhanced with SBERT (`IMDB_v2.ipynb`)

**Enhancements:** Adds a 6th factor — plot overview similarity via **Sentence-BERT (all-MiniLM-L6-v2)** embeddings and cosine similarity. Each recommendation comes with an explainable score breakdown.

```
Toy Story → Toy Story 2 (score: 4.45)
  director=1.0  genre=1.0  ryear=0.96  rating=0.79  overview=0.37  star=0.33
```

### RecSys Simulation Framework (`Recsys_Simulation.ipynb`)

**Concept:** Generate 100 synthetic users with random preference weights, give each 5 seed movies, then compare a random baseline vs. a smart content-based recommender.

| Recommender | Avg Likes / 50 Recs | Hit Rate |
|---|---|---|
| Random | ~10 / 50 | ~20% |
| Smart (Content-Based) | ~48 / 50 | ~96% |

**Key Insight:** Multi-factor content similarity dramatically outperforms random — validating the content-based approach in a controlled simulation.

---

## 🎯 Week 5: User Segmentation & Restaurant Recommendations

### Restaurant Rating Generator (`Restaurant_Rating_Generator.ipynb`)

**Concept:** Build a synthetic restaurant dataset with two behaviorally distinct user segments, generate ratings, and evaluate a random recommender baseline — demonstrating that one-size-fits-all recommendations fail in heterogeneous populations.

**Entities:** 100 restaurants with 9 attributes: cuisine types, price range, self-delivery, offers, extra delivery cost, minimum order, average rating, average delivery time, payment methods

**User Segments:**

| Segment | Profile | Like Condition |
|---|---|---|
| One-Trick Pony | Older (~60yo), single cuisine | Rating > 4.0 AND delivery ≤ 35 min |
| Young & Price-Driven | Young (~25yo), broad tastes | Rating threshold depends on price tier |

**Key Insight:** Segment 1 prioritises quality and speed; Segment 2 is budget-conscious with broader tastes. Serving both with the same recommender degrades performance for at least one group.

---

## 📝 Assignment 1: Video Game RecSys + LDA Segment Discovery

**Domain:** PC & PlayStation video games
**Task:** Build a full synthetic recommendation pipeline and use LDA with anchor words to automatically recover the 5 user segments from rating data alone.

### User Segments

| # | Segment | Core Personality |
|---|---|---|
| 1 | **PC Gamer** | PC/BOTH platform only, high Metacritic (≥75), long playtime (≥20h), prefers Strategy/RPG |
| 2 | **Console Gamer** | PS/BOTH platform, well-reviewed exclusives, action-oriented |
| 3 | **Cross-Platform Gamer** | Plays on both platforms, values multiplayer and long games |
| 4 | **Budget Gamer** | Price-sensitive (≤25€), decent reviews, any platform |
| 5 | **Casual / Family Gamer** | PEGI 3/7, short playtime, family-friendly genres (Puzzle, Sports, Racing) |

### Game Attributes (10 total)
`title` · `platform` (PC/PS/BOTH) · `genre` · `price_eur` · `metacritic` · `avg_playtime_h` · `is_multiplayer` · `is_exclusive` · `age_rating` (PEGI) · `release_year`

### Pipeline

```
generate_entities()  →  200 synthetic video games
generate_users()     →  1,000 users across 5 segments (200 each)
generate_ratings()   →  binary like/dislike ratings with configurable noise %
learn_segments()     →  LDA with anchor words to recover the 5 segments
```

### Two-Phase Approach (`Assignment_1_Kitsakis_Colab.ipynb`)

The notebook runs both phases back to back for direct comparison of LDA segment recovery quality:

**Phase 1 — Simple criteria:** Broad, obvious filters per segment (e.g. just platform). Tests whether LDA can find segments from weak signals alone.

**Phase 2 — Full criteria:** Multi-attribute conditions (platform + Metacritic + playtime + genre + age rating). Gives LDA richer, more distinctive signals per segment.

**Key Insight:** Phase 2's richer criteria produce more distinctive rating patterns, allowing LDA (with anchor words) to recover the 5 segments far more cleanly than Phase 1's broad signals.

---

## 🎯 Week 6: Two Towers Retrieval Model

### Two-Tower Model (`2Towers.ipynb`)

**Concept:** Learn a vector embedding for every user and every movie. If a user likes a movie, their vectors should point in the same direction (high dot product). If not, they should point away. At inference time, find the movies whose vectors are closest to the user's vector.

**Dataset:** MovieLens 100K — downloaded automatically from the GroupLens website

**Architecture:**
- **User Tower** — embedding layer mapping each user ID to a dense vector
- **Movie Tower** — embedding layer mapping each movie title to a dense vector
- **Scoring** — dot product between user and movie vectors
- **Training** — pairwise loss: push liked movies closer, push randomly sampled negatives further away

**Pipeline:**
1. Load ratings and map users/movies to integer indices
2. Train/test split
3. Train Two-Tower model with negative sampling
4. Evaluate with Recall@K
5. Generate top-N recommendations for any user

**Why Two Towers?** Classical CF methods don't scale — computing all pairwise similarities is O(n²). Two Towers learns compact embeddings that can be searched efficiently with approximate nearest neighbour methods, making it the backbone of real-world recommenders at scale (YouTube, Spotify, Pinterest).

---

## 🛠️ Technologies Used

- **Python 3.8+** - Primary language
- **pandas / NumPy** - Data manipulation
- **tomotopy** - Fast LDA topic modeling with anchor word support
- **sentence-transformers** - SBERT for semantic plot embeddings
- **PyTorch** - Two Towers model and deep learning backend for SBERT
- **scikit-learn** - Utilities and metrics
- **Jupyter Notebook** - Interactive development

---

## 📚 Key Concepts

| Concept | Description |
|---|---|
| **Jaccard Coefficient** | \|A ∩ B\| / \|A ∪ B\| — used for user/item similarity |
| **LDA** | Probabilistic model that discovers latent topics from co-occurrence patterns |
| **Anchor Words** | Topic words forced into specific topics to guide LDA toward known segments |
| **SBERT** | Sentence embeddings that capture semantic plot similarity beyond keywords |
| **Hit Rate** | Fraction of recommendations that a user actually liked |
| **Cold Start** | The challenge of recommending to new users/items with no ratings yet |
| **Noise Parameter** | Controls how often a user ignores their own preferences (random behaviour) |

---

## 🚀 Running the Notebooks

```bash
# Install dependencies
pip install pandas numpy scikit-learn tomotopy sentence-transformers torch jupyter

# Week 1 — Collaborative filtering
# Week_1/Based and User-Based Recommendations.ipynb

# Week 2 — Topic modeling
# Week_2/LDA_movies.ipynb

# Week 3-4 — Content-based filtering & simulation
# Week_3_4/IMDB.ipynb  |  Week_3_4/IMDB_v2.ipynb  |  Week_3_4/Recsys_Simulation.ipynb

# Week 5 — Restaurant segmentation
# Week_5/Restaurant_Rating_Generator.ipynb

# Assignment 1 — Video game RecSys + LDA segment discovery (Google Colab)
# Assignment_1/Assignment_1_Kitsakis_Colab.ipynb  ← both phases included
```

---

## 🔑 Key Takeaways

1. **User-Based CF** works well when users share many ratings — suffers with sparse data
2. **Item-Based CF** is more stable since item similarities change less over time than user tastes
3. **LDA** uncovers hidden preference structure without explicit genre/demographic labels
4. **Anchor words** guide LDA to segment-meaningful topics when you know the domain
5. **Content-Based** filtering needs no user history — uses item features directly (cold-start friendly)
6. **SBERT embeddings** capture semantic plot similarity that keyword matching misses entirely
7. **User segmentation** shows that one-size-fits-all recommendations degrade performance for minority segments
8. **Richer rating criteria** produce more distinctive LDA topics and cleaner segment recovery than broad simple rules
9. **Two Towers** scales to millions of items via learned embeddings and approximate nearest neighbour search
10. **Hybrid approaches** combining multiple signals consistently outperform any single method

---

<div align="center">
<i>Part of the Master's in Data Science program at AUEB</i>
</div>
