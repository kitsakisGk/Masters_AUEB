// ============================================================================
// COMPETENCY QUESTION QUERIES
// Hospital Resource Management Knowledge Graph
// Assignment 2 - Knowledge Graphs with LLMs
// ============================================================================

// ============================================================================
// SIMPLE FACTUAL QUERIES (Q1-Q4)
// ============================================================================

// ----------------------------------------------------------------------------
// Q1: "How many ICU beds are currently available in the hospital?"
// ----------------------------------------------------------------------------

MATCH (f:Facility)
WHERE f.type = 'ICU Bed' AND f.isAvailable = true
RETURN count(f) AS AvailableICUBeds;


// ----------------------------------------------------------------------------
// Q2: "Which MRI machines are operational today?"
// ----------------------------------------------------------------------------

MATCH (e:Equipment)
WHERE e.name CONTAINS 'MRI' AND e.status = 'Operational'
RETURN e.equipmentId AS EquipmentID,
       e.name AS EquipmentName,
       e.type AS Type,
       e.status AS Status,
       e.manufacturer AS Manufacturer;


// ----------------------------------------------------------------------------
// Q3: "What is the capacity of the Emergency Department?"
// ----------------------------------------------------------------------------

MATCH (d:Department {name: 'Emergency'})
RETURN d.departmentId AS DepartmentID,
       d.name AS DepartmentName,
       d.budget AS Budget,
       d.head AS DepartmentHead;


// ----------------------------------------------------------------------------
// Q4: "How many staff members are scheduled for shifts today?"
// ----------------------------------------------------------------------------

MATCH (s:Staff)-[:ASSIGNED_TO_SHIFT]->(sh:Shift)
WHERE sh.date = date('2024-11-04')
RETURN sh.shiftType AS ShiftType,
       count(DISTINCT s) AS StaffCount
ORDER BY ShiftType;


// ============================================================================
// RELATIONAL QUESTIONS (Q5-Q8)
// ============================================================================

// ----------------------------------------------------------------------------
// Q5: "Which staff members are certified to operate the CT scanner?"
// ----------------------------------------------------------------------------

MATCH (s:Staff)-[cert:CERTIFIED_FOR]->(c:Certification)
WHERE c.name = 'CT Scanner Operation'
  AND cert.expiryDate > date()
RETURN s.staffId AS StaffID,
       s.name AS StaffName,
       s.role AS Role,
       cert.certificationDate AS CertificationDate,
       cert.expiryDate AS ExpiryDate
ORDER BY s.name;


// ----------------------------------------------------------------------------
// Q6: "What equipment is assigned to the Cardiology department?"
// ----------------------------------------------------------------------------

MATCH (e:Equipment)-[:ASSIGNED_TO]->(d:Department {name: 'Cardiology'})
RETURN e.equipmentId AS EquipmentID,
       e.name AS EquipmentName,
       e.type AS Type,
       e.status AS Status,
       e.manufacturer AS Manufacturer
ORDER BY e.name;


// ----------------------------------------------------------------------------
// Q7: "Which operating rooms have access to robotic surgery equipment?"
// ----------------------------------------------------------------------------

MATCH (f:Facility)-[:HAS_ACCESS_TO]->(e:Equipment)
WHERE f.type = 'Operating Room'
  AND e.name CONTAINS 'Robotic'
RETURN f.facilityId AS FacilityID,
       f.location AS OperatingRoom,
       f.isAvailable AS IsAvailable,
       e.name AS RoboticEquipment,
       e.status AS EquipmentStatus;


// ----------------------------------------------------------------------------
// Q8: "Which departments share resources with the Emergency Department?"
// ----------------------------------------------------------------------------

MATCH (d1:Department {name: 'Emergency'})-[r:SHARES_RESOURCES_WITH]-(d2:Department)
RETURN d2.departmentId AS DepartmentID,
       d2.name AS DepartmentName,
       r.resourceType AS SharedResourceType,
       r.since AS SharedSince
ORDER BY d2.name;


// ============================================================================
// AGGREGATION QUESTIONS (Q9-Q10)
// ============================================================================

// ----------------------------------------------------------------------------
// Q9: "What is the current occupancy rate of ICU beds?"
// ----------------------------------------------------------------------------

MATCH (f:Facility)
WHERE f.type = 'ICU Bed'
WITH count(f) AS totalBeds,
     sum(CASE WHEN f.isAvailable = false THEN 1 ELSE 0 END) AS occupiedBeds
RETURN totalBeds,
       occupiedBeds,
       round(100.0 * occupiedBeds / totalBeds, 2) AS OccupancyRate;


// ----------------------------------------------------------------------------
// Q10: "How many staff members have certifications expiring in the next 6 months?"
// ----------------------------------------------------------------------------

MATCH (s:Staff)-[cert:CERTIFIED_FOR]->(c:Certification)
WHERE cert.expiryDate > date()
  AND cert.expiryDate <= date() + duration({months: 6})
RETURN s.staffId AS StaffID,
       s.name AS StaffName,
       s.role AS Role,
       c.name AS CertificationName,
       cert.expiryDate AS ExpiryDate,
       duration.inMonths(date(), cert.expiryDate).months AS MonthsUntilExpiry
ORDER BY cert.expiryDate;


// ----------------------------------------------------------------------------
// Q10 Summary Count
// ----------------------------------------------------------------------------

MATCH (s:Staff)-[cert:CERTIFIED_FOR]->(c:Certification)
WHERE cert.expiryDate > date()
  AND cert.expiryDate <= date() + duration({months: 6})
RETURN count(DISTINCT s) AS StaffWithExpiringCerts,
       count(cert) AS TotalExpiringCertifications;


// ============================================================================
// ANALYTICAL QUESTIONS (Q11-Q12)
// ============================================================================

// ----------------------------------------------------------------------------
// Q11: "Which departments have the most staff members?"
// ----------------------------------------------------------------------------

MATCH (d:Department)<-[:WORKS_IN {isPrimary: true}]-(s:Staff)
WITH d, count(s) AS staffCount
RETURN d.departmentId AS DepartmentID,
       d.name AS DepartmentName,
       staffCount AS StaffCount,
       d.budget AS Budget,
       round(d.budget / staffCount, 2) AS BudgetPerStaff
ORDER BY staffCount DESC;


// ----------------------------------------------------------------------------
// Q12: "Which equipment has undergone the most maintenance?"
// ----------------------------------------------------------------------------

MATCH (e:Equipment)-[:HAS_MAINTENANCE]->(m:MaintenanceRecord)
WITH e, count(m) AS maintenanceCount, sum(m.cost) AS totalCost
RETURN e.equipmentId AS EquipmentID,
       e.name AS EquipmentName,
       e.type AS Type,
       maintenanceCount AS MaintenanceEvents,
       totalCost AS TotalMaintenanceCost
ORDER BY maintenanceCount DESC, totalCost DESC;


// ============================================================================
// VISUALIZATION QUERIES (FOR SCREENSHOTS)
// ============================================================================

// ----------------------------------------------------------------------------
// VIZ 1: Full Graph Overview
// ----------------------------------------------------------------------------

MATCH (n)
RETURN n
LIMIT 100;


// ----------------------------------------------------------------------------
// VIZ 2: Q5 - CT Scanner Certifications
// ----------------------------------------------------------------------------

MATCH p=(s:Staff)-[:CERTIFIED_FOR]->(c:Certification {name: 'CT Scanner Operation'})
RETURN p;


// ----------------------------------------------------------------------------
// VIZ 3: Q6 - Cardiology Equipment
// ----------------------------------------------------------------------------

MATCH p=(e:Equipment)-[:ASSIGNED_TO]->(d:Department {name: 'Cardiology'})
RETURN p;


// ----------------------------------------------------------------------------
// VIZ 4: Q7 - Robotic Surgery Access
// ----------------------------------------------------------------------------

MATCH p=(f:Facility)-[:HAS_ACCESS_TO]->(e:Equipment)
WHERE f.type = 'Operating Room' AND e.name CONTAINS 'Robotic'
RETURN p;


// ----------------------------------------------------------------------------
// VIZ 5: Q8 - Emergency Resource Sharing
// ----------------------------------------------------------------------------

MATCH p=(d1:Department {name: 'Emergency'})-[:SHARES_RESOURCES_WITH]-(d2:Department)
RETURN p;


// ----------------------------------------------------------------------------
// VIZ 6: Q11 - Department Staffing Network
// ----------------------------------------------------------------------------

MATCH p=(s:Staff)-[:WORKS_IN {isPrimary: true}]->(d:Department)
RETURN p
LIMIT 40;


// ----------------------------------------------------------------------------
// VIZ 7: Complete Hospital Network
// ----------------------------------------------------------------------------

MATCH p=(s:Staff)-[:WORKS_IN]->(d:Department)<-[:ASSIGNED_TO]-(e:Equipment)
RETURN p
LIMIT 25;


// ----------------------------------------------------------------------------
// VIZ 8: Department Resource Sharing Network
// ----------------------------------------------------------------------------

MATCH p=(d1:Department)-[:SHARES_RESOURCES_WITH]-(d2:Department)
RETURN p;


// ============================================================================
// DATABASE VALIDATION QUERIES
// ============================================================================

// ----------------------------------------------------------------------------
// Count nodes by type
// ----------------------------------------------------------------------------

MATCH (n)
RETURN labels(n)[0] AS NodeType, count(n) AS Count
ORDER BY Count DESC;


// ----------------------------------------------------------------------------
// Count relationships by type
// ----------------------------------------------------------------------------

MATCH ()-[r]->()
RETURN type(r) AS RelationshipType, count(r) AS Count
ORDER BY Count DESC;


// ----------------------------------------------------------------------------
// Total database statistics
// ----------------------------------------------------------------------------

MATCH (n)
WITH count(n) AS totalNodes
MATCH ()-[r]->()
RETURN totalNodes AS TotalNodes,
       count(r) AS TotalRelationships;
