# HW2 - Multi-Modal Two-Tower Recommendation System
**AUEB MSc Data Science - Recommender Systems**

---

## What this does

We build a **Two-Tower retrieval model** on the MyAnimeList dataset. The idea is simple: learn a vector for every user and every anime, so that if a user likes an anime, their vectors point in the same direction.

What makes this different from a basic two-tower is the item side. Instead of just learning an anime embedding, the item tower processes three types of information — categorical, numerical, and text — through separate branches, then combines them using **learned weights**. The model itself figures out which type of information matters most.

---

## Dataset

**MyAnimeList** — [CooperUnion/anime-recommendations-database](https://www.kaggle.com/datasets/CooperUnion/anime-recommendations-database)

| File | Description |
|---|---|
| `anime.csv` | ~12k anime entries with metadata |
| `rating.csv` | ~7.8M user ratings (1-10) |

---

## Architecture

```
USER TOWER
  user_id  →  Embedding  ─┐
  mean rating (scalar)   ─┴→  MLP  →  64-dim vector

ITEM TOWER  (late fusion with learned weights)
  type + primary genre  →  Embeddings  →  MLP  →  64d   ← categorical
  episodes, score, members  →  MLP  →  64d               ← numerical
  TF-IDF title (SVD 32d)  →  MLP  →  64d                 ← text
  weighted_sum(cat, num, txt)  →  64-dim vector

Score = dot(user_vec, item_vec)
```

---

## The 3 Item Features

| Type | Feature | How |
|---|---|---|
| **Categorical** | Anime type (TV/Movie/OVA...) + primary genre | Embedding layers |
| **Numerical** | Episodes, community rating, member count | Log-scaled, normalised to [0,1] |
| **Text** | Anime title | TF-IDF → TruncatedSVD → 32d |

---

## Results (10 epochs)

| Metric | Score |
|---|---|
| Recall@10 | 3.15% |
| Recall@20 | 6.44% |
| Recall@50 | 15.40% |
| NDCG@10 | 1.35% |
| NDCG@20 | 2.18% |
| NDCG@50 | 3.93% |

**Learned fusion weights:** Text: 0.673 — Numerical: 0.302 — Categorical: 0.025

---

## Files

| File | Description |
|---|---|
| `Assignment_2_Kitsakis.ipynb` | Local version |
| `Assignment_2_Kitsakis_Colab.ipynb` | Colab version |
| `Assignment_2_Anime.md` | Submission summary |

---

## How to run

### Google Colab
1. Open `Assignment_2_Kitsakis_Colab.ipynb` in Colab
2. Fill in `KAGGLE_USERNAME` and `KAGGLE_KEY` in the credentials cell
3. Run all cells — dataset downloads automatically

### Local
1. Download `anime.csv` and `rating.csv` from [Kaggle](https://www.kaggle.com/datasets/CooperUnion/anime-recommendations-database)
2. Place them next to `Assignment_2_Kitsakis.ipynb`
3. Run all cells
