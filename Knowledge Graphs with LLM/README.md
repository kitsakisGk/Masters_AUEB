# Knowledge Graphs with LLM

<div align="center">

## Knowledge Graph Construction & Reasoning with Large Language Models

![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)
![LLM](https://img.shields.io/badge/LLM-grey.svg)
![Neo4j](https://img.shields.io/badge/Neo4j-008CC1.svg)
![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-F37626.svg)

**Author:** Georgios Kitsakis
**Institution:** Athens University of Economics and Business (AUEB)

</div>

---

## 📖 Overview

This course explores the integration of Knowledge Graphs with Large Language Models for advanced information extraction and reasoning:

- **Knowledge Graph Construction:** Entity extraction, relation detection
- **Graph Databases:** Neo4j, SPARQL queries
- **LLM Integration:** GPT-4, Claude for knowledge extraction
- **Reasoning:** Graph-based inference, semantic search
- **Applications:** Question answering, knowledge base completion

## 📁 Repository Structure

```
Knowledge Graphs with LLM/
├── Assignment_1/            # Initial KG project setup
├── Assignment_2/            # Hospital Resource Management KG Schema
│   ├── hospital_setup.cypher
│   ├── competency_queries.cypher
│   ├── screenshots/
│   └── Assignment2_Report.md
├── Assignment_3/            # LLM-based Entity Extraction
│   ├── Assignment_3_Entity_Extraction.ipynb
│   ├── evaluation_dataset.json
│   ├── evaluation_results.csv
│   ├── Assignment3_Report.pdf
│   └── README.md
└── README.md
```

## 🎯 Assignments

### Assignment 1: Knowledge Graph Construction
- Extract entities and relationships from text
- Build knowledge graph using Neo4j
- Implement graph queries with Cypher
- Integrate LLM for entity disambiguation

### Assignment 2: Hospital Resource Management KG Schema
- Design semantically correct KG schema (7 node types, 7 relationship types)
- Implement in Neo4j with constraints and indexes
- Transform 12 competency questions into Cypher queries
- Populate with realistic dummy data (120 nodes, 143 relationships)
- **Tech Stack:** Neo4j AuraDB, Cypher, Graph visualization

### Assignment 3: Knowledge Graph Population with LLM
- LLM-based entity extraction (Equipment & Department entities)
- Few-shot prompting with GPT-4o (no fine-tuning)
- Evaluation on 12 real hospital texts (75% F1 score)
- LLM-as-a-judge automated evaluation system
- **Results:** 90% F1 for Equipment, 60% F1 for Departments

### Techniques Covered
- Named Entity Recognition (NER)
- Relation Extraction
- Graph embeddings
- Semantic similarity
- LLM-powered knowledge extraction

## 🛠️ Installation

```bash
# Install Python dependencies
pip install transformers spacy networkx
pip install neo4j py2neo openai anthropic

# Install spaCy language model
python -m spacy download en_core_web_lg

# Neo4j (requires separate installation)
# https://neo4j.com/download/
```

## 📊 Technologies Used

- **Python 3.8+**
- **spaCy:** Named entity recognition
- **Transformers:** LLM integration
- **Neo4j:** Graph database
- **NetworkX:** Graph analysis
- **OpenAI API / Anthropic Claude:** LLM services

## 📚 Key Concepts

- Knowledge Graph fundamentals
- Triple stores (subject-predicate-object)
- Cypher query language
- Graph embeddings (Node2Vec, TransE)
- LLM prompting strategies
- Knowledge base completion

---

<div align="center">
<i>Part of the Master's in Data Science program at AUEB</i>
</div>
