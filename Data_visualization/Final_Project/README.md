# Final Project: US Airport Analysis - MCO vs MIA

**Course:** Data Visualization
**Author:** Georgios Kitsakis
**Institution:** Athens University of Economics and Business (AUEB)
**Team:** Team E

---

## 📖 Project Overview

Comparative analysis of **Orlando International Airport (MCO)** vs **Miami International Airport (MIA)** using comprehensive commercial flight data from 2004-2008. This project creates a data-driven story showcasing airport performance, identifying trends, and providing actionable recommendations for improvement.

**Assignment Goal:** Create at least 12 visualizations (static + interactive + map) comparing two major US airports, using both code-based tools (Python) and interactive tools (Tableau).

---

## 📊 Dataset

**Source:** [Harvard Dataverse - US Commercial Flights](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/HG7NV7)

**Scope:**
- **Total Flights:** 1,592,198 involving MCO or MIA
- **Time Period:** January 2004 - April 2008
- **Airports:** MCO (Orlando International) and MIA (Miami International)
- **Features:** 40+ columns including delays, cancellations, carriers, routes, times

**Key Metrics:**
- On-time performance: MCO (78.88%), MIA (74.03%)
- Cancellation rate: 1.22% overall
- Average delay: 8.3 minutes
- MCO departures: 521,651 flights
- MIA departures: 283,825 flights

---

## 📁 Project Structure

```
Final_Project/
├── 01_data_loading.ipynb          # Load and explore raw flight data
├── 02_data_cleaning.ipynb         # Data cleaning and feature engineering
├── COLUMN_REFERENCE.md            # Complete data dictionary (155 lines)
├── requirements.txt               # Python dependencies
├── Final_Project.txt              # Assignment description
├── data/                          # Data folder (not in git - too large)
│   ├── raw/                       # Raw CSV files from Harvard Dataverse
│   └── processed/                 # Cleaned datasets
│       ├── mco_mia_2004.csv.gz
│       ├── mco_mia_2005.csv.gz
│       ├── mco_mia_2006.csv.gz
│       ├── mco_mia_2007.csv.gz
│       ├── mco_mia_2008.csv.gz
│       └── mco_mia_clean.csv.gz   # Final cleaned dataset (1.6M flights)
└── README.md                      # This file
```

---

## 🔧 Setup Instructions

### 1. Install Dependencies

```bash
pip install -r requirements.txt
```

**Required packages:**
- pandas 2.1.4 - Data manipulation
- numpy 1.26.2 - Numerical computing
- matplotlib 3.8.2 - Static plotting
- seaborn 0.13.0 - Statistical visualizations
- plotly 5.18.0 - Interactive visualizations
- folium 0.15.1 - Map visualizations
- jupyter 1.0.0 - Notebook environment

### 2. Data Loading

The raw data files are **not included** in this repository due to size (multi-GB). Download from Harvard Dataverse:

```python
# See 01_data_loading.ipynb for complete code
# Data files should be placed in: data/raw/
```

### 3. Run Analysis Pipeline

```bash
# Step 1: Load data
jupyter notebook 01_data_loading.ipynb

# Step 2: Clean and process data
jupyter notebook 02_data_cleaning.ipynb

# Step 3: Explore and visualize (in progress)
# jupyter notebook 03_EDA.ipynb
```

---

## 📊 Data Pipeline

### Stage 1: Data Loading (`01_data_loading.ipynb`)

**Objectives:**
- Load raw CSV files from Harvard Dataverse
- Filter for MCO and MIA airports
- Initial data exploration
- Save filtered data by year

**Output:** Raw filtered datasets in `data/processed/` folder

### Stage 2: Data Cleaning (`02_data_cleaning.ipynb`)

**Data Quality Issues Addressed:**
- ✅ Missing values handling
- ✅ Time format standardization (HHMM → hour/minute)
- ✅ Date parsing and validation
- ✅ Outlier detection and removal
- ✅ Data type conversions

**Feature Engineering:**
- ✅ **Date/Time Features:** FlightDate, Hour, Minute, DayName, Quarter, Season
- ✅ **Performance Metrics:** OnTime flag, DelayCategory (Early/OnTime/Delayed/SeverelyDelayed)
- ✅ **Airport Indicators:** IsMCO, IsMIA, Direction (Departure/Arrival)
- ✅ **Flight Categories:** TimeOfDay (Morning/Afternoon/Evening/Night), IsWeekend, DistanceCategory
- ✅ **Delay Analysis:** PrimaryDelayCause (Carrier/Weather/NAS/Security/LateAircraft)

**Output:** Clean dataset `data/processed/mco_mia_clean.csv.gz` (1.6M flights, 54MB compressed)

### Stage 3: Exploratory Data Analysis (In Progress)

**Analysis Focus:**
- Comparative performance metrics (MCO vs MIA)
- Delay patterns by time of day, season, carrier
- Route analysis and geographic visualization
- Cancellation causes and trends
- Year-over-year performance changes

---

## 📈 Key Findings (Preliminary)

### Airport Performance Comparison

| Metric | MCO (Orlando) | MIA (Miami) |
|--------|--------------|-------------|
| **Total Departures** | 521,651 | 283,825 |
| **On-Time Performance** | 78.88% | 74.03% |
| **Average Delay** | Lower | Higher |
| **Cancellation Rate** | ~1.2% | ~1.3% |

**MCO Advantages:**
- ✅ Better on-time performance (+4.85%)
- ✅ More consistent schedule adherence
- ✅ Lower average delays

**MIA Challenges:**
- ⚠️ Higher weather-related delays (coastal location)
- ⚠️ More congestion during peak hours
- ⚠️ International hub complexity

---

## 🗺️ Analysis Questions

### Primary Questions:
1. **Performance:** Which airport has better on-time performance?
2. **Delays:** What are the primary causes of delays at each airport?
3. **Trends:** How has performance changed from 2004-2008?
4. **Seasonality:** Which seasons/months have the most delays?
5. **Routes:** Which routes are most profitable/problematic?
6. **Recommendations:** What improvements can be made?

### Visualization Requirements:
- ✅ 12+ visualizations total
- ✅ At least 1 map visualization (Folium)
- ✅ At least 1 interactive visualization (Plotly)
- ✅ Code-based tools (Python: matplotlib, seaborn, Plotly)
- ✅ Interactive tool (Tableau)

---

## 🛠️ Technologies Used

### Python Libraries
- **pandas** - Data manipulation and analysis
- **numpy** - Numerical computing
- **matplotlib** - Static visualizations
- **seaborn** - Statistical plots
- **plotly** - Interactive visualizations
- **folium** - Interactive maps
- **jupyter** - Interactive notebooks

### Tools
- **Tableau** - Interactive dashboards
- **Git** - Version control
- **GitHub** - Repository hosting

### Data Format
- **CSV.GZ** - Compressed CSV for efficient storage
- Original data: ~500MB per year
- Compressed: ~10-15MB per year (70-90% reduction)

---

## 📚 Data Dictionary

See [COLUMN_REFERENCE.md](COLUMN_REFERENCE.md) for complete documentation of all 60+ columns including:

**Original Columns (40+):**
- Flight identification (Year, Month, Day, Carrier, FlightNum)
- Airports & routes (Origin, Dest, Distance)
- Scheduled times (CRSDepTime, CRSArrTime, CRSElapsedTime)
- Actual times (DepTime, ArrTime, ActualElapsedTime, AirTime)
- Delays (DepDelay, ArrDelay, CarrierDelay, WeatherDelay, etc.)
- Cancellations (Cancelled, CancellationCode, Diverted)

**Derived Columns (20+):**
- Date/time features (FlightDate, Hour, Minute, DayName, Quarter, Season)
- Performance metrics (OnTime, DelayCategory, PrimaryDelayCause)
- Airport indicators (IsMCO, IsMIA, Direction)
- Flight categories (TimeOfDay, IsWeekend, DistanceCategory, IsHolidaySeason)

---

## 🚀 Running the Project

### Option 1: Run Locally

```bash
# Clone repository
git clone https://github.com/kitsakisGk/Masters_AUEB.git
cd Masters_AUEB/Data_visualization/Final_Project

# Install dependencies
pip install -r requirements.txt

# Launch Jupyter
jupyter notebook

# Open notebooks in order:
# 1. 01_data_loading.ipynb
# 2. 02_data_cleaning.ipynb
# 3. 03_EDA.ipynb (in progress)
```

### Option 2: Google Colab

Upload notebooks to Google Colab for cloud execution:
- No local installation required
- Free GPU/TPU access
- Easy data file uploads

---

## 📊 Deliverables

### Completed ✅
- ✅ Data loading pipeline
- ✅ Data cleaning and feature engineering
- ✅ 1.6M flights processed
- ✅ Comprehensive data dictionary
- ✅ Cleaned datasets by year

### In Progress 🔜
- 🔜 12+ visualizations (static + interactive)
- 🔜 Map visualization with Folium
- 🔜 Tableau dashboard
- 🔜 Final report (PDF)
- 🔜 Presentation slides (PDF)

---

## 📖 References

**Dataset Source:**
- Harvard Dataverse: [US Commercial Flights 2004-2008](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/HG7NV7)

**Airport Information:**
- MCO: [Orlando International Airport](https://www.orlandoairports.net/)
- MIA: [Miami International Airport](https://www.miami-airport.com/)

**Bureau of Transportation Statistics:**
- [Official US Flight Data](https://www.transtats.bts.gov/)

---

## 🎯 Learning Outcomes

After completing this project, key learnings include:

✅ **Data Engineering:**
- Handling large datasets (multi-GB CSV files)
- Efficient data compression (CSV.GZ format)
- Feature engineering for time-series data
- Data quality assessment and cleaning

✅ **Data Visualization:**
- Creating clear, compelling static visualizations
- Building interactive plots for data exploration
- Designing effective map visualizations
- Using Tableau for dashboard development

✅ **Data Storytelling:**
- Identifying key insights from data
- Creating narrative flow in presentations
- Comparing metrics across categories
- Making data-driven recommendations

✅ **Technical Skills:**
- pandas data manipulation at scale
- matplotlib/seaborn for publication-quality plots
- Plotly for interactive visualizations
- Folium for geospatial visualization
- Git/GitHub for version control

---

<div align="center">
<i>Part of the Master's in Data Science program at AUEB</i>
</div>
