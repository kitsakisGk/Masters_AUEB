# Assignment 4: GraphRAG Question Answering System

## Hospital Resource Management - Knowledge Graphs with LLMs

**Course:** Knowledge Graphs with Large Language Models
**Program:** MSc in AI and Data Science, 2025-2026
**Instructor:** Panos Alexopoulos

---

## Overview

This assignment implements a **GraphRAG (Graph Retrieval-Augmented Generation)** Question Answering system that combines Neo4j knowledge graphs with GPT-4o for natural language querying of hospital resources.

**Key Features:**

- Hybrid approach: Text2Cypher + KG-as-Context
- 87% relevancy score across 25 evaluation questions
- 100% graceful handling of adversarial inputs
- 1.8s average response time

---

## Setup Instructions

### Prerequisites

1. **Neo4j Database**

   - Create a free Neo4j AuraDB instance at https://neo4j.com/cloud/aura/
   - Or install Neo4j Desktop from https://neo4j.com/download/

2. **Populate Database**

   - Navigate to `../Assignment_2/`
   - Run `hospital_setup.cypher` in Neo4j Browser to create schema and load data
   - Verify: `MATCH (n) RETURN count(n)` should return 120 nodes

3. **OpenAI API Key**

   - Sign up at https://platform.openai.com/
   - Generate API key with GPT-4o access

4. **Python Environment**
   - Python 3.8+
   - Install dependencies: `pip install neo4j openai python-dotenv pandas jupyter`

### Configure Credentials

Create a `.env` file in this folder:

```env
NEO4J_URI=neo4j+s://YOUR_INSTANCE_ID.databases.neo4j.io
NEO4J_USER=neo4j
NEO4J_PASSWORD=YOUR_PASSWORD
OPENAI_API_KEY=sk-proj-YOUR_API_KEY
```

**Important:** Do NOT commit `.env` to GitHub!

---

## Running the Notebooks

### Option 1: Google Colab (Recommended)

1. Open Colab link: https://drive.google.com/file/d/1s8A75tyRksvvNxsZcZQ1Y_Y61EHyq-al/view?usp=sharing
2. Or upload `notebooks/Assignment_4_Hospital_GraphRAG_QA_COLAB_CLEAN.ipynb`
3. Update credentials in the first cell
4. Upload `data/evaluation_questions.json` and `data/adversarial_questions.json`
5. Run all cells
6. Download results from Colab Files

### Option 2: Local Execution

1. Ensure `.env` is configured
2. Open `notebooks/Assignment_4_Hospital_GraphRAG_QA_CLEAN.ipynb`
3. Run all cells
4. Results saved to `results/` folder

---

## System Architecture

**Hybrid GraphRAG Approach:**

1. **Text2Cypher Pattern** (88% of queries)

   - GPT-4o converts natural language to Cypher
   - Direct Neo4j query execution
   - Fast (1.2s average)

2. **KG-as-Context Pattern** (12% fallback)
   - Retrieve relevant subgraph context
   - GPT-4o synthesizes answer from context
   - Flexible for vague/complex questions (2.3s average)

**Database:** Neo4j Hospital KG

- 120 nodes (Staff, Equipment, Departments, etc.)
- 143 relationships
- Created in Assignment 2

---

## Evaluation Results

**Normal Questions (25):**

- Average Relevancy: 87%
- Text2Cypher Success: 88%
- Answer Correctness: 92%
- Response Time: 1.8s average

**Adversarial Testing (15):**

- Typos: 60% handled correctly
- Non-existent entities: 100% graceful
- Ambiguous queries: 80% request clarification
- Unanswerable: 100% indicate limitation

---

## Key Technologies

- **Neo4j 5.x** - Graph database
- **OpenAI GPT-4o** - Query generation & answer synthesis
- **Python 3.8+** - Implementation
- **Jupyter Notebooks** - Interactive development
- **Google Colab** - Cloud execution

---

## Documentation

- **Assignment4_Report.md** - Complete methodology, results, and analysis
- **PRESENTATION.md** - 10-minute presentation slides (18 slides)
- **PROJECT_STRUCTURE.md** - Detailed folder organization

**Google Colab Link:**
https://drive.google.com/file/d/1s8A75tyRksvvNxsZcZQ1Y_Y61EHyq-al/view?usp=sharing

---

## How to Recreate This Project

1. **Set up Neo4j:**

   - Create AuraDB instance
   - Run `../Assignment_2/hospital_setup.cypher`

2. **Configure credentials:**

   - Create `.env` with your Neo4j URI, user, password
   - Add your OpenAI API key

3. **Run evaluation:**

   - Execute notebook (Colab or local)
   - System will test 25 normal + 15 adversarial questions
   - Results saved to `results/` folder

4. **Review results:**
   - Check `evaluation_results.csv` for performance metrics
   - Read `Assignment4_Report.md` for detailed analysis

---

## Support

For setup issues:

- Check Neo4j connection with `MATCH (n) RETURN count(n)` (should return 120)
- Verify OpenAI API key has GPT-4o access
- Ensure all dependencies installed

For questions about methodology or results, see `Assignment4_Report.md`.

---
