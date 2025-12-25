# Data Visualization

<div align="center">

## Advanced Visualization Techniques & Interactive Dashboards

![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)
![R](https://img.shields.io/badge/R-4.0+-276DC3.svg)
![matplotlib](https://img.shields.io/badge/matplotlib-grey.svg)
![seaborn](https://img.shields.io/badge/seaborn-blue.svg)
![Plotly](https://img.shields.io/badge/Plotly-grey.svg)

**Author:** Georgios Kitsakis
**Institution:** Athens University of Economics and Business (AUEB)

</div>

---

## 📖 Overview

This course covers fundamental and advanced data visualization techniques for effective communication of data insights:

- **Static Visualizations:** matplotlib, seaborn, ggplot2
- **Interactive Visualizations:** Plotly, Bokeh
- **Dashboard Development:** Streamlit, Dash
- **Geospatial Visualization:** Folium, geopandas
- **Best Practices:** Color theory, visual perception, storytelling with data

## 📁 Repository Structure

```
Data_Visualization/
├── Assignment_1/        # PISA 2018 Analysis - Complete Data Story
│   ├── PISA_2018_Complete_Story.ipynb
│   ├── PISA_2018_Project_Summary.pdf
│   ├── PISA_2018_Static_Visualizations.pptx
│   ├── PISA_2018_Interactive_Plots.pptx
│   ├── pisa2018.Rdata
│   └── plots/
├── Final_Project/       # US Airport Analysis - MCO vs MIA (2004-2008)
│   ├── 01_data_loading.ipynb
│   ├── 02_data_cleaning.ipynb
│   ├── COLUMN_REFERENCE.md
│   ├── requirements.txt
│   └── processed/
└── README.md
```

## 🎯 Assignment 1: PISA 2018 Data Analysis

### Project Overview

Comprehensive analysis and visualization of the **Programme for International Student Assessment (PISA) 2018** dataset, examining educational performance across countries.

### 📊 Key Analyses

- **Country Performance Comparison:** Reading, mathematics, and science scores across nations
- **Gender Gap Analysis:** Performance differences between male and female students
- **Socioeconomic Impact:** Correlation between economic status and educational outcomes
- **Regional Trends:** Geographic patterns in educational achievement
- **Interactive Dashboards:** Dynamic exploration of PISA metrics

### 📁 Project Files

| File | Description |
|------|-------------|
| `PISA_2018_Complete_Story.ipynb` | Main analysis notebook with complete workflow |
| `PISA_2018_Project_Summary.pdf` | Executive summary and key findings |
| `PISA_2018_Static_Visualizations.pptx` | Static charts and graphs (matplotlib/seaborn) |
| `PISA_2018_Interactive_Plots.pptx` | Interactive visualizations (Plotly) |
| `pisa2018.Rdata` | Processed PISA 2018 dataset |
| `Assignment_1.jpg` | Project overview image |
| `plots/` | Generated visualization outputs |

### 🛠️ Technologies Used

- **Python:** pandas, matplotlib, seaborn, Plotly
- **R:** ggplot2, tidyverse
- **Jupyter Notebook:** Interactive analysis
- **PowerPoint:** Presentation of findings

### 🔍 Key Findings

The analysis reveals patterns in:
- Top-performing countries in reading, math, and science
- Gender disparities in STEM vs. humanities subjects
- Impact of socioeconomic factors on educational outcomes
- Trends in educational achievement across regions

---

## 🎯 Final Project: US Airport Analysis - MCO vs MIA

### Project Overview

Comparative analysis of **Orlando International Airport (MCO)** vs **Miami International Airport (MIA)** using commercial flight data from 2004-2008 (1.6M flights). Team E assignment for creating a data story showcasing airport performance, trends, and recommendations.

### 📊 Dataset

- **Source:** Harvard Dataverse - US Commercial Flights (2004-2008)
- **Scope:** 1,592,198 flights involving MCO or MIA
- **Time Period:** January 2004 - April 2008
- **Features:** 40+ columns including delays, cancellations, carriers, routes

### 📁 Project Components

| File | Description |
|------|-------------|
| `01_data_loading.ipynb` | Load and explore raw flight data |
| `02_data_cleaning.ipynb` | Data cleaning and feature engineering |
| `COLUMN_REFERENCE.md` | Complete data dictionary (155 lines) |
| `requirements.txt` | Python dependencies (pandas, plotly, folium) |
| `processed/` | Cleaned datasets by year (CSV.GZ format) |

### 🔍 Analysis Focus

**Comparative Metrics:**
- On-time performance (MCO: 78.88%, MIA: 74.03%)
- Delay patterns by time of day, season, carrier
- Cancellation rates and causes
- Route analysis and distance categories
- Geographic visualization of flight networks

**Derived Features:**
- Time categorization (Morning, Afternoon, Evening, Night)
- Delay categories (OnTime, Delayed, SeverelyDelayed)
- Primary delay causes (Carrier, Weather, NAS, Security, Aircraft)
- Seasonal patterns (Holiday vs regular months)
- Distance categories (Short, Medium, Long, VeryLong)

### 🛠️ Technologies

- **pandas 2.1.4** - Data manipulation
- **matplotlib 3.8.2** - Static visualizations
- **seaborn 0.13.0** - Statistical plots
- **plotly 5.18.0** - Interactive visualizations
- **folium 0.15.1** - Map visualizations
- **Tableau** - Interactive dashboards

### 📈 Deliverables

- ✅ Data loading and cleaning pipeline
- ✅ 1.6M flights processed and cleaned
- ✅ Comprehensive data dictionary
- 🔜 12+ visualizations (static + interactive)
- 🔜 Map visualization (Folium)
- 🔜 Final report (PDF)
- 🔜 Presentation slides

---

## 🎓 Learning Outcomes

### Visualization Skills

✅ **Chart Types:** Bar charts, line plots, scatter plots, heatmaps, box plots
✅ **Interactive Plots:** Hover effects, zoom, pan, dynamic filtering
✅ **Design Principles:** Color schemes, typography, layout, accessibility
✅ **Storytelling:** Narrative flow, data-driven insights, audience engagement

### Technical Skills

✅ **Static Plotting:** matplotlib, seaborn, ggplot2
✅ **Interactive Viz:** Plotly, Bokeh
✅ **Data Wrangling:** pandas, tidyverse
✅ **Presentation:** Creating compelling visual narratives

## 🛠️ Installation

```bash
# Python dependencies
pip install pandas numpy matplotlib seaborn plotly jupyter

# R packages (optional)
install.packages(c("ggplot2", "tidyverse", "plotly"))
```

## 🚀 Running the Analysis

```bash
# Launch Jupyter Notebook
cd Assignment_1
jupyter notebook PISA_2018_Complete_Story.ipynb
```

## 📚 Key Concepts

- **Color Theory:** Choosing appropriate color palettes for different data types
- **Visual Hierarchy:** Guiding viewer attention through design
- **Chart Selection:** Matching visualization type to data and message
- **Interactivity:** Enhancing exploration with dynamic elements
- **Accessibility:** Ensuring visualizations are readable by all audiences

---

<div align="center">
<i>Part of the Master's in Data Science program at AUEB</i>
</div>
