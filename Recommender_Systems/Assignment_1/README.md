# HW1 – Recommender Systems Simulation
**AUEB MSc Data Science — Recommender Systems**

---

## What this does

We simulate a video game rating dataset from scratch and then use **LDA (Latent Dirichlet Allocation)** to try and recover the user segments just from their rating patterns — without ever using the segment labels directly.

Think of it like this: imagine you're Spotify and you only see which songs users liked or disliked. Can you figure out whether someone is a rock fan, a pop fan, a jazz fan — purely from the patterns? That's exactly what we're doing here, just with video games.

---

## The 5 User Segments

| # | Segment | They like... |
|---|---|---|
| 1 | **PC Gamer** | Games on PC or cross-platform with Metacritic ≥ 60 |
| 2 | **Console Gamer** | Games on PS or cross-platform with Metacritic ≥ 55 |
| 3 | **Cross-Platform Gamer** | Games available on BOTH platforms with Metacritic ≥ 45 |
| 4 | **Budget Gamer** | Any game priced ≤ €25 |
| 5 | **Casual / Family Gamer** | Games with PEGI age rating 3 or 7 |

---

## Pipeline (4 functions)

```
game_titles.csv  ──►  generate_entities()  ──►  300 games
                                                      │
                       generate_users()    ──►  1 000 users (5 segments × 200)
                                                      │
                       generate_ratings()  ──►  10 000 ratings  ──►  ratings.csv
                                                      │
                       learn_segments()    ──►  LDA topics  ──►  confusion matrix
```

### 1. `generate_entities()`
Randomly samples 300 real game titles from `game_titles.csv` and assigns synthetic attributes:
- **Platform**: PC (35%), PS (30%), BOTH (35%)
- **Genre**: one of 10 genres, assigned randomly
- **Price**: Gaussian(€35, σ=18), clipped to [€5, €80]
- **Metacritic**: Gaussian(68, σ=15), clipped to [0, 100]
- **PEGI age rating**: uniform over {3, 7, 12, 16, 18}

### 2. `generate_users()`
Creates 1 000 users, 200 per segment, each with a realistic age distribution.

### 3. `generate_ratings()`
Samples 10 000 (user, game) pairs and applies the segment's like condition. Each rating is then **independently flipped with 10% probability** to simulate real-world noise. Saves to `ratings.csv`.

### 4. `learn_segments()`
This is the interesting part. We:
1. Treat each user as a **text document**
2. Turn each rated game into a **token**: `Elden_Ring_PC_RPG_LIKE`
3. Train LDA with 5 topics, seeded with **anchor words** per topic
4. Assign each user to their dominant LDA topic
5. Compare against the true segment → **confusion matrix**

---

## Files

| File | Description |
|---|---|
| `Assignment_1_Kitsakis.ipynb` | Main notebook — run this locally |
| `Assignment_1_Kitsakis_Colab.ipynb` | Colab version — run on Google Colab |
| `game_titles.csv` | ~560 real game titles used as the entity pool |
| `ratings.csv` | Generated ratings (created when you run the notebook) |

---

## How to run

### Local (VS Code / Jupyter)
1. Install dependencies: `pip install tomotopy`
2. Open `Assignment_1_Kitsakis.ipynb`
3. Run all cells top to bottom

### Google Colab
1. Upload `game_titles.csv` to your Google Drive (or use the upload widget in the notebook)
2. Open `Assignment_1_Kitsakis_Colab.ipynb` in Colab
3. Run all cells

---

## Why LDA?

LDA was originally designed for topic modelling in text — finding themes across documents. Here we repurpose it: each user's rating history is their "document", and each game-platform-genre-sentiment combination is a "word". The latent topics LDA finds correspond to user preferences, which ideally map to our 5 segments.

We nudge LDA in the right direction using **anchor words**: tokens we know are characteristic of a segment (e.g. PC platform tokens for PC Gamers). This is a semi-supervised approach — the anchors provide soft guidance without fully supervising the model.
