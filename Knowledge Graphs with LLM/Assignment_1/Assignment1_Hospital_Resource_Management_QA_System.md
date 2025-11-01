# Assignment 1: QA System and Knowledge Graph Specification

## Hospital Resource Management System

**Course**: Knowledge Graphs with Large Language Models
**Program**: MSc in AI and Data Science, 2025-2026
**Instructor**: Panos Alexopoulos

---

## Task 1: Scenario and Domain Selection

### Domain: Hospital Resource Management

We have selected **Hospital Resource Management** as the domain for our GraphRAG-based QA system. This domain focuses on the optimization and coordination of hospital resources including staff, equipment, facilities, and supplies.

### Justification

Hospital resource management is an ideal domain for a GraphRAG system because:

1. **High Business Value**: Hospitals face constant pressure to optimize resource utilization while maintaining quality care. Inefficient resource allocation leads to increased costs, staff burnout, delayed treatments, and reduced patient satisfaction.

2. **Complex Interconnected Data**: Hospital operations involve complex relationships between staff (doctors, nurses, technicians), equipment (MRI machines, ventilators, beds), facilities (operating rooms, ICU units, wards), patients, departments, and time schedules. A knowledge graph naturally represents these interconnected entities.

3. **Data Availability**: Hospitals maintain extensive structured data in various systems:

   - HR databases (staff credentials, certifications, schedules, specializations)
   - Asset management systems (equipment inventory, maintenance schedules, locations)
   - Electronic Health Records (patient volumes, treatment types, department loads)
   - Facility management systems (room availability, capacity, utilization rates)
   - Supply chain databases (inventory levels, procurement, suppliers)

4. **Existing Ontologies and Standards**: The healthcare domain has well-established ontologies and classifications such as:

   - ICD-10/11 for medical procedures and conditions
   - SNOMED CT for clinical terminology
   - HL7 standards for healthcare information exchange
   - Healthcare facility and equipment taxonomies

5. **Clear Decision Support Need**: Hospital administrators and operations managers constantly need to answer complex queries about resource availability, allocation patterns, bottlenecks, and optimization opportunities. Current systems often require manual data aggregation from multiple sources.

---

## Task 2: System Description

### What the System Does

The **Hospital Resource Management QA System** is an intelligent question-answering platform that enables hospital administrators and operations managers to query resource-related information using natural language. The system leverages a knowledge graph containing comprehensive data about hospital staff, equipment, facilities, departments, schedules, and operational metrics, combined with a Large Language Model to interpret questions and generate accurate, context-aware answers.

The system provides:

- **Real-time resource availability information** (staff on duty, equipment status, bed availability)
- **Historical utilization analytics** (department workloads, equipment usage patterns, staffing trends)
- **Relationship insights** (which staff are qualified for specific equipment, department interdependencies)
- **Optimization recommendations** (underutilized resources, bottlenecks, scheduling conflicts)
- **Predictive insights** (resource needs forecasting, maintenance schedules)

### Who the Users Are

The primary users of this system are:

1. **Hospital Administrators**: Senior management responsible for strategic resource planning, budget allocation, and overall operational efficiency.

2. **Operations Managers**: Mid-level managers overseeing daily operations, coordinating between departments, and resolving resource allocation issues.

3. **Department Heads**: Leaders of specific departments (Emergency, Surgery, Radiology, etc.) who need to understand their resource allocation and compare with other departments.

4. **Facility Managers**: Personnel responsible for maintaining physical infrastructure, equipment, and facilities.

5. **HR Managers**: Staff responsible for workforce planning, scheduling, and ensuring adequate staffing levels across departments.

### Why It Is Useful

The system creates significant value for the organization by:

1. **Enabling Data-Driven Decisions**: Instead of relying on intuition or manually aggregating data from multiple systems, managers can quickly get accurate answers to complex resource questions, leading to better-informed decisions.

2. **Reducing Resource Waste**: By identifying underutilized equipment, overstaffed departments, or inefficient scheduling patterns, the hospital can optimize resource allocation and reduce unnecessary costs.

3. **Improving Response Times**: During critical situations (emergencies, equipment failures, staff shortages), managers can rapidly query available alternatives and make quick reallocation decisions.

4. **Preventing Bottlenecks**: By analyzing relationships between resources (e.g., equipment maintenance schedules vs. surgical schedules), the system helps prevent operational bottlenecks before they occur.

5. **Supporting Strategic Planning**: Historical analytics and trend analysis help with long-term planning for equipment procurement, staff hiring, facility expansion, and budget allocation.

6. **Enhancing Compliance**: The system can track certifications, equipment maintenance schedules, and regulatory requirements, ensuring compliance with healthcare standards.

7. **Democratizing Data Access**: Non-technical users can access complex operational data without needing to understand database queries or navigate multiple systems.

---

## Task 3: Question Space Definition

The system should be able to answer questions across different complexity levels:

### Simple Factual Queries (Direct Lookups)

1. "How many ICU beds are currently available in the hospital?"
2. "Which MRI machines are operational today?"
3. "What is the capacity of the Emergency Department?"
4. "How many nurses are scheduled for the night shift in Ward 3?"
5. "When is the next maintenance scheduled for Ventilator-A12?"

### Relational Questions (Connections Between Entities)

6. "Which staff members are certified to operate the new CT scanner?"
7. "What equipment is assigned to the Cardiology department?"
8. "Which operating rooms have access to robotic surgery equipment?"
9. "Which departments share resources with the Emergency Department?"
10. "What backup equipment is available if MRI-2 goes down?"

### Aggregation and Statistical Questions

11. "What is the average occupancy rate of ICU beds over the past 3 months?"
12. "Which department has the highest equipment maintenance costs this year?"
13. "How many staff members have certifications expiring in the next 6 months?"
14. "What is the total cost of unused medical equipment in storage?"

### Analytical and Comparative Questions

15. "Which departments are consistently understaffed compared to their patient volume?"
16. "What is the utilization rate of our surgical equipment compared to industry benchmarks?"
17. "Which pieces of equipment have the highest downtime-to-usage ratio?"
18. "Are there patterns in equipment failures that correlate with specific departments or time periods?"

### Optimization and Recommendation Questions

19. "What resources could be reallocated from Department X to Department Y to improve overall efficiency?"
20. "Which staff scheduling changes would reduce overtime costs while maintaining coverage?"

### Complexity Coverage

The questions cover:

- **Simple lookups**: Questions 1-5 require direct retrieval of entity properties
- **Relationship traversal**: Questions 6-10 involve navigating connections in the graph
- **Aggregation**: Questions 11-14 require counting, averaging, or summing across multiple entities
- **Analysis**: Questions 15-18 involve comparisons, pattern detection, and trend identification
- **Complex reasoning**: Questions 19-20 require understanding multiple constraints and relationships to provide recommendations

---

## Task 4: Knowledge Graph Requirements

To support the questions defined in Task 3, the knowledge graph must contain the following information:

### Core Entities and Properties

#### 1. Staff

- Unique identifier
- Name and role (doctor, nurse, technician, administrator)
- Department assignment(s)
- Specializations and qualifications
- Certifications (type, expiry date, issuing body)
- Employment status (full-time, part-time, contract)
- Shift schedules (current and historical)
- Equipment operation certifications
- Contact information

#### 2. Equipment

- Unique identifier and name
- Type/category (diagnostic, therapeutic, surgical, support)
- Manufacturer and model
- Operational status (operational, under maintenance, broken, in storage)
- Location (department, room)
- Purchase date and cost
- Maintenance schedule and history
- Usage logs (frequency, duration, department)
- Required certifications to operate
- Warranty and lifecycle information

#### 3. Facilities

- Unique identifier
- Type (operating room, ICU bed, ward, examination room)
- Capacity (number of beds, maximum occupancy)
- Current occupancy/availability status
- Department ownership
- Equipment contained/assigned
- Scheduled usage (surgeries, procedures, maintenance)
- Physical characteristics (size, specialized capabilities)

#### 4. Departments

- Unique identifier and name
- Type (Emergency, Surgery, Radiology, Cardiology, etc.)
- Staff roster (current assignments)
- Equipment inventory
- Facility allocations
- Budget information
- Patient volume (current and historical)
- Operating hours
- Resource sharing agreements with other departments

#### 5. Schedules

- Staff work schedules (shifts, rotations, time-off)
- Equipment maintenance schedules
- Facility usage schedules (OR bookings, room reservations)
- Department operational schedules

#### 6. Resource Metrics

- Utilization rates (equipment, staff, facilities)
- Occupancy rates (beds, rooms)
- Costs (equipment maintenance, staff overtime, procurement)
- Performance indicators (patient wait times, equipment downtime)
- Historical trends and patterns

### Key Relationships

1. **Staff ↔ Department**: Staff members assigned to departments (can be multiple)
2. **Staff ↔ Equipment**: Staff certified to operate specific equipment
3. **Staff ↔ Schedule**: Staff assigned to specific shifts and time slots
4. **Equipment ↔ Department**: Equipment allocated to departments
5. **Equipment ↔ Facility**: Equipment located in or assigned to facilities
6. **Equipment ↔ Maintenance**: Equipment linked to maintenance records and schedules
7. **Facility ↔ Department**: Facilities owned or managed by departments
8. **Department ↔ Department**: Resource sharing relationships, dependencies
9. **Department ↔ Budget**: Financial allocation and spending
10. **Equipment ↔ Usage**: Equipment usage events with timestamps and departments

### Temporal Information

The knowledge graph must support temporal queries:

- Historical states (past staffing levels, equipment status)
- Current real-time status
- Future schedules and planned events
- Trend data over time periods (daily, weekly, monthly, yearly)

### Derived/Computed Information

The graph should support computation of:

- Availability (real-time status considering schedules and current usage)
- Utilization rates (usage time / available time)
- Cost metrics (total costs, cost per department, cost per equipment type)
- Certification compliance (staff with valid vs. expiring certifications)
- Capacity metrics (current occupancy / total capacity)
- Performance indicators (downtime percentage, overtime hours)

### Data Quality Requirements

To ensure reliable question answering:

- **Completeness**: All critical entities must have complete property information
- **Currency**: Status information must be updated in real-time or near-real-time
- **Consistency**: Relationships must be bidirectional and consistent (if Equipment X is in Department Y, Department Y must show Equipment X in its inventory)
- **Validation**: Constraints must be enforced (staff can't be scheduled in two places simultaneously, equipment can't be in multiple locations)

### Integration Requirements

The knowledge graph should integrate data from:

- HR management systems (staff information, schedules)
- Asset management systems (equipment inventory, maintenance)
- Facility management systems (room availability, bookings)
- Financial systems (budgets, costs, procurement)
- Operational systems (usage logs, patient volumes)

---

## Summary

This specification defines a GraphRAG-based QA system for hospital resource management that addresses a critical operational need in healthcare organizations. By combining a comprehensive knowledge graph of hospital resources with natural language processing capabilities, the system enables administrators and managers to make data-driven decisions quickly and efficiently.

The knowledge graph's rich representation of entities (staff, equipment, facilities, departments), their relationships, temporal information, and metrics provides the foundation for answering questions ranging from simple lookups to complex analytical queries. This system has the potential to significantly improve resource utilization, reduce costs, prevent operational bottlenecks, and ultimately contribute to better patient care through optimized resource allocation.
