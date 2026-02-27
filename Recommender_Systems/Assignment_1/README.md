# HW1 - Recommender Systems Simulation
**AUEB MSc Data Science - Recommender Systems**

---

## What this does

We simulate a video game rating dataset from scratch and then use **LDA (Latent Dirichlet Allocation)** to try and recover the user segments just from their rating patterns - without ever using the segment labels directly.

Think of it like this: imagine you're Spotify and you only see which songs users liked or disliked. Can you figure out whether someone is a rock fan, a pop fan, a jazz fan - purely from the patterns? That's exactly what we're doing here, just with video games.

---

## The 5 User Segments

| # | Segment | Count | They like... |
|---|---|---|---|
| 1 | **PC Gamer** | 350 | Games on PC or cross-platform with Metacritic >= 60 |
| 2 | **Console Gamer** | 320 | Games on PS or cross-platform with Metacritic >= 55 |
| 3 | **Cross-Platform Gamer** | 130 | Games available on BOTH platforms with Metacritic >= 45 |
| 4 | **Budget Gamer** | 100 | Any game within their personal price limit (~€20 avg) |
| 5 | **Casual / Family Gamer** | 100 | Games with PEGI age rating 3 or 7 |

Segments 1 and 2 are the dominant gamer types. Cross-platform, budget, and casual gamers are rarer - which matches the real world.

---

## Pipeline (4 functions)

```
game_titles.csv  --►  generate_entities()  --►  500 games
                                                      |
                       generate_users()    --►  1 000 users (realistic segment split)
                                                      |
                       generate_ratings()  --►  10 000 ratings  --►  ratings.csv
                                                      |
                       learn_segments()    --►  LDA topics  --►  confusion matrix
```

### 1. `generate_entities()`
Samples 500 real game titles from `game_titles.csv` and assigns synthetic attributes:
- **Platform**: PC (42%), PS (35%), BOTH (23%) - mostly exclusives, fewer cross-platform titles
- **Genre**: one of 10 genres, assigned randomly
- **Price**: Gaussian(EUR 35, s=18), clipped to [EUR 5, EUR 80]
- **Metacritic**: Gaussian(68, s=15), clipped to [0, 100]
- **PEGI age rating**: uniform over {3, 7, 12, 16, 18}

### 2. `generate_users()`
Creates 1 000 users with proportional segment sizes. Each user has **personal preferences**:
- `preferred_platform` - PC, PS, or BOTH
- `favorite_genres` - 2-4 genres they enjoy
- `price_limit` - max price they're willing to pay

These preferences influence ratings beyond just the hard segment rule (e.g. a PC Gamer rates a game higher if it's also in their favorite genre).

### 3. `generate_ratings()`
Samples 10 000 (user, game) pairs and applies the segment's like condition, boosted by the user's personal preferences. Each rating is then **independently flipped with 10% probability** to simulate real-world noise. Saves to `ratings.csv`.

### 4. `learn_segments()`
This is the interesting part. We:
1. Treat each user as a **text document**
2. Turn each rated game into a **token**: `Elden_Ring_PC_RPG_LIKE`
3. Train LDA with 5 topics, seeded with **anchor words** per topic
4. Assign each user to their dominant LDA topic
5. Compare against the true segment - **confusion matrix**

---

## Files

| File | Description |
|---|---|
| `Assignment_1_Kitsakis.ipynb` | Main notebook - run this locally |
| `Assignment_1_Kitsakis_Colab.ipynb` | Colab version - run on Google Colab |
| `game_titles.csv` | ~560 real game titles used as the entity pool |
| `ratings.csv` | Generated ratings (created when you run the notebook) |

---

## How to run

### Local (VS Code / Jupyter)
1. Install dependencies: `pip install tomotopy`
2. Open `Assignment_1_Kitsakis.ipynb`
3. Run all cells top to bottom

### Google Colab
1. Open `Assignment_1_Kitsakis_Colab.ipynb` in Colab
2. Run the upload cell and select `game_titles.csv` from your computer
3. Run all remaining cells

---

## Why LDA?

LDA was originally designed for topic modelling in text - finding themes across documents. Here we repurpose it: each user's rating history is their "document", and each game-platform-genre-sentiment combination is a "word". The latent topics LDA finds correspond to user preferences, which ideally map to our 5 segments.

We nudge LDA in the right direction using **anchor words**: tokens we know are characteristic of a segment (e.g. PC platform tokens for PC Gamers). This is a semi-supervised approach - the anchors provide soft guidance without fully supervising the model.
