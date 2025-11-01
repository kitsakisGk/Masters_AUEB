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
├── Assignment_1/            # Knowledge graph construction project
│   ├── data/                # Source documents
│   ├── notebooks/           # Implementation notebooks
│   └── graphs/              # Graph visualizations
└── README.md
```

## 🎯 Key Topics

### Assignment 1: Knowledge Graph Construction
- Extract entities and relationships from text
- Build knowledge graph using Neo4j
- Implement graph queries with Cypher
- Integrate LLM for entity disambiguation

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
