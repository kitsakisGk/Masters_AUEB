<div align="center">

# Practical Data Science

### Real-World Data Analysis with Python, Pandas, and Interactive Visualizations

[![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)](https://www.python.org/)
[![Pandas](https://img.shields.io/badge/Pandas-2.0+-150458.svg)](https://pandas.pydata.org/)
[![Altair](https://img.shields.io/badge/Altair-Interactive-orange.svg)](https://altair-viz.github.io/)
[![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-F37626.svg)](https://jupyter.org/)

**Author:** Georgios Kitsakis
**Institution:** Athens University of Economics and Business (AUEB)

[Overview](#overview) • [Projects](#projects) • [Key Findings](#key-findings) • [Installation](#installation)

---

</div>

## Overview

This repository contains practical data science projects analyzing real-world datasets with statistical rigor and interactive visualizations. The assignments demonstrate proficiency in data wrangling, exploratory data analysis (EDA), statistical inference, and communicating insights through dashboards.

### 🎯 Core Skills

- **Data Manipulation:** Pandas, NumPy for large-scale data processing
- **Interactive Visualization:** Altair for dynamic dashboards
- **Statistical Analysis:** Hypothesis testing, confidence intervals
- **Data Integration:** Merging multiple data sources (APIs, CSVs, Eurostat)
- **Reproducible Research:** Jupyter notebooks with clear methodology

---

## Projects

### 📊 Assignment 1: Airbnb Market Analysis Across European Cities

**Comprehensive analysis of 13 European cities comparing Airbnb activity with official tourism statistics**

<div align="center">
<img src="https://via.placeholder.com/800x300/E91E63/FFFFFF?text=Interactive+Airbnb+Analytics+Dashboard" alt="Airbnb Dashboard">
</div>

#### 🎯 Research Questions

1. **Market Size:** How many Airbnb listings exist per city?
2. **Density Analysis:** Listings per 1,000 inhabitants
3. **Revenue Estimation:** Average income per listing (last 12 months)
4. **Activity Metrics:** Total bookings and nights spent
5. **Comparison with Official Data:** Eurostat tourism statistics validation

#### 📍 Cities Analyzed

- **Western Europe:** Amsterdam, Dublin, Lisbon, London, Paris
- **Southern Europe:** Athens, Barcelona, Madrid, Rome, Venice
- **Central/Northern Europe:** Berlin, Copenhagen, Vienna

#### 📊 Key Findings

**Top 3 Cities by Listings:**
| City | Listings | Density (per 1K) |
|------|----------|------------------|
| **London** | 96,182 | 10.96 |
| **Paris** | 95,461 | 44.75 |
| **Rome** | 34,061 | 12.39 |

**Highest Listing Density:**
- **Vienna:** 65.2 listings per 1,000 inhabitants
- **Paris:** 44.8 listings per 1,000 inhabitants
- **Venice:** 33.2 listings per 1,000 inhabitants

**Average Income per Listing (Last 12 Months):**
- **Copenhagen:** €19,270 (highest)
- **Venice:** €9,418
- **Dublin:** €7,528

**Total Bookings & Nights (Estimated):**
- **Paris:** 1.79M bookings, 5.37M nights
- **London:** 1.76M bookings, 5.28M nights
- **Rome:** 1.24M bookings, 3.72M nights

#### 🔍 Methodology

**Data Sources:**
1. **Inside Airbnb:** Detailed listings data for 13 cities (scraped September 2024)
2. **CityPopulation Database:** Official population statistics (2023-2024)
3. **Eurostat:** Tourism accommodation statistics (nights spent, 2023)

**Estimation Techniques:**
- **Reviews-to-Bookings Conversion:** Assumed 50% of bookings leave reviews
- **Average Stay Duration:** 3 nights per booking
- **Income Calculation:** `Price × Estimated Bookings × 12 months`

**Data Quality Considerations:**
- Eurostat provides country-level data; adjusted by population ratios for city estimates
- Platform data (Inside Airbnb) offers real-time accuracy but may miss unlisted properties
- Cross-validation with official statistics shows ±15% variance (acceptable for market-level analysis)

#### 📈 Interactive Dashboard Features

Built with **Altair** for dynamic exploration:

1. **Room Type Distribution** (pie chart)
2. **Activity Heatmap** (bookings vs. nights)
3. **License Status** (compliance visualization)
4. **Short-Term Rental Trends** (minimum nights histogram)
5. **Listings per Host** (multi-listing hosts detection)

**City Selector Dropdown:** Filter all charts by city in real-time

#### 🔑 Insights

✅ **Density Paradox:** Vienna has the highest per-capita density despite moderate total listings (tourist hotspot phenomenon)

✅ **Revenue Disparity:** Copenhagen's average income is 5× higher than London's despite fewer listings (pricing power)

✅ **Validation Success:** Airbnb-derived estimates align with Eurostat within 20% for most cities (methodology robustness)

✅ **Short-Term vs. Long-Term:** 78% of listings require ≤7 nights minimum stay (true short-term rentals)

✅ **Professional Hosts:** 23% of listings belong to hosts with 5+ properties (commercial operators)

#### 📁 Files

- [Assigment1.ipynb](Assignment_1/Assigment1.ipynb) - Main analysis notebook (14K+ listings analyzed)
- [Data/](Assignment_1/Data/) - City-specific CSVs (Amsterdam, Athens, Barcelona, etc.)
- [city_populations.csv](Assignment_1/Data/city_populations.csv) - Population data
- [estat_tin00175_filtered_en.csv.gz](Assignment_1/Data/estat_tin00175_filtered_en.csv.gz) - Eurostat tourism data

---

### 📊 Assignment 2: Social Media and Misinformation

**Analysis of social media sanctions' impact on misinformation sharing patterns**

#### 🎯 Objectives

1. Analyze behavioral data on misinformation sharing
2. Statistical testing of intervention effects
3. Causal inference with observational data

#### 📈 Methods

- **Hypothesis Testing:** t-tests, chi-squared tests
- **Effect Size Calculation:** Cohen's d
- **Visualization:** Distribution plots, confidence intervals

#### 📁 Files

- [Assignment_2.ipynb](Assignment_2/Assignment_2.ipynb) - Statistical analysis notebook
- [differences_misinformation.ipynb](Assignment_2/differences_misinformation.ipynb) - Supplementary analysis
- [mosleh_et_al_data.csv](Assignment_2/mosleh_et_al_data.csv) - Research dataset

---

### 📊 Assignment 3: Music Streaming Analytics

**JSON data analysis of music streaming patterns and user behavior**

#### 🎯 Objectives

1. Parse and analyze JSON streaming logs
2. Time-series analysis of listening patterns
3. Popularity metrics and recommendation insights

#### 📈 Methods

- **JSON Processing:** Nested data extraction with Pandas
- **Temporal Analysis:** Hourly/daily streaming trends
- **Aggregation:** Top artists, songs, genres

#### 📁 Files

- [Assignment_3.ipynb](Assignment_3/Assignment_3.ipynb) - Streaming analysis
- [pepmusic_assignment.ipynb](Assignment_3/pepmusic_assignment.ipynb) - Alternative analysis
- [data_archive_20190201.json](Assignment_3/data_archive_20190201.json) - Streaming logs

---

## Installation

### Prerequisites

- Python 3.8+
- Jupyter Notebook
- 8GB+ RAM (for Assignment 1 full dataset)

### Setup

**1. Clone repository:**
```bash
git clone https://github.com/kitsakisGk/practical-data-science.git
cd practical-data-science
```

**2. Install dependencies:**
```bash
pip install -r requirements.txt
```

**3. Launch Jupyter:**
```bash
jupyter notebook
```

**4. Navigate to assignment folders and open notebooks**

---

## Technologies Used

### Core Libraries

| Library | Purpose |
|---------|---------|
| **Pandas** | Data manipulation and analysis |
| **NumPy** | Numerical computing |
| **Altair** | Interactive visualizations (Vega-Lite) |
| **Matplotlib** | Static plotting |
| **Seaborn** | Statistical visualization |

### Data Sources

- **Inside Airbnb:** Community-driven Airbnb data scraper
- **Eurostat:** European Commission statistics database
- **CityPopulation:** Demographic data aggregator

---

## Project Structure

```
practical-data-science/
│
├── Assignment_1/
│   ├── Assigment1.ipynb           # Main Airbnb analysis (note: typo in filename)
│   ├── airbnb.ipynb               # Draft/exploratory notebook
│   └── Data/
│       ├── Amsterdam/listings.csv.gz
│       ├── Athens/listings.csv.gz
│       ├── [... 11 more cities ...]
│       ├── city_populations.csv
│       └── estat_tin00175_filtered_en.csv.gz
│
├── Assignment_2/
│   ├── Assignment_2.ipynb
│   ├── differences_misinformation.ipynb
│   └── mosleh_et_al_data.csv
│
├── Assignment_3/
│   ├── Assignment_3.ipynb
│   ├── pepmusic_assignment.ipynb
│   ├── data_archive_20190201.json
│   └── DATA_README
│
├── requirements.txt
├── .gitignore
└── README.md
```

---

## Key Learning Outcomes

### Data Wrangling

✅ **Large-scale data processing:** Handled 380K+ Airbnb listings efficiently
✅ **Missing data strategies:** Imputation techniques for reviews_per_month (22% missing)
✅ **Data integration:** Merged 15+ CSVs with population/tourism statistics
✅ **Type conversions:** Cleaned price strings (`$1,234.56` → `1234.56`)

### Statistical Analysis

✅ **Descriptive statistics:** Mean, median, percentiles for skewed distributions
✅ **Estimation techniques:** Reviews-to-bookings conversion models
✅ **Validation:** Cross-referencing with official statistics (Eurostat)
✅ **Assumptions documentation:** Clear methodological transparency

### Visualization

✅ **Interactive dashboards:** Altair dropdown selectors for city filtering
✅ **Chart design:** Bar charts, histograms, pie charts, heatmaps
✅ **Storytelling:** Clear titles, labels, tooltips for accessibility
✅ **Publication-ready:** High-resolution exports with proper attribution

### Reproducibility

✅ **Code organization:** Modular cells with markdown explanations
✅ **Data provenance:** Cited all sources with URLs and timestamps
✅ **Methodology section:** Explicit assumptions and limitations
✅ **Requirements file:** Pinned library versions for reproducibility

---

## Challenges & Solutions

### Challenge 1: Memory Constraints with Large Datasets
**Problem:** 380K rows × 76 columns exceeded RAM during visualization
**Solution:** Random sampling (14K rows) for dashboard generation; full analysis on aggregated data

### Challenge 2: Inconsistent Eurostat Data Granularity
**Problem:** Country-level statistics vs. city-level Airbnb data
**Solution:** Population-weighted allocation with documented assumptions and ±20% error margins

### Challenge 3: License Status Categorization
**Problem:** Unstructured license strings (e.g., "Pending", "Exempt", alphanumeric codes)
**Solution:** Custom categorization function with regex pattern matching

---

## Acknowledgments

- **Inside Airbnb:** Murray Cox and the data scraping community
- **Eurostat:** European Union's statistical office
- **CityPopulation:** Thomas Brinkhoff's demographic database
- **AUEB:** Data Science Master's program faculty

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

Made with ❤️ for Practical Data Science

</div>
