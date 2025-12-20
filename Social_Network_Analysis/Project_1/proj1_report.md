# Project 1: David Copperfield Network Analysis

## Social Network Analysis

## Name : Giorgos Kitsakis

---

# Introduction

This project analyzes the network of commonly occurring adjectives and nouns from Charles Dickens' novel "David Copperfield" using Gephi visualization software. Nodes represent the most frequently used adjectives and nouns in the book, while edges connect word pairs that appear adjacently in the text.

The analysis involves calculating network metrics (degree, diameter, betweenness centrality), detecting communities using modularity algorithms, and visualizing the network structure using various layout algorithms.

---

# Network Description

**Dataset:** David Copperfield word adjacency network

- **Nodes:** 112 (most common adjectives and nouns)
- **Edges:** 425 (word adjacencies in text)
- **Graph Type:** Undirected

**Data Files:**

- `nodes.csv` - Contains node ID and label (word)
- `edges.csv` - Contains source, target, and edge type

---

# Analysis and Results

## 1. Node Degree Analysis

The degree of each node was calculated using Gephi's **"Average Degree"** statistics function. This measures how many connections each word has in the network.

**Degree Distribution Reports:**

<p align="center">
  <img width="70%" src="reports/degree/degree-distribution.png">
</p>

<p align="center">
  <img width="70%" src="reports/degree/indegree-distribution.png">
</p>

<p align="center">
  <img width="70%" src="reports/degree/outdegree-distribution.png">
</p>

**Top Nodes by Degree:**

| Id  | Label  | Degree |
| --- | ------ | ------ |
| 17  | little | 49     |
| 2   | old    | 33     |
| 43  | other  | 28     |
| 51  | good   | 28     |

**Lowest Degree Nodes (Degree = 1):**
aunt, fancy, glad, bed, lost, alone, half, name, family, year

**Visualization:**

The network was visualized with node sizes proportional to their degree values (min: 5, max: 30).

<p align="center">
  <img width="70%" src="visualizations/degree.svg">
</p>
<p style="text-align:center;">Figure 1: Network visualization with nodes sized by degree</p>

**Full report:** `reports/degree/report.html`

---

## 2. Network Diameter and Centrality

**Network Diameter:** Calculated using Gephi's **"Network Diameter"** statistics function.

**Result:** Diameter = **7**

This indicates that the maximum shortest path length between any two words in the network is 7 steps. The network is relatively well-connected despite having 112 nodes.

**Centrality Distribution Reports:**

<p align="center">
  <img width="70%" src="reports/network_diameter/Betweenness_Centrality_Distribution.png">
</p>

<p align="center">
  <img width="70%" src="reports/network_diameter/Closeness_Centrality_Distribution.png">
</p>

<p align="center">
  <img width="70%" src="reports/network_diameter/Eccentricity_Distribution.png">
</p>

<p align="center">
  <img width="70%" src="reports/network_diameter/Harmonic_Closeness_Centrality_Distribution.png">
</p>

**Highest Betweenness Centrality:**

**Node:** "little" (ID: 17)

- **Degree:** 49
- **Betweenness Centrality:** Highest in network

The word "little" serves as a critical bridge in the network, connecting different communities of words. Its high betweenness centrality indicates it frequently appears on shortest paths between other words, making it structurally important for network connectivity.

**Full report:** `reports/network_diameter/report.html`

---

## 3. Community Detection

Communities were detected using **Modularity** (Louvain method) in Gephi.

**Results:**

- **Number of Communities:** 7
- **Modularity Score:** High (indicates strong community structure)

<p align="center">
  <img width="70%" src="reports/modularity/communities-size-distribution.png">
</p>

**Visualization Method:**

1. Applied **Yifan Hu** layout algorithm (optimal distance = 500, relative strength = 0.5)
2. Applied **Noverlap** algorithm to prevent node overlap
3. Colored nodes by **Modularity Class** (community membership)

**All Communities:**

<p align="center">
  <img width="70%" src="visualizations/communities.svg">
</p>
<p style="text-align:center;">Figure 2: Complete network colored by community</p>

**Individual Community Visualizations:**

<p align="center">
  <img width="70%" src="visualizations/community-1.svg">
</p>
<p style="text-align:center;">Community 1</p>

<p align="center">
  <img width="70%" src="visualizations/community-2.svg">
</p>
<p style="text-align:center;">Community 2</p>

<p align="center">
  <img width="70%" src="visualizations/community-3.svg">
</p>
<p style="text-align:center;">Community 3</p>

<p align="center">
  <img width="70%" src="visualizations/community-4.svg">
</p>
<p style="text-align:center;">Community 4</p>

<p align="center">
  <img width="70%" src="visualizations/community-5.svg">
</p>
<p style="text-align:center;">Community 5</p>

<p align="center">
  <img width="70%" src="visualizations/community-6.svg">
</p>
<p style="text-align:center;">Community 6</p>

<p align="center">
  <img width="70%" src="visualizations/community-7.svg">
</p>
<p style="text-align:center;">Community 7</p>

**Community Analysis:**

**Community 1** contains predominantly adjectives (pleasant, usual, small) and emotion-related nouns (hope, love). This suggests that emotional and descriptive language forms a distinct cluster in Dickens' writing.

**Semantic Observations:**

Words that are semantically different but appear in the same community do so because of **structural similarity** rather than **semantic similarity**. For example, contrasting adjectives may co-occur with similar nouns in the text, placing them in the same network community despite having opposite meanings.

The primary pattern observed is that **adjectives naturally connect with nouns**, forming the basis of community structure in this adjacency network.

**Full report:** `reports/modularity/report.html`

---

## 4. Ego Network Analysis

**Selected Node:** "time" (ID: 26)

- **Degree:** 11
- **PageRank:** 0.00613

The ego network was constructed using Gephi's **Ego Network** filter at depths 1 and 2.

**Depth 1:** Shows direct neighbors of "time" (first-order connections)

<p align="center">
  <img width="70%" src="visualizations/ego_network_1.svg">
</p>
<p style="text-align:center;">Figure 3: Ego network at depth 1</p>

**Depth 2:** Shows neighbors of neighbors (second-order connections)

<p align="center">
  <img width="70%" src="visualizations/ego_network_2.svg">
</p>
<p style="text-align:center;">Figure 4: Ego network at depth 2</p>

The ego network reveals how "time" connects to other words in the narrative. At depth 1, we see words that directly appear adjacent to "time" in the text. At depth 2, the network expands to show the broader linguistic context.

---

## 5. Interactive Visualization Export

The network was exported using the **SigmaExporter** plugin (File → Export → Sigma.js template).

**Export Details:**

- **Title:** David Copperfield Word Network
- **Author:** [Your Name]
- **Description:** Interactive visualization of word adjacencies from Charles Dickens' David Copperfield

The exported files are located in the `sigma/` directory and can be viewed by running a local web server:

```bash
npm install -g http-server
cd sigma
http-server
```

Then navigate to: `http://localhost:8080/network`

**Screenshot of Interactive Visualization:**

<p align="center">
  <img width="90%" src="visualizations/sigma.png">
</p>
<p style="text-align:center;">Figure 5: Interactive Sigma.js visualization</p>

---

# Methodology Summary

**Software Used:**

- Gephi 0.10.1
- SigmaExporter plugin

**Layout Algorithms:**

- Yifan Hu (optimal distance: 500, relative strength: 0.5)
- Noverlap (overlap removal)

**Statistics Calculated:**

- Average Degree
- Network Diameter
- Betweenness Centrality
- Closeness Centrality
- Eccentricity
- Harmonic Closeness Centrality
- Modularity (community detection)
- PageRank

**Visualization Techniques:**

- Node sizing by degree
- Node coloring by modularity class (communities)
- Ego network filtering and coloring

---

# Conclusions

This network analysis of "David Copperfield" reveals several interesting patterns:

1. **High Connectivity:** The network diameter of 7 indicates relatively short paths between words, suggesting Dickens' vocabulary is well-integrated.

2. **Central Words:** "Little" serves as the most central word (highest degree and betweenness), acting as a bridge between different linguistic communities.

3. **Community Structure:** Seven distinct communities emerge, primarily organized around the natural relationship between adjectives and their associated nouns.

4. **Linguistic Patterns:** The network structure reflects syntactic relationships (adjective-noun adjacencies) more than semantic similarity, as evidenced by semantically different words clustering together based on their shared linguistic contexts.

5. **Degree Distribution:** A small number of highly connected hubs (little, old, good, other) contrast with many peripherally connected words, following a pattern typical of real-world networks.

This analysis demonstrates how network science can reveal structural patterns in literary texts, uncovering the hidden organization of language in classic literature.

---
