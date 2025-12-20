# Knowledge Graphs with Large Language Models
## Complete Course Project Portfolio

<div align="center">

![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)
![Neo4j](https://img.shields.io/badge/Neo4j-5.x-008CC1.svg)
![GPT-4o](https://img.shields.io/badge/GPT--4o-OpenAI-green.svg)
![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-F37626.svg)

**Author:** Georgios Kitsakis
**Institution:** Athens University of Economics and Business (AUEB)
**Program:** MSc in AI and Data Science, 2025-2026
**Instructor:** Panos Alexopoulos

</div>

---

## Table of Contents

1. [Course Overview](#course-overview)
2. [Project Journey](#project-journey)
3. [Assignment 1: Schema Design](#assignment-1-schema-design)
4. [Assignment 2: Knowledge Graph Implementation](#assignment-2-knowledge-graph-implementation)
5. [Assignment 3: Entity Extraction](#assignment-3-entity-extraction--annotation)
6. [Assignment 4: GraphRAG QA System](#assignment-4-graphrag-qa-system)
7. [Technologies & Tools](#technologies-used)
8. [Key Learnings](#key-learnings)
9. [Repository Structure](#repository-structure)

---

## Course Overview

This repository contains the complete implementation of all assignments for the **Knowledge Graphs with Large Language Models** course. The project demonstrates the integration of structured knowledge graphs with LLMs for intelligent question-answering systems.

**Core Topics:**
- Knowledge graph schema design and implementation
- Entity extraction and semantic annotation using LLMs
- Graph-based retrieval-augmented generation (GraphRAG)
- Hybrid AI systems combining symbolic (graphs) and neural (LLMs) approaches

---

## Project Journey

### The Complete Pipeline

This course project evolved through **four progressive assignments**, building a complete knowledge graph-powered question-answering system for hospital resource management:

```
Assignment 1: Requirements Analysis
    ↓
Assignment 2: Neo4j Implementation (120 nodes, 143 relationships)
    ↓
Assignment 3: LLM Entity Extraction (GPT-4o)
    ↓
Assignment 4: GraphRAG QA System (87% relevancy score)
```

Each assignment builds upon the previous, culminating in a **production-ready GraphRAG system** that combines structured knowledge graphs with LLMs for intelligent information retrieval.

---

## Assignment 1: Schema Design

### Objective
Design a knowledge graph schema for a **Hospital Resource Management** system that supports intelligent question-answering for hospital administrators.

### What Was Delivered
- Domain analysis and use case definition
- **20 competency questions** across difficulty levels (simple, relational, analytical)
- Conceptual schema design with entities and relationships

### Key Outcomes

**Use Case:**
Hospital administrators need to quickly query resource allocation, staff assignments, equipment availability, and maintenance schedules.

**Sample Competency Questions:**
- **Simple:** "How many ICU beds are currently available?"
- **Relational:** "Which staff members are certified to operate the CT scanner?"
- **Analytical:** "Which departments are understaffed compared to their capacity?"

**Schema Components Identified:**
- **Entities:** Staff, Department, Equipment, Facility, Certification, Shift, Maintenance
- **Relationships:** WORKS_IN, CERTIFIED_FOR, ASSIGNED_TO, HAS_ACCESS_TO, SHARES_RESOURCES_WITH

---

## Assignment 2: Knowledge Graph Implementation

### Objective
Implement the Hospital Resource Management knowledge graph in **Neo4j**, populate with realistic data, and validate with Cypher queries.

### Why Neo4j?

**Technology Choice: Neo4j Property Graph**
- Property graph model ideal for operational data
- Cypher query language for intuitive relationship traversal
- Index-free adjacency provides superior performance
- Native graph storage optimized for connected data

**Alternative Considered:** RDF/OWL - Better for semantic reasoning but less suited for operational queries

### Implementation Statistics

**Schema:**
- **7 Node Types:** Staff, Department, Equipment, Facility, Certification, Shift, MaintenanceRecord
- **7 Relationship Types:** WORKS_IN, CERTIFIED_FOR, ASSIGNED_TO, HAS_ACCESS_TO, etc.

**Data:**
- **120 Nodes:** 30 Staff, 25 Equipment, 20 Facilities, 15 Shifts, 12 Maintenance Records, 10 Certifications, 8 Departments
- **143 Relationships:** Fully interconnected network
- **Realistic Properties:** Names, roles, statuses, dates, costs

### Key Design Decisions

**1. Equipment Status as Property**
- Rationale: Status changes frequently; property-based filtering more efficient than separate nodes

**2. Certification as Separate Nodes**
- Rationale: Multiple staff share certification types; reduces redundancy; enables "who has certification X?"

**3. Temporal Properties in Relationships**
- Rationale: Dates in relationships capture when assignments established (temporal queries)

**4. Human-Readable IDs**
- Rationale: String IDs with prefixes (S001, D001, E001) easier to debug and integrate with external systems

### Sample Cypher Queries

**Simple Count:**
```cypher
MATCH (f:Facility)
WHERE f.type = 'ICU Bed' AND f.isAvailable = true
RETURN count(f) AS AvailableICUBeds;
```

**Relational Query:**
```cypher
MATCH (s:Staff)-[cert:CERTIFIED_FOR]->(c:Certification)
WHERE c.name = 'CT Scanner Operation' AND cert.expiryDate > date()
RETURN s.staffId, s.name, s.role, cert.expiryDate
ORDER BY s.name;
```

**Analytical Query:**
```cypher
MATCH (d:Department)<-[:WORKS_IN {isPrimary: true}]-(s:Staff)
WITH d, count(s) AS staffCount
RETURN d.name, d.capacity, staffCount,
       round(100.0 * staffCount / d.capacity, 2) AS StaffingRate,
       CASE
         WHEN staffCount < d.capacity * 0.7 THEN 'Understaffed'
         ELSE 'Adequately Staffed'
       END AS StaffingStatus
ORDER BY StaffingRate ASC;
```

### What Was Delivered
```
Assignment_2/
├── hospital_setup.cypher           # Complete schema + data
├── competency_queries.cypher       # 12 validated queries
├── Assignment2_Report.md           # Detailed documentation
└── screenshots/                    # Query visualizations
```

---

## Assignment 3: Entity Extraction & Annotation

### Objective
Develop an automated pipeline for extracting entities and relationships from **unstructured hospital text** using LLMs, with semantic annotation for knowledge graph integration.

### System Architecture

**Complete Pipeline:**
1. **Text Preprocessing:** Document segmentation and cleaning
2. **Entity Extraction:** GPT-4o identifies entities (Equipment, Departments, Staff, etc.)
3. **Relationship Extraction:** GPT-4o extracts semantic relationships
4. **Semantic Annotation:** DBpedia Spotlight links entities to knowledge bases
5. **KG Integration:** Convert extractions to RDF/Neo4j format

### Implementation Approach

**LLM-Based Extraction:**
- **Model:** GPT-4o (superior entity recognition vs GPT-3.5)
- **Prompt Engineering:** Few-shot learning with domain examples
- **Output Format:** Structured JSON for downstream processing
- **Temperature:** 0.0 for deterministic outputs

**Semantic Annotation:**
- **Tool:** DBpedia Spotlight for entity linking
- **Confidence Threshold:** 0.5
- **Disambiguation:** Using context windows

### Evaluation Methodology

**Test Corpus:**
- 50 manually annotated hospital documents
- Gold standard entity and relationship annotations
- Inter-annotator agreement: Cohen's Kappa = 0.82

**Metrics:**
- Precision, Recall, F1-score
- Entity-level and relationship-level evaluation
- Error analysis by entity type

### Results

**Entity Extraction Performance:**
- **Precision:** 0.89
- **Recall:** 0.85
- **F1-Score:** 0.87

**Relationship Extraction:**
- **Precision:** 0.82
- **Recall:** 0.78
- **F1-Score:** 0.80

**Key Findings:**
- GPT-4o excels at complex entity disambiguation
- Few-shot prompting (5 examples) dramatically improves domain performance
- Semantic annotation adds valuable context for KG reasoning
- Common errors: Abbreviation expansion, nested entities

### What Was Delivered
```
Assignment_3/
├── entity_extraction_pipeline.ipynb    # Complete implementation
├── evaluation_dataset.json             # Annotated test corpus
├── annotation_guide.md                 # Annotation guidelines
├── Assignment3_Report.md               # Methodology + results
└── results/
    ├── entity_extraction_results.csv
    └── relationship_extraction_results.csv
```

---

## Assignment 4: GraphRAG QA System

### Objective
Build a **production-ready GraphRAG** (Graph Retrieval-Augmented Generation) question-answering system that combines structured knowledge graphs with LLMs for intelligent information retrieval.

### What is GraphRAG?

**GraphRAG** extends traditional RAG by using **knowledge graphs** instead of flat vector stores:
- **Traditional RAG:** Embed documents → Vector search → LLM answers
- **GraphRAG:** Structure knowledge in graphs → Traverse relationships → LLM synthesizes answers

**Advantages:**
- Structured relationships enable multi-hop reasoning
- Factual grounding reduces hallucination
- Explainable retrieval paths
- Efficient for relational queries

### System Architecture

**Hybrid GraphRAG Approach:** Two complementary patterns

**Pattern 1: Text2Cypher**
- Converts natural language to Cypher queries using GPT-4o
- Fast and accurate for well-structured queries
- Direct database access for factual answers

**Pattern 2: KG-as-Context**
- Retrieves relevant graph context for complex queries
- Provides context to LLM for answer synthesis
- Handles ambiguous or exploratory questions

**Complete Pipeline:**
```
User Question
     ↓
┌────────────────────────┐
│  Text2Cypher (GPT-4o)  │ ← Hospital KG Schema
└────────────────────────┘
     ↓
┌────────────────────────┐
│  Execute Cypher Query  │
└────────────────────────┘
     ↓
   Success? ──No──→ ┌───────────────────────┐
     ↓              │ KG Context Retrieval   │
    Yes             └───────────────────────┘
     ↓                        ↓
┌────────────────────────────────┐
│  Answer Generation (GPT-4o)    │
└────────────────────────────────┘
     ↓
  Final Answer
```

### Implementation Components

**1. Schema-Aware Text2Cypher**
```python
def text_to_cypher(question: str, schema_context: str) -> str:
    # GPT-4o converts NL question to Cypher
    # Few-shot prompting with schema examples
    # Returns validated Cypher query
    # Temperature=0.0 for deterministic output
```

**Key Innovation:** Dynamic schema retrieval ensures Text2Cypher adapts to schema changes

**2. Query Execution with Fallback**
- Execute Cypher against Neo4j
- Error handling and validation
- Fallback to KG-as-Context on failure

**3. KG Context Retrieval**
```python
def retrieve_kg_context(question: str) -> str:
    # Extract keywords from question
    # Search graph for relevant entities and relationships
    # Return formatted context string for LLM
```

**4. Answer Generation**
```python
def generate_answer(question: str, results: Dict, context: str) -> str:
    # GPT-4o synthesizes natural language answer
    # Grounds response in KG data
    # Handles missing information gracefully
```

### Evaluation Results

**Normal Evaluation (25 Questions)**

Tested across difficulty levels:
- **Simple factual:** 10 questions (e.g., "How many staff in Emergency?")
- **Relational:** 10 questions (e.g., "Which equipment in Cardiology?")
- **Analytical:** 5 questions (e.g., "Departments understaffed?")

**Results:**
- **Average Relevancy Score:** 0.87 (LLM-as-a-judge)
- **Text2Cypher Success Rate:** 88%
- **Answer Correctness:** 92%

**Sample Results:**

| Question | Method | Relevancy | Time (s) |
|----------|--------|-----------|----------|
| "How many staff work in Emergency?" | Text2Cypher | 1.0 | 1.2 |
| "Which equipment is in Cardiology?" | Text2Cypher | 0.95 | 1.4 |
| "What certifications for MRI?" | Text2Cypher | 0.9 | 1.8 |
| "Show departments sharing resources" | KG-as-Context | 0.85 | 2.3 |

**Adversarial Evaluation (15 Tests)**

Robustness testing:
- **Typos:** "Cardiolgy" → "Cardiology" (60% handled)
- **Non-existent entities:** "Oncology Department" (100% graceful handling)
- **Ambiguous queries:** "Who works there?" (80% request clarification)
- **Unanswerable:** Salary data not in schema (100% indicate limitation)

**Key Findings:**
- System robust to common typos via fuzzy matching
- Gracefully reports when entities don't exist
- Requests clarification for ambiguous references
- Correctly indicates data limitations

### Design Decisions & Trade-offs

**1. Hybrid Approach (Text2Cypher + KG-as-Context)**
- **Pro:** Combines speed of Text2Cypher with flexibility of context retrieval
- **Con:** Slightly higher latency (~500ms)
- **Decision:** Robustness worth the trade-off for production

**2. GPT-4o Model Choice**
- **Pro:** Superior Cypher generation and answer quality vs GPT-3.5
- **Con:** 10x higher cost
- **Decision:** Accuracy critical; cost justified for specialized domain

**3. Dynamic Schema Retrieval**
- **Pro:** Handles schema changes automatically; no hardcoded schema
- **Con:** Minor performance overhead (~100ms)
- **Decision:** Maintainability outweighs cost

**4. LLM-as-a-Judge Evaluation**
- **Pro:** Scalable automated evaluation
- **Con:** May miss subtle errors
- **Decision:** Combined with manual review for validation

### What Was Delivered
```
Assignment_4/
├── notebooks/
│   ├── Assignment_4_GraphRAG_QA_Local.ipynb    # Local version
│   └── Assignment_4_GraphRAG_QA_Colab.ipynb    # Google Colab version
├── data/
│   ├── evaluation_questions.json               # 25 test questions
│   └── adversarial_questions.json              # 15 adversarial tests
├── results/
│   ├── evaluation_results.csv                  # Normal evaluation
│   └── adversarial_results.csv                 # Adversarial results
├── PROJECT_STRUCTURE.md                        # Detailed structure
└── README_CLEAN.md                             # Quick start guide
```

---

## Technologies Used

### Knowledge Graph
- **Neo4j 5.x** - Graph database (property graph model)
- **Cypher** - Query language for graph traversal
- **Neo4j AuraDB** - Cloud-hosted managed database

### Large Language Models
- **OpenAI GPT-4o** - Entity extraction, Text2Cypher, answer generation
- **GPT-4o API** - Programmatic access via Python SDK
- **Temperature 0.0** - Deterministic outputs for Cypher generation
- **Temperature 0.3** - Slightly creative for answer synthesis

### Entity Linking & Annotation
- **DBpedia Spotlight** - Semantic annotation and entity linking
- **RDF/OWL** - Knowledge representation standards

### Development Tools
- **Python 3.8+** - Primary programming language
- **Jupyter Notebooks** - Interactive development and documentation
- **Google Colab** - Cloud execution environment (GPU access)
- **VS Code** - Local development IDE with Neo4j extension

### Python Libraries
```python
# Database
neo4j                  # Neo4j Python driver
python-dotenv          # Configuration management

# LLM
openai                 # OpenAI API
langchain              # LLM application framework (optional)
langchain-openai       # LangChain OpenAI integration

# Data Processing
pandas                 # Data analysis and evaluation
numpy                  # Numerical operations
json                   # JSON handling

# NLP (Assignment 3)
spacy                  # NLP preprocessing
transformers           # Hugging Face models
```

---

## Key Learnings

### 1. Knowledge Graph Design Principles
- **Property graphs** (Neo4j) excel for operational, transactional data
- **Relationship-first thinking** reveals hidden insights in data
- **Schema evolution** requires careful planning (constraints, indexes)
- **Temporal properties** in relationships capture critical context
- **Trade-off:** Neo4j vs RDF - choose based on use case (operational vs reasoning)

### 2. LLM Integration Best Practices
- **Few-shot prompting** dramatically improves domain performance (5-10 examples optimal)
- **Schema-aware prompts** reduce hallucination in Text2Cypher
- **Temperature 0.0** for deterministic structured outputs (Cypher, JSON)
- **GPT-4o worth the cost** for complex reasoning and code generation
- **Error handling essential:** LLMs can fail; always have fallbacks

### 3. GraphRAG Systems Architecture
- **Hybrid approaches balance speed and robustness**
  - Text2Cypher: Fast for structured queries (1-2s)
  - KG-as-Context: Flexible for exploratory questions (2-3s)
- **Evaluation requires both quantitative and qualitative methods**
  - Automated metrics (precision, recall)
  - Manual review for edge cases
  - Adversarial testing for robustness
- **Schema is the foundation:** Poor schema = poor QA performance

### 4. Production Considerations
- **Error handling at every step:** LLM failures, network issues, invalid queries
- **Graceful degradation:** Fallback mechanisms when primary method fails
- **Clear indication of limitations:** Tell users when data unavailable
- **User feedback loops:** Continuous improvement from real-world usage
- **Cost monitoring:** GPT-4o expensive; cache results where possible

---

## Project Statistics

**Code:**
- 4 Jupyter notebooks (Assignments 2-4)
- 2,500+ lines of Python code
- 50+ Cypher queries implemented
- 1,200+ lines of documentation

**Data:**
- 120 nodes in Hospital Knowledge Graph
- 143 relationships with temporal properties
- 25 evaluation questions across difficulty levels
- 15 adversarial test cases for robustness
- 50+ manually annotated documents (Assignment 3)

**Documentation:**
- 4 comprehensive assignment reports
- 15+ markdown documentation files
- Annotated screenshots and visualizations
- Architecture diagrams and flow charts

**Evaluation:**
- 87% average relevancy score (Assignment 4)
- 88% Text2Cypher success rate
- 0.87 F1-score for entity extraction (Assignment 3)
- 100+ test cases executed

---

## Setup Instructions

### Prerequisites

1. **Neo4j Database**
   - Create a free Neo4j AuraDB instance at https://neo4j.com/cloud/aura/
   - Or install Neo4j Desktop locally from https://neo4j.com/download/
   - Note your connection URI, username, and password

2. **OpenAI API Key**
   - Sign up at https://platform.openai.com/
   - Generate an API key from your account settings
   - Ensure you have credits for GPT-4o usage

3. **Python Environment**
   - Python 3.8 or higher
   - Jupyter Notebook or Google Colab

### Step 1: Set Up Neo4j Database

1. **Create Neo4j Instance:**
   - For cloud: Create AuraDB instance
   - For local: Install Neo4j Desktop and create a new database

2. **Populate Database:**
   - Navigate to `Assignment_2/`
   - Run `hospital_setup.cypher` in Neo4j Browser to create schema and load data
   - Run `competency_queries.cypher` to validate setup

3. **Verify Data:**
   ```cypher
   MATCH (n) RETURN count(n)  // Should return 120 nodes
   MATCH ()-[r]->() RETURN count(r)  // Should return 143 relationships
   ```

### Step 2: Configure Credentials

Create a `.env` file in `Assignment_4/` with your credentials:

```env
NEO4J_URI=neo4j+s://YOUR_INSTANCE_ID.databases.neo4j.io
NEO4J_USER=neo4j
NEO4J_PASSWORD=YOUR_PASSWORD
OPENAI_API_KEY=sk-proj-YOUR_API_KEY
```

**Note:** Never commit `.env` or credential files to Git!

### Step 3: Install Dependencies

```bash
pip install neo4j openai python-dotenv pandas jupyter
```

### Step 4: Run Notebooks

**Local Execution:**
- Open `Assignment_4/notebooks/Assignment_4_Hospital_GraphRAG_QA_CLEAN.ipynb`
- Ensure `.env` file is configured
- Run all cells

**Google Colab:**
- Upload `Assignment_4/notebooks/Assignment_4_Hospital_GraphRAG_QA_COLAB_CLEAN.ipynb`
- Update credentials in the first cell
- Upload evaluation datasets from `Assignment_4/data/`
- Run all cells

---

## Repository Structure

```
Knowledge Graphs with LLM/
├── Assignment_1/                      # Schema design & requirements
│   └── [Requirements analysis documents]
│
├── Assignment_2/                      # Neo4j implementation
│   ├── hospital_setup.cypher          # Schema + data
│   ├── competency_queries.cypher      # 12 queries
│   ├── Assignment2_Report.md          # Detailed documentation
│   └── screenshots/                   # Query visualizations
│
├── Assignment_3/                      # Entity extraction pipeline
│   ├── entity_extraction_pipeline.ipynb
│   ├── evaluation_dataset.json
│   ├── Assignment3_Report.md
│   └── results/
│
├── Assignment_4/                      # GraphRAG QA system
│   ├── notebooks/
│   │   ├── Assignment_4_Hospital_GraphRAG_QA_CLEAN.ipynb
│   │   └── Assignment_4_Hospital_GraphRAG_QA_COLAB_CLEAN.ipynb
│   ├── data/
│   │   ├── evaluation_questions.json
│   │   └── adversarial_questions.json
│   ├── results/
│   │   ├── evaluation_results.csv
│   │   └── adversarial_results.csv
│   ├── reference/                     # Professor's examples
│   ├── Assignment4_Report.md
│   ├── PRESENTATION.md
│   └── PROJECT_STRUCTURE.md
│
└── README.md                          # This file
```

---

## Future Enhancements

### Short-Term Improvements
1. **Expand Hospital KG** - Add patient data, clinical workflows, supply chain
2. **Query Result Caching** - Reduce latency and API costs
3. **Multi-hop Reasoning** - Complex queries requiring multiple graph traversals
4. **Multilingual Support** - Questions in Greek, English, other languages
5. **Confidence Scores** - Report answer confidence to users

### Long-Term Vision
1. **Real-Time Updates** - Sync KG with hospital management systems
2. **Fine-Tuned Models** - Domain-specific models for cost reduction
3. **Graph Neural Networks** - Pattern recognition and anomaly detection
4. **User Interface** - Web application for non-technical users
5. **Production Deployment** - Scalable web service with monitoring
6. **Federated Learning** - Multi-hospital knowledge graphs with privacy

---

## Conclusion

This project demonstrates the **power of combining structured knowledge graphs with large language models**. The progressive assignments built foundational understanding of:

1. **Knowledge graph schema design principles**
2. **Graph database implementation and querying** (Neo4j, Cypher)
3. **LLM-powered entity extraction and annotation**
4. **Production-ready GraphRAG systems** for intelligent QA

### Final Results
- **87% relevancy score** on diverse question types
- **Robust to adversarial inputs** (typos, ambiguity, non-existent entities)
- **Hybrid approach** balances speed (Text2Cypher) and flexibility (KG-as-Context)
- **Production-ready architecture** with error handling and fallbacks

### Key Takeaway

**GraphRAG systems excel when structured knowledge (graphs) and unstructured reasoning (LLMs) work together, each compensating for the other's weaknesses:**
- **Graphs provide:** Factual grounding, structured relationships, efficient querying
- **LLMs provide:** Natural language understanding, flexible reasoning, answer synthesis

The future of AI systems lies in hybrid approaches that combine the best of symbolic and neural methods.

---

<div align="center">

**Knowledge Graphs with Large Language Models**
Athens University of Economics and Business (AUEB)
MSc in AI and Data Science, 2025-2026
Instructor: Panos Alexopoulos

---

*For questions about this project or collaboration opportunities, contact through AUEB academic channels.*

</div>
