# Social Network Analysis

<div align="center">

## Graph Theory, Centrality Measures & Community Detection

![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)
![Gephi](https://img.shields.io/badge/Gephi-0.10-orange.svg)
![NetworkX](https://img.shields.io/badge/NetworkX-grey.svg)
![SNAP](https://img.shields.io/badge/SNAP-stanford-red.svg)

**Author:** Georgios Kitsakis
**Institution:** Athens University of Economics and Business (AUEB)

</div>

---

## 📖 Overview

This course explores the mathematical foundations and practical applications of social network analysis. Topics covered include graph theory fundamentals, centrality measures, community detection algorithms, and network visualization techniques applied to real-world networks.

**Core Focus:**
- Graph metrics and properties (degree, diameter, clustering coefficient)
- Centrality measures (degree, betweenness, closeness, PageRank, HITS)
- Community detection algorithms (Girvan-Newman, Clauset-Newman-Moore)
- Network visualization with Gephi
- Algorithmic graph analysis with SNAP (Stanford Network Analysis Platform)

---

## 📁 Repository Structure

```
Social_Network_Analysis/
├── Project_1/           # David Copperfield Word Network Analysis (Gephi)
├── Project_2/           # Centrality & Community Detection Algorithms (Python + SNAP)
├── Project_3/           # Advanced Network Analysis
└── README.md
```

---

## 🎯 Projects

### Project 1: David Copperfield Word Network Analysis

**Objective:** Analyze the network of commonly occurring adjectives and nouns from Charles Dickens' novel "David Copperfield" using Gephi visualization software.

**Dataset:**
- **Nodes:** 112 (most common adjectives and nouns)
- **Edges:** 425 (word adjacencies in text)
- **Graph Type:** Undirected

**Analysis Performed:**
1. **Degree Distribution Analysis**
   - Average degree calculation
   - Identification of hub nodes (highest degree words)
   - Top degree nodes: "little" (49), "old" (33), "other" (28)

2. **Network Diameter & Centrality**
   - Network diameter: 7
   - Betweenness centrality distribution
   - Closeness centrality distribution
   - Harmonic closeness centrality

3. **Community Detection**
   - Modularity-based community detection
   - Identification of word clusters and themes
   - Visualization of community structure

4. **Network Visualization**
   - Force-directed layouts (ForceAtlas2, Yifan Hu)
   - Node sizing by degree centrality
   - Color coding by community membership

**Tools Used:**
- Gephi 0.10
- Force-directed layout algorithms
- Modularity optimization

**Deliverables:**
- [proj1_report.md](Project_1/proj1_report.md) - Comprehensive analysis report
- [proj1_report.pdf](Project_1/proj1_report.pdf) - PDF report with visualizations
- Network visualizations (SVG, PNG)
- Degree and centrality distribution reports

---

### Project 2: Centrality & Community Detection Algorithms

**Objective:** Implement and compare graph algorithms for Eulerian paths/circuits, centrality measures, and community detection using SNAP (Stanford Network Analysis Platform).

**Part 1: Eulerian Paths and Circuits**

Implemented functions to detect:
- **Euler Paths:** Graph traversal visiting every edge exactly once
- **Euler Circuits:** Euler path that starts and ends at the same vertex

**Algorithm Logic:**
- Check graph connectivity
- Count nodes with odd degree
- Euler circuit: All nodes have even degree
- Euler path: Exactly 2 nodes have odd degree

**Test Cases:**
- Graph with Euler path (but not circuit)
- Graph without Euler path
- Graph with Euler circuit
- Disconnected graph without Euler circuit

**Part 2: Centrality Measures & Community Detection**

**Centrality Metrics Analyzed:**
1. **PageRank** - Web page importance ranking
2. **HITS (Hubs and Authorities)** - Authority and hub scores
3. **Betweenness Centrality** - Measures node importance in shortest paths
4. **Closeness Centrality** - Average distance to all other nodes

**Community Detection Algorithms Compared:**
1. **Girvan-Newman Algorithm**
   - Edge betweenness-based hierarchical clustering
   - Time complexity: O(m²n) - slower for large graphs
   - Accurate for small networks (<500 nodes)

2. **Clauset-Newman-Moore (CNM) Algorithm**
   - Greedy modularity optimization
   - Time complexity: O(n log² n) - faster for large graphs
   - Scalable to millions of nodes

**Scalability Analysis:**

| Graph Size | Girvan-Newman Time | CNM Time | Recommendation |
|------------|-------------------|----------|----------------|
| 50 nodes | <1s | <0.5s | Either algorithm |
| 100 nodes | 2-5s | <1s | CNM preferred |
| 500 nodes | 60-120s | 2-5s | CNM only |
| 1,000 nodes | >600s | 5-10s | CNM only |
| 18,000 employees | Infeasible | ~5min | CNM only |
| 1 billion users | Infeasible | Distributed CNM | CNM with parallelization |

**Key Findings:**
- Top PageRank nodes correlate strongly with high betweenness centrality
- Hub and authority scores identify different types of influential nodes
- CNM algorithm scales linearly for large networks
- Girvan-Newman provides higher quality communities but doesn't scale

**Visualizations:**
- Centrality comparison plots (Betweenness, Closeness, PageRank)
- Authority vs Hub vs PageRank comparison
- Community structure visualizations

**Deliverables:**
- [project2-1.py](Project_2/project2-1.py) - Euler path/circuit detection
- [project2-2.py](Project_2/project2-2.py) - Centrality & community detection
- [Project2_Kitsakis.pdf](Project_2/Project2_Kitsakis.pdf) - Comprehensive report
- Centrality comparison visualizations

---

### Project 3: Advanced Network Analysis

**Topics:** (Based on assignment requirements)
- Advanced graph algorithms
- Network dynamics and evolution
- Real-world network applications

**Deliverables:**
- [project3.pdf](Project_3/project3.pdf) - Project report

---

## 🛠️ Technologies Used

### Software & Tools
- **Gephi 0.10** - Network visualization and analysis platform
- **Python 3.8+** - Primary programming language
- **SNAP (Stanford Network Analysis Platform)** - Large-scale graph analysis library

### Python Libraries
- **snap-stanford** - Python interface to SNAP library
- **matplotlib** - Visualization of centrality measures
- **NetworkX** - Additional graph analysis (alternative to SNAP)

### Algorithms Implemented
- **Eulerian Path Detection** - Graph traversal algorithms
- **PageRank** - Link analysis algorithm
- **HITS (Hyperlink-Induced Topic Search)** - Hub and authority computation
- **Betweenness Centrality** - Shortest path centrality
- **Closeness Centrality** - Average shortest path distance
- **Girvan-Newman Community Detection** - Edge betweenness-based clustering
- **Clauset-Newman-Moore (CNM)** - Fast modularity optimization

### Visualization Techniques
- **Force-directed layouts** - ForceAtlas2, Yifan Hu, Fruchterman Reingold
- **Node sizing** - Proportional to degree/centrality
- **Color coding** - Community membership, centrality ranges
- **Edge bundling** - Improved readability for dense networks

---

## 🛠️ Installation

### Gephi Setup
```bash
# Download and install Gephi 0.10 from:
# https://gephi.org/users/download/

# Install required plugins:
# - ForceAtlas2 layout
# - Modularity statistics
# - Network Diameter
```

### Python Setup
```bash
# Install core dependencies
pip install snap-stanford matplotlib numpy

# Optional: NetworkX for additional graph analysis
pip install networkx
```

---

## 📚 Key Concepts

### Graph Metrics
- **Degree:** Number of connections per node
- **Diameter:** Maximum shortest path length in the graph
- **Clustering Coefficient:** Measure of local clustering
- **Modularity:** Quality of community partition

### Centrality Measures
- **Degree Centrality:** Number of direct connections
- **Betweenness Centrality:** Frequency of node appearing on shortest paths
- **Closeness Centrality:** Average distance to all other nodes
- **PageRank:** Importance based on incoming links (weighted by source importance)
- **HITS:** Separates hubs (point to authorities) from authorities (pointed by hubs)

### Community Detection
- **Modularity Optimization:** Maximize within-community edges vs between-community edges
- **Hierarchical Clustering:** Build dendrogram of community merges/splits
- **Edge Betweenness:** Remove high-betweenness edges to split communities

### Graph Theory
- **Eulerian Paths:** Traverse every edge exactly once
- **Eulerian Circuits:** Eulerian path returning to start vertex
- **Connectivity:** Whether all nodes are reachable from any node
- **Degree Parity:** Odd vs even degree affects Eulerian properties

---

## 🔑 Key Learnings

### 1. Centrality Measures Capture Different Aspects of Importance
- **Degree:** Local importance (number of direct connections)
- **Betweenness:** Global importance (control over information flow)
- **PageRank:** Recursive importance (important if connected to important nodes)
- **Closeness:** Efficiency (quick access to entire network)

### 2. Algorithm Scalability Matters
- Girvan-Newman: High quality but O(m²n) - only works for small networks
- CNM: Lower quality but O(n log² n) - scales to billions of nodes
- Trade-off: Accuracy vs speed for real-world applications

### 3. Network Visualization Reveals Structure
- Force-directed layouts naturally cluster communities
- Node sizing highlights central nodes
- Community coloring shows modular structure
- Proper layout selection critical for interpretation

### 4. Real-World Applications
- **Word networks:** Text analysis and semantic relationships
- **Social networks:** Influence and information diffusion
- **Infrastructure networks:** Robustness and failure analysis
- **Biological networks:** Protein interactions and disease pathways

---

## 📊 Project Statistics

**Project 1 (David Copperfield Network):**
- 112 nodes (words)
- 425 edges (adjacencies)
- Network diameter: 7
- Communities detected: 4-6 (depending on resolution)
- 15+ visualizations generated

**Project 2 (Algorithm Implementation):**
- 2,500+ lines of Python code
- 5 graph sizes tested (50 to 2,000 nodes)
- 2 community detection algorithms compared
- 5 centrality measures computed
- 10+ test cases for Euler path/circuit detection

---

## 🚀 Running the Projects

### Project 1 (Gephi)
1. Open Gephi 0.10
2. Import `nodes.csv` and `edges.csv` from Project_1/
3. Run statistics: Average Degree, Network Diameter, Modularity
4. Apply layout: ForceAtlas2 or Yifan Hu
5. Visualize: Size nodes by degree, color by modularity class

### Project 2 (Python + SNAP)
```bash
cd Project_2

# Part 1: Euler paths and circuits
python project2-1.py

# Part 2: Centrality and community detection
python project2-2.py
```

**Expected Output:**
- Console output with algorithm runtimes
- Centrality comparison plots (PNG)
- Community detection results

---

## 📖 Further Reading

**Books:**
- *Networks, Crowds, and Markets* by Easley & Kleinberg
- *Network Science* by Albert-László Barabási

**Research Papers:**
- Newman, M. E. J. (2004). "Fast algorithm for detecting community structure in networks"
- Girvan, M., & Newman, M. E. J. (2002). "Community structure in social and biological networks"
- Page, L., et al. (1999). "The PageRank Citation Ranking"

**Gephi Resources:**
- [Gephi Documentation](https://gephi.org/users/)
- [Graph Visualization Tutorial](https://gephi.org/tutorials/)

**SNAP Resources:**
- [SNAP Python Documentation](https://snap.stanford.edu/snappy/)
- [Large Network Datasets](https://snap.stanford.edu/data/)

---

<div align="center">
<i>Part of the Master's in Data Science program at AUEB</i>
</div>
