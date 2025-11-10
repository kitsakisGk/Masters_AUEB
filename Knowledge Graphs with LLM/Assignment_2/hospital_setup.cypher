// ==========================================
// HOSPITAL RESOURCE MANAGEMENT KNOWLEDGE GRAPH
// ==========================================

// ==========================================
// 1. CONSTRAINTS (Ensure Data Integrity)
// ==========================================

CREATE CONSTRAINT staff_id_unique IF NOT EXISTS FOR (s:Staff) REQUIRE s.staffId IS UNIQUE;
CREATE CONSTRAINT dept_id_unique IF NOT EXISTS FOR (d:Department) REQUIRE d.departmentId IS UNIQUE;
CREATE CONSTRAINT equip_id_unique IF NOT EXISTS FOR (e:Equipment) REQUIRE e.equipmentId IS UNIQUE;
CREATE CONSTRAINT facility_id_unique IF NOT EXISTS FOR (f:Facility) REQUIRE f.facilityId IS UNIQUE;
CREATE CONSTRAINT cert_name_unique IF NOT EXISTS FOR (c:Certification) REQUIRE c.name IS UNIQUE;
CREATE CONSTRAINT shift_id_unique IF NOT EXISTS FOR (sh:Shift) REQUIRE sh.shiftId IS UNIQUE;
CREATE CONSTRAINT maint_id_unique IF NOT EXISTS FOR (m:MaintenanceRecord) REQUIRE m.recordId IS UNIQUE;

// ==========================================
// 2. INDEXES (Improve Query Performance)
// ==========================================

CREATE INDEX staff_role IF NOT EXISTS FOR (s:Staff) ON (s.role);
CREATE INDEX equipment_type IF NOT EXISTS FOR (e:Equipment) ON (e.type);
CREATE INDEX facility_type IF NOT EXISTS FOR (f:Facility) ON (f.type);

// ==========================================
// 3. CREATE NODES
// ==========================================

// --- DEPARTMENTS (8) ---
CREATE
  (:Department {
    departmentId: 'D001',
    name: 'Emergency',
    budget: 500000,
    head: 'Dr. Sarah Johnson'
  }),
  (:Department {
    departmentId: 'D002',
    name: 'Cardiology',
    budget: 450000,
    head: 'Dr. Michael Chen'
  }),
  (:Department {
    departmentId: 'D003',
    name: 'Radiology',
    budget: 400000,
    head: 'Dr. Emily Rodriguez'
  }),
  (:Department {
    departmentId: 'D004',
    name: 'Surgery',
    budget: 600000,
    head: 'Dr. James Wilson'
  }),
  (:Department {
    departmentId: 'D005',
    name: 'Pediatrics',
    budget: 350000,
    head: 'Dr. Lisa Anderson'
  }),
  (:Department {
    departmentId: 'D006',
    name: 'Neurology',
    budget: 480000,
    head: 'Dr. Robert Martinez'
  }),
  (:Department {
    departmentId: 'D007',
    name: 'Oncology',
    budget: 520000,
    head: 'Dr. Jennifer Lee'
  }),
  (:Department {
    departmentId: 'D008',
    name: 'Orthopedics',
    budget: 420000,
    head: 'Dr. David Thompson'
  });

// --- STAFF (30) ---
CREATE
  // Emergency Department
  (:Staff {staffId: 'S001', name: 'Dr. Sarah Johnson', role: 'Doctor', employmentStatus: 'Full-time', email: 'sarah.johnson@hospital.com', phone: '555-0101'}),
  (:Staff {staffId: 'S002', name: 'Nurse Emily Davis', role: 'Nurse', employmentStatus: 'Full-time', email: 'emily.davis@hospital.com', phone: '555-0102'}),
  (:Staff {staffId: 'S003', name: 'Nurse James Brown', role: 'Nurse', employmentStatus: 'Full-time', email: 'james.brown@hospital.com', phone: '555-0103'}),
  (:Staff {staffId: 'S004', name: 'Tech Operator Alex Kim', role: 'Technician', employmentStatus: 'Part-time', email: 'alex.kim@hospital.com', phone: '555-0104'}),

  // Cardiology Department
  (:Staff {staffId: 'S005', name: 'Dr. Michael Chen', role: 'Doctor', employmentStatus: 'Full-time', email: 'michael.chen@hospital.com', phone: '555-0105'}),
  (:Staff {staffId: 'S006', name: 'Nurse Maria Garcia', role: 'Nurse', employmentStatus: 'Full-time', email: 'maria.garcia@hospital.com', phone: '555-0106'}),
  (:Staff {staffId: 'S007', name: 'Tech Anna Patel', role: 'Technician', employmentStatus: 'Full-time', email: 'anna.patel@hospital.com', phone: '555-0107'}),

  // Radiology Department
  (:Staff {staffId: 'S008', name: 'Dr. Emily Rodriguez', role: 'Doctor', employmentStatus: 'Full-time', email: 'emily.rodriguez@hospital.com', phone: '555-0108'}),
  (:Staff {staffId: 'S009', name: 'Tech David Lee', role: 'Technician', employmentStatus: 'Full-time', email: 'david.lee@hospital.com', phone: '555-0109'}),
  (:Staff {staffId: 'S010', name: 'Tech Sophie Martinez', role: 'Technician', employmentStatus: 'Part-time', email: 'sophie.martinez@hospital.com', phone: '555-0110'}),

  // Surgery Department
  (:Staff {staffId: 'S011', name: 'Dr. James Wilson', role: 'Doctor', employmentStatus: 'Full-time', email: 'james.wilson@hospital.com', phone: '555-0111'}),
  (:Staff {staffId: 'S012', name: 'Dr. Rachel Green', role: 'Doctor', employmentStatus: 'Full-time', email: 'rachel.green@hospital.com', phone: '555-0112'}),
  (:Staff {staffId: 'S013', name: 'Nurse John Smith', role: 'Nurse', employmentStatus: 'Full-time', email: 'john.smith@hospital.com', phone: '555-0113'}),
  (:Staff {staffId: 'S014', name: 'Nurse Linda White', role: 'Nurse', employmentStatus: 'Full-time', email: 'linda.white@hospital.com', phone: '555-0114'}),

  // Pediatrics Department
  (:Staff {staffId: 'S015', name: 'Dr. Lisa Anderson', role: 'Doctor', employmentStatus: 'Full-time', email: 'lisa.anderson@hospital.com', phone: '555-0115'}),
  (:Staff {staffId: 'S016', name: 'Nurse Chris Taylor', role: 'Nurse', employmentStatus: 'Full-time', email: 'chris.taylor@hospital.com', phone: '555-0116'}),
  (:Staff {staffId: 'S017', name: 'Nurse Amy Johnson', role: 'Nurse', employmentStatus: 'Part-time', email: 'amy.johnson@hospital.com', phone: '555-0117'}),

  // Neurology Department
  (:Staff {staffId: 'S018', name: 'Dr. Robert Martinez', role: 'Doctor', employmentStatus: 'Full-time', email: 'robert.martinez@hospital.com', phone: '555-0118'}),
  (:Staff {staffId: 'S019', name: 'Nurse Kevin Wong', role: 'Nurse', employmentStatus: 'Full-time', email: 'kevin.wong@hospital.com', phone: '555-0119'}),
  (:Staff {staffId: 'S020', name: 'Tech Sarah Kim', role: 'Technician', employmentStatus: 'Full-time', email: 'sarah.kim@hospital.com', phone: '555-0120'}),

  // Oncology Department
  (:Staff {staffId: 'S021', name: 'Dr. Jennifer Lee', role: 'Doctor', employmentStatus: 'Full-time', email: 'jennifer.lee@hospital.com', phone: '555-0121'}),
  (:Staff {staffId: 'S022', name: 'Nurse Tom Harris', role: 'Nurse', employmentStatus: 'Full-time', email: 'tom.harris@hospital.com', phone: '555-0122'}),
  (:Staff {staffId: 'S023', name: 'Nurse Jessica Park', role: 'Nurse', employmentStatus: 'Full-time', email: 'jessica.park@hospital.com', phone: '555-0123'}),

  // Orthopedics Department
  (:Staff {staffId: 'S024', name: 'Dr. David Thompson', role: 'Doctor', employmentStatus: 'Full-time', email: 'david.thompson@hospital.com', phone: '555-0124'}),
  (:Staff {staffId: 'S025', name: 'Nurse Michelle Brown', role: 'Nurse', employmentStatus: 'Full-time', email: 'michelle.brown@hospital.com', phone: '555-0125'}),
  (:Staff {staffId: 'S026', name: 'Tech Brian Miller', role: 'Technician', employmentStatus: 'Part-time', email: 'brian.miller@hospital.com', phone: '555-0126'}),

  // Additional Staff (Float/Support)
  (:Staff {staffId: 'S027', name: 'Nurse Patricia Davis', role: 'Nurse', employmentStatus: 'Full-time', email: 'patricia.davis@hospital.com', phone: '555-0127'}),
  (:Staff {staffId: 'S028', name: 'Tech Richard Clark', role: 'Technician', employmentStatus: 'Full-time', email: 'richard.clark@hospital.com', phone: '555-0128'}),
  (:Staff {staffId: 'S029', name: 'Admin Susan Turner', role: 'Administrator', employmentStatus: 'Full-time', email: 'susan.turner@hospital.com', phone: '555-0129'}),
  (:Staff {staffId: 'S030', name: 'Dr. Andrew Scott', role: 'Doctor', employmentStatus: 'Part-time', email: 'andrew.scott@hospital.com', phone: '555-0130'});

// --- EQUIPMENT (25) ---
CREATE
  // Diagnostic Equipment
  (:Equipment {equipmentId: 'E001', name: 'CT Scanner Model X1', type: 'Diagnostic', manufacturer: 'Siemens', purchaseDate: date('2020-03-15'), lastMaintenance: date('2024-10-01'), status: 'Operational'}),
  (:Equipment {equipmentId: 'E002', name: 'MRI Machine Pro 3T', type: 'Diagnostic', manufacturer: 'GE Healthcare', purchaseDate: date('2019-06-20'), lastMaintenance: date('2024-09-15'), status: 'Operational'}),
  (:Equipment {equipmentId: 'E003', name: 'X-Ray Machine Digital', type: 'Diagnostic', manufacturer: 'Philips', purchaseDate: date('2021-01-10'), lastMaintenance: date('2024-10-05'), status: 'Operational'}),
  (:Equipment {equipmentId: 'E004', name: 'Ultrasound System HD', type: 'Diagnostic', manufacturer: 'Canon Medical', purchaseDate: date('2022-04-12'), lastMaintenance: date('2024-09-20'), status: 'Operational'}),
  (:Equipment {equipmentId: 'E005', name: 'PET Scanner Advanced', type: 'Diagnostic', manufacturer: 'Siemens', purchaseDate: date('2020-11-05'), lastMaintenance: date('2024-08-30'), status: 'Operational'}),

  // Cardiology Equipment
  (:Equipment {equipmentId: 'E006', name: 'ECG Machine 12-Lead', type: 'Monitoring', manufacturer: 'GE Healthcare', purchaseDate: date('2021-07-18'), lastMaintenance: date('2024-10-10'), status: 'Operational'}),
  (:Equipment {equipmentId: 'E007', name: 'Defibrillator AED Plus', type: 'Life Support', manufacturer: 'Zoll Medical', purchaseDate: date('2022-02-14'), lastMaintenance: date('2024-09-25'), status: 'Operational'}),
  (:Equipment {equipmentId: 'E008', name: 'Cardiac Monitor Portable', type: 'Monitoring', manufacturer: 'Philips', purchaseDate: date('2023-01-20'), lastMaintenance: date('2024-10-12'), status: 'Operational'}),
  (:Equipment {equipmentId: 'E009', name: 'Angiography System', type: 'Diagnostic', manufacturer: 'Siemens', purchaseDate: date('2019-09-10'), lastMaintenance: date('2024-08-15'), status: 'Operational'}),

  // Surgical Equipment
  (:Equipment {equipmentId: 'E010', name: 'Robotic Surgery System da Vinci', type: 'Surgical', manufacturer: 'Intuitive Surgical', purchaseDate: date('2021-05-22'), lastMaintenance: date('2024-09-10'), status: 'Operational'}),
  (:Equipment {equipmentId: 'E011', name: 'Surgical Laser CO2', type: 'Surgical', manufacturer: 'Lumenis', purchaseDate: date('2020-12-08'), lastMaintenance: date('2024-10-01'), status: 'Operational'}),
  (:Equipment {equipmentId: 'E012', name: 'Anesthesia Machine Advanced', type: 'Surgical', manufacturer: 'Dräger', purchaseDate: date('2022-03-30'), lastMaintenance: date('2024-09-28'), status: 'Operational'}),
  (:Equipment {equipmentId: 'E013', name: 'Surgical Microscope Zeiss', type: 'Surgical', manufacturer: 'Carl Zeiss', purchaseDate: date('2021-08-17'), lastMaintenance: date('2024-10-08'), status: 'Operational'}),

  // Life Support Equipment
  (:Equipment {equipmentId: 'E014', name: 'Ventilator ICU Pro', type: 'Life Support', manufacturer: 'Medtronic', purchaseDate: date('2020-04-25'), lastMaintenance: date('2024-10-15'), status: 'Operational'}),
  (:Equipment {equipmentId: 'E015', name: 'Dialysis Machine Fresenius', type: 'Life Support', manufacturer: 'Fresenius Medical', purchaseDate: date('2021-11-12'), lastMaintenance: date('2024-09-18'), status: 'Operational'}),
  (:Equipment {equipmentId: 'E016', name: 'Infusion Pump Smart', type: 'Monitoring', manufacturer: 'B. Braun', purchaseDate: date('2022-06-05'), lastMaintenance: date('2024-10-20'), status: 'Operational'}),

  // Laboratory Equipment
  (:Equipment {equipmentId: 'E017', name: 'Blood Analyzer Automated', type: 'Laboratory', manufacturer: 'Abbott', purchaseDate: date('2020-07-14'), lastMaintenance: date('2024-09-22'), status: 'Operational'}),
  (:Equipment {equipmentId: 'E018', name: 'Centrifuge High-Speed', type: 'Laboratory', manufacturer: 'Eppendorf', purchaseDate: date('2021-02-28'), lastMaintenance: date('2024-10-05'), status: 'Operational'}),
  (:Equipment {equipmentId: 'E019', name: 'Microscope Research Grade', type: 'Laboratory', manufacturer: 'Nikon', purchaseDate: date('2022-09-10'), lastMaintenance: date('2024-09-30'), status: 'Operational'}),

  // Oncology Equipment
  (:Equipment {equipmentId: 'E020', name: 'Radiation Therapy Linear Accelerator', type: 'Therapeutic', manufacturer: 'Varian', purchaseDate: date('2019-10-22'), lastMaintenance: date('2024-08-25'), status: 'Operational'}),
  (:Equipment {equipmentId: 'E021', name: 'Chemotherapy Infusion System', type: 'Therapeutic', manufacturer: 'BD', purchaseDate: date('2021-04-18'), lastMaintenance: date('2024-10-10'), status: 'Operational'}),

  // Orthopedics Equipment
  (:Equipment {equipmentId: 'E022', name: 'C-Arm Fluoroscopy Mobile', type: 'Diagnostic', manufacturer: 'Ziehm', purchaseDate: date('2022-01-15'), lastMaintenance: date('2024-09-12'), status: 'Operational'}),
  (:Equipment {equipmentId: 'E023', name: 'Bone Densitometer DEXA', type: 'Diagnostic', manufacturer: 'Hologic', purchaseDate: date('2020-08-20'), lastMaintenance: date('2024-10-03'), status: 'Operational'}),

  // Emergency Equipment
  (:Equipment {equipmentId: 'E024', name: 'Portable X-Ray Unit', type: 'Diagnostic', manufacturer: 'MinXray', purchaseDate: date('2023-03-08'), lastMaintenance: date('2024-10-18'), status: 'Operational'}),
  (:Equipment {equipmentId: 'E025', name: 'Patient Monitor Bedside', type: 'Monitoring', manufacturer: 'Mindray', purchaseDate: date('2021-12-05'), lastMaintenance: date('2024-10-22'), status: 'Operational'});

// --- FACILITIES (20) ---
CREATE
  // ICU Beds
  (:Facility {facilityId: 'F001', type: 'ICU Bed', location: 'ICU Ward A', capacity: 1, isAvailable: true}),
  (:Facility {facilityId: 'F002', type: 'ICU Bed', location: 'ICU Ward A', capacity: 1, isAvailable: true}),
  (:Facility {facilityId: 'F003', type: 'ICU Bed', location: 'ICU Ward B', capacity: 1, isAvailable: false}),
  (:Facility {facilityId: 'F004', type: 'ICU Bed', location: 'ICU Ward B', capacity: 1, isAvailable: true}),

  // Operating Rooms
  (:Facility {facilityId: 'F005', type: 'Operating Room', location: 'Surgical Floor 3', capacity: 1, isAvailable: true}),
  (:Facility {facilityId: 'F006', type: 'Operating Room', location: 'Surgical Floor 3', capacity: 1, isAvailable: false}),
  (:Facility {facilityId: 'F007', type: 'Operating Room', location: 'Surgical Floor 4', capacity: 1, isAvailable: true}),
  (:Facility {facilityId: 'F008', type: 'Operating Room', location: 'Surgical Floor 4', capacity: 1, isAvailable: true}),

  // Emergency Rooms
  (:Facility {facilityId: 'F009', type: 'Emergency Room', location: 'ER Building A', capacity: 2, isAvailable: true}),
  (:Facility {facilityId: 'F010', type: 'Emergency Room', location: 'ER Building A', capacity: 2, isAvailable: false}),
  (:Facility {facilityId: 'F011', type: 'Emergency Room', location: 'ER Building B', capacity: 2, isAvailable: true}),

  // Radiology Rooms
  (:Facility {facilityId: 'F012', type: 'Radiology Room', location: 'Imaging Center Floor 1', capacity: 1, isAvailable: true}),
  (:Facility {facilityId: 'F013', type: 'Radiology Room', location: 'Imaging Center Floor 2', capacity: 1, isAvailable: true}),
  (:Facility {facilityId: 'F014', type: 'Radiology Room', location: 'Imaging Center Floor 2', capacity: 1, isAvailable: false}),

  // Examination Rooms
  (:Facility {facilityId: 'F015', type: 'Examination Room', location: 'Outpatient Clinic Wing A', capacity: 1, isAvailable: true}),
  (:Facility {facilityId: 'F016', type: 'Examination Room', location: 'Outpatient Clinic Wing B', capacity: 1, isAvailable: true}),
  (:Facility {facilityId: 'F017', type: 'Examination Room', location: 'Outpatient Clinic Wing C', capacity: 1, isAvailable: true}),

  // Treatment Rooms
  (:Facility {facilityId: 'F018', type: 'Treatment Room', location: 'Oncology Center', capacity: 1, isAvailable: true}),
  (:Facility {facilityId: 'F019', type: 'Treatment Room', location: 'Oncology Center', capacity: 1, isAvailable: false}),
  (:Facility {facilityId: 'F020', type: 'Treatment Room', location: 'Cardiology Wing', capacity: 1, isAvailable: true});

// --- CERTIFICATIONS (10) ---
CREATE
  (:Certification {name: 'Basic Life Support (BLS)', issuingBody: 'American Heart Association', validityPeriod: 2}),
  (:Certification {name: 'Advanced Cardiovascular Life Support (ACLS)', issuingBody: 'American Heart Association', validityPeriod: 2}),
  (:Certification {name: 'CT Scanner Operation', issuingBody: 'Radiology Board', validityPeriod: 3}),
  (:Certification {name: 'MRI Machine Operation', issuingBody: 'Radiology Board', validityPeriod: 3}),
  (:Certification {name: 'Robotic Surgery Certification', issuingBody: 'Surgical Board', validityPeriod: 5}),
  (:Certification {name: 'Pediatric Advanced Life Support (PALS)', issuingBody: 'American Heart Association', validityPeriod: 2}),
  (:Certification {name: 'Radiation Therapy Certification', issuingBody: 'Oncology Board', validityPeriod: 4}),
  (:Certification {name: 'Anesthesia Management', issuingBody: 'Anesthesiology Board', validityPeriod: 3}),
  (:Certification {name: 'Emergency Medical Technician (EMT)', issuingBody: 'National Registry', validityPeriod: 2}),
  (:Certification {name: 'Laboratory Technology Certification', issuingBody: 'Clinical Laboratory Board', validityPeriod: 3});

// --- SHIFTS (15) ---
CREATE
  (:Shift {shiftId: 'SH001', date: date('2024-11-04'), startTime: time('08:00'), endTime: time('16:00'), shiftType: 'Morning'}),
  (:Shift {shiftId: 'SH002', date: date('2024-11-04'), startTime: time('16:00'), endTime: time('00:00'), shiftType: 'Evening'}),
  (:Shift {shiftId: 'SH003', date: date('2024-11-04'), startTime: time('00:00'), endTime: time('08:00'), shiftType: 'Night'}),
  (:Shift {shiftId: 'SH004', date: date('2024-11-05'), startTime: time('08:00'), endTime: time('16:00'), shiftType: 'Morning'}),
  (:Shift {shiftId: 'SH005', date: date('2024-11-05'), startTime: time('16:00'), endTime: time('00:00'), shiftType: 'Evening'}),
  (:Shift {shiftId: 'SH006', date: date('2024-11-05'), startTime: time('00:00'), endTime: time('08:00'), shiftType: 'Night'}),
  (:Shift {shiftId: 'SH007', date: date('2024-11-06'), startTime: time('08:00'), endTime: time('16:00'), shiftType: 'Morning'}),
  (:Shift {shiftId: 'SH008', date: date('2024-11-06'), startTime: time('16:00'), endTime: time('00:00'), shiftType: 'Evening'}),
  (:Shift {shiftId: 'SH009', date: date('2024-11-06'), startTime: time('00:00'), endTime: time('08:00'), shiftType: 'Night'}),
  (:Shift {shiftId: 'SH010', date: date('2024-11-07'), startTime: time('08:00'), endTime: time('16:00'), shiftType: 'Morning'}),
  (:Shift {shiftId: 'SH011', date: date('2024-11-07'), startTime: time('16:00'), endTime: time('00:00'), shiftType: 'Evening'}),
  (:Shift {shiftId: 'SH012', date: date('2024-11-07'), startTime: time('00:00'), endTime: time('08:00'), shiftType: 'Night'}),
  (:Shift {shiftId: 'SH013', date: date('2024-11-08'), startTime: time('08:00'), endTime: time('16:00'), shiftType: 'Morning'}),
  (:Shift {shiftId: 'SH014', date: date('2024-11-08'), startTime: time('16:00'), endTime: time('00:00'), shiftType: 'Evening'}),
  (:Shift {shiftId: 'SH015', date: date('2024-11-08'), startTime: time('00:00'), endTime: time('08:00'), shiftType: 'Night'});

// --- MAINTENANCE RECORDS (12) ---
CREATE
  (:MaintenanceRecord {recordId: 'M001', maintenanceDate: date('2024-10-01'), performedBy: 'TechCare Inc.', cost: 1500.00, notes: 'Routine calibration and cleaning'}),
  (:MaintenanceRecord {recordId: 'M002', maintenanceDate: date('2024-09-15'), performedBy: 'MedTech Services', cost: 2200.00, notes: 'Replaced cooling system'}),
  (:MaintenanceRecord {recordId: 'M003', maintenanceDate: date('2024-10-05'), performedBy: 'Philips Service', cost: 800.00, notes: 'Software update and inspection'}),
  (:MaintenanceRecord {recordId: 'M004', maintenanceDate: date('2024-09-20'), performedBy: 'Canon Medical', cost: 1100.00, notes: 'Probe replacement'}),
  (:MaintenanceRecord {recordId: 'M005', maintenanceDate: date('2024-08-30'), performedBy: 'Siemens Healthineers', cost: 3500.00, notes: 'Major component overhaul'}),
  (:MaintenanceRecord {recordId: 'M006', maintenanceDate: date('2024-10-10'), performedBy: 'GE Service Team', cost: 950.00, notes: 'Battery replacement and testing'}),
  (:MaintenanceRecord {recordId: 'M007', maintenanceDate: date('2024-09-25'), performedBy: 'Zoll Technical', cost: 600.00, notes: 'Pad replacement and firmware update'}),
  (:MaintenanceRecord {recordId: 'M008', maintenanceDate: date('2024-09-10'), performedBy: 'Intuitive Surgical Service', cost: 5000.00, notes: 'Annual comprehensive maintenance'}),
  (:MaintenanceRecord {recordId: 'M009', maintenanceDate: date('2024-10-15'), performedBy: 'Medtronic Support', cost: 1800.00, notes: 'Valve replacement'}),
  (:MaintenanceRecord {recordId: 'M010', maintenanceDate: date('2024-09-18'), performedBy: 'Fresenius Tech', cost: 2400.00, notes: 'Filter replacement and system check'}),
  (:MaintenanceRecord {recordId: 'M011', maintenanceDate: date('2024-08-25'), performedBy: 'Varian Medical', cost: 6500.00, notes: 'Radiation head calibration'}),
  (:MaintenanceRecord {recordId: 'M012', maintenanceDate: date('2024-10-03'), performedBy: 'Hologic Service', cost: 1200.00, notes: 'Sensor calibration'});

// ==========================================
// 4. CREATE RELATIONSHIPS
// ==========================================

// --- STAFF → WORKS_IN → DEPARTMENT ---
MATCH (s:Staff {staffId: 'S001'}), (d:Department {departmentId: 'D001'})
CREATE (s)-[:WORKS_IN {startDate: date('2020-01-15'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S002'}), (d:Department {departmentId: 'D001'})
CREATE (s)-[:WORKS_IN {startDate: date('2021-03-20'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S003'}), (d:Department {departmentId: 'D001'})
CREATE (s)-[:WORKS_IN {startDate: date('2022-06-10'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S004'}), (d:Department {departmentId: 'D003'})
CREATE (s)-[:WORKS_IN {startDate: date('2023-02-14'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S005'}), (d:Department {departmentId: 'D002'})
CREATE (s)-[:WORKS_IN {startDate: date('2019-08-01'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S006'}), (d:Department {departmentId: 'D002'})
CREATE (s)-[:WORKS_IN {startDate: date('2020-11-12'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S007'}), (d:Department {departmentId: 'D002'})
CREATE (s)-[:WORKS_IN {startDate: date('2021-05-18'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S008'}), (d:Department {departmentId: 'D003'})
CREATE (s)-[:WORKS_IN {startDate: date('2018-04-22'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S009'}), (d:Department {departmentId: 'D003'})
CREATE (s)-[:WORKS_IN {startDate: date('2020-09-08'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S010'}), (d:Department {departmentId: 'D003'})
CREATE (s)-[:WORKS_IN {startDate: date('2022-12-01'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S011'}), (d:Department {departmentId: 'D004'})
CREATE (s)-[:WORKS_IN {startDate: date('2017-03-15'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S012'}), (d:Department {departmentId: 'D004'})
CREATE (s)-[:WORKS_IN {startDate: date('2019-07-20'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S013'}), (d:Department {departmentId: 'D004'})
CREATE (s)-[:WORKS_IN {startDate: date('2020-10-05'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S014'}), (d:Department {departmentId: 'D004'})
CREATE (s)-[:WORKS_IN {startDate: date('2021-02-18'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S015'}), (d:Department {departmentId: 'D005'})
CREATE (s)-[:WORKS_IN {startDate: date('2019-09-12'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S016'}), (d:Department {departmentId: 'D005'})
CREATE (s)-[:WORKS_IN {startDate: date('2020-06-25'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S017'}), (d:Department {departmentId: 'D005'})
CREATE (s)-[:WORKS_IN {startDate: date('2023-01-10'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S018'}), (d:Department {departmentId: 'D006'})
CREATE (s)-[:WORKS_IN {startDate: date('2018-11-08'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S019'}), (d:Department {departmentId: 'D006'})
CREATE (s)-[:WORKS_IN {startDate: date('2021-04-15'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S020'}), (d:Department {departmentId: 'D006'})
CREATE (s)-[:WORKS_IN {startDate: date('2022-08-20'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S021'}), (d:Department {departmentId: 'D007'})
CREATE (s)-[:WORKS_IN {startDate: date('2019-02-14'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S022'}), (d:Department {departmentId: 'D007'})
CREATE (s)-[:WORKS_IN {startDate: date('2020-07-30'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S023'}), (d:Department {departmentId: 'D007'})
CREATE (s)-[:WORKS_IN {startDate: date('2021-11-05'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S024'}), (d:Department {departmentId: 'D008'})
CREATE (s)-[:WORKS_IN {startDate: date('2018-06-18'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S025'}), (d:Department {departmentId: 'D008'})
CREATE (s)-[:WORKS_IN {startDate: date('2020-03-22'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S026'}), (d:Department {departmentId: 'D008'})
CREATE (s)-[:WORKS_IN {startDate: date('2022-09-14'), isPrimary: true}]->(d);

// Cross-department support
MATCH (s:Staff {staffId: 'S027'}), (d:Department {departmentId: 'D001'})
CREATE (s)-[:WORKS_IN {startDate: date('2021-01-20'), isPrimary: false}]->(d);

MATCH (s:Staff {staffId: 'S027'}), (d:Department {departmentId: 'D005'})
CREATE (s)-[:WORKS_IN {startDate: date('2021-01-20'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S028'}), (d:Department {departmentId: 'D003'})
CREATE (s)-[:WORKS_IN {startDate: date('2020-05-15'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S029'}), (d:Department {departmentId: 'D001'})
CREATE (s)-[:WORKS_IN {startDate: date('2019-12-01'), isPrimary: true}]->(d);

MATCH (s:Staff {staffId: 'S030'}), (d:Department {departmentId: 'D004'})
CREATE (s)-[:WORKS_IN {startDate: date('2023-03-10'), isPrimary: true}]->(d);

// --- EQUIPMENT → ASSIGNED_TO → DEPARTMENT ---
MATCH (e:Equipment {equipmentId: 'E001'}), (d:Department {departmentId: 'D003'})
CREATE (e)-[:ASSIGNED_TO {assignedDate: date('2020-03-20')}]->(d);

MATCH (e:Equipment {equipmentId: 'E002'}), (d:Department {departmentId: 'D003'})
CREATE (e)-[:ASSIGNED_TO {assignedDate: date('2019-06-25')}]->(d);

MATCH (e:Equipment {equipmentId: 'E003'}), (d:Department {departmentId: 'D003'})
CREATE (e)-[:ASSIGNED_TO {assignedDate: date('2021-01-15')}]->(d);

MATCH (e:Equipment {equipmentId: 'E004'}), (d:Department {departmentId: 'D002'})
CREATE (e)-[:ASSIGNED_TO {assignedDate: date('2022-04-18')}]->(d);

MATCH (e:Equipment {equipmentId: 'E005'}), (d:Department {departmentId: 'D007'})
CREATE (e)-[:ASSIGNED_TO {assignedDate: date('2020-11-10')}]->(d);

MATCH (e:Equipment {equipmentId: 'E006'}), (d:Department {departmentId: 'D002'})
CREATE (e)-[:ASSIGNED_TO {assignedDate: date('2021-07-22')}]->(d);

MATCH (e:Equipment {equipmentId: 'E007'}), (d:Department {departmentId: 'D001'})
CREATE (e)-[:ASSIGNED_TO {assignedDate: date('2022-02-18')}]->(d);

MATCH (e:Equipment {equipmentId: 'E008'}), (d:Department {departmentId: 'D002'})
CREATE (e)-[:ASSIGNED_TO {assignedDate: date('2023-01-25')}]->(d);

MATCH (e:Equipment {equipmentId: 'E009'}), (d:Department {departmentId: 'D002'})
CREATE (e)-[:ASSIGNED_TO {assignedDate: date('2019-09-15')}]->(d);

MATCH (e:Equipment {equipmentId: 'E010'}), (d:Department {departmentId: 'D004'})
CREATE (e)-[:ASSIGNED_TO {assignedDate: date('2021-05-28')}]->(d);

MATCH (e:Equipment {equipmentId: 'E011'}), (d:Department {departmentId: 'D004'})
CREATE (e)-[:ASSIGNED_TO {assignedDate: date('2020-12-12')}]->(d);

MATCH (e:Equipment {equipmentId: 'E012'}), (d:Department {departmentId: 'D004'})
CREATE (e)-[:ASSIGNED_TO {assignedDate: date('2022-04-05')}]->(d);

MATCH (e:Equipment {equipmentId: 'E013'}), (d:Department {departmentId: 'D004'})
CREATE (e)-[:ASSIGNED_TO {assignedDate: date('2021-08-20')}]->(d);

MATCH (e:Equipment {equipmentId: 'E014'}), (d:Department {departmentId: 'D001'})
CREATE (e)-[:ASSIGNED_TO {assignedDate: date('2020-05-01')}]->(d);

MATCH (e:Equipment {equipmentId: 'E015'}), (d:Department {departmentId: 'D006'})
CREATE (e)-[:ASSIGNED_TO {assignedDate: date('2021-11-18')}]->(d);

MATCH (e:Equipment {equipmentId: 'E016'}), (d:Department {departmentId: 'D001'})
CREATE (e)-[:ASSIGNED_TO {assignedDate: date('2022-06-10')}]->(d);

MATCH (e:Equipment {equipmentId: 'E017'}), (d:Department {departmentId: 'D003'})
CREATE (e)-[:ASSIGNED_TO {assignedDate: date('2020-07-20')}]->(d);

MATCH (e:Equipment {equipmentId: 'E018'}), (d:Department {departmentId: 'D003'})
CREATE (e)-[:ASSIGNED_TO {assignedDate: date('2021-03-05')}]->(d);

MATCH (e:Equipment {equipmentId: 'E019'}), (d:Department {departmentId: 'D003'})
CREATE (e)-[:ASSIGNED_TO {assignedDate: date('2022-09-15')}]->(d);

MATCH (e:Equipment {equipmentId: 'E020'}), (d:Department {departmentId: 'D007'})
CREATE (e)-[:ASSIGNED_TO {assignedDate: date('2019-10-28')}]->(d);

MATCH (e:Equipment {equipmentId: 'E021'}), (d:Department {departmentId: 'D007'})
CREATE (e)-[:ASSIGNED_TO {assignedDate: date('2021-04-22')}]->(d);

MATCH (e:Equipment {equipmentId: 'E022'}), (d:Department {departmentId: 'D008'})
CREATE (e)-[:ASSIGNED_TO {assignedDate: date('2022-01-20')}]->(d);

MATCH (e:Equipment {equipmentId: 'E023'}), (d:Department {departmentId: 'D008'})
CREATE (e)-[:ASSIGNED_TO {assignedDate: date('2020-08-25')}]->(d);

MATCH (e:Equipment {equipmentId: 'E024'}), (d:Department {departmentId: 'D001'})
CREATE (e)-[:ASSIGNED_TO {assignedDate: date('2023-03-12')}]->(d);

MATCH (e:Equipment {equipmentId: 'E025'}), (d:Department {departmentId: 'D001'})
CREATE (e)-[:ASSIGNED_TO {assignedDate: date('2021-12-08')}]->(d);

// --- STAFF → CERTIFIED_FOR → CERTIFICATION ---
MATCH (s:Staff {staffId: 'S001'}), (c:Certification {name: 'Advanced Cardiovascular Life Support (ACLS)'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2023-01-15'), expiryDate: date('2025-01-15')}]->(c);

MATCH (s:Staff {staffId: 'S001'}), (c:Certification {name: 'Emergency Medical Technician (EMT)'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2022-06-10'), expiryDate: date('2024-06-10')}]->(c);

MATCH (s:Staff {staffId: 'S002'}), (c:Certification {name: 'Basic Life Support (BLS)'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2023-03-20'), expiryDate: date('2025-03-20')}]->(c);

MATCH (s:Staff {staffId: 'S003'}), (c:Certification {name: 'Basic Life Support (BLS)'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2022-09-15'), expiryDate: date('2024-09-15')}]->(c);

MATCH (s:Staff {staffId: 'S004'}), (c:Certification {name: 'CT Scanner Operation'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2021-07-10'), expiryDate: date('2024-07-10')}]->(c);

MATCH (s:Staff {staffId: 'S005'}), (c:Certification {name: 'Advanced Cardiovascular Life Support (ACLS)'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2022-11-20'), expiryDate: date('2024-11-20')}]->(c);

MATCH (s:Staff {staffId: 'S006'}), (c:Certification {name: 'Basic Life Support (BLS)'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2023-02-14'), expiryDate: date('2025-02-14')}]->(c);

MATCH (s:Staff {staffId: 'S007'}), (c:Certification {name: 'CT Scanner Operation'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2022-05-18'), expiryDate: date('2025-05-18')}]->(c);

MATCH (s:Staff {staffId: 'S008'}), (c:Certification {name: 'CT Scanner Operation'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2021-08-25'), expiryDate: date('2024-08-25')}]->(c);

MATCH (s:Staff {staffId: 'S008'}), (c:Certification {name: 'MRI Machine Operation'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2020-12-10'), expiryDate: date('2023-12-10')}]->(c);

MATCH (s:Staff {staffId: 'S009'}), (c:Certification {name: 'CT Scanner Operation'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2023-04-05'), expiryDate: date('2026-04-05')}]->(c);

MATCH (s:Staff {staffId: 'S009'}), (c:Certification {name: 'MRI Machine Operation'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2022-10-12'), expiryDate: date('2025-10-12')}]->(c);

MATCH (s:Staff {staffId: 'S010'}), (c:Certification {name: 'MRI Machine Operation'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2023-01-08'), expiryDate: date('2026-01-08')}]->(c);

MATCH (s:Staff {staffId: 'S011'}), (c:Certification {name: 'Robotic Surgery Certification'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2021-06-15'), expiryDate: date('2026-06-15')}]->(c);

MATCH (s:Staff {staffId: 'S011'}), (c:Certification {name: 'Anesthesia Management'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2022-03-20'), expiryDate: date('2025-03-20')}]->(c);

MATCH (s:Staff {staffId: 'S012'}), (c:Certification {name: 'Robotic Surgery Certification'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2020-09-10'), expiryDate: date('2025-09-10')}]->(c);

MATCH (s:Staff {staffId: 'S013'}), (c:Certification {name: 'Basic Life Support (BLS)'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2023-05-22'), expiryDate: date('2025-05-22')}]->(c);

MATCH (s:Staff {staffId: 'S014'}), (c:Certification {name: 'Basic Life Support (BLS)'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2022-12-18'), expiryDate: date('2024-12-18')}]->(c);

MATCH (s:Staff {staffId: 'S015'}), (c:Certification {name: 'Pediatric Advanced Life Support (PALS)'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2023-02-28'), expiryDate: date('2025-02-28')}]->(c);

MATCH (s:Staff {staffId: 'S016'}), (c:Certification {name: 'Pediatric Advanced Life Support (PALS)'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2022-08-14'), expiryDate: date('2024-08-14')}]->(c);

MATCH (s:Staff {staffId: 'S017'}), (c:Certification {name: 'Basic Life Support (BLS)'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2023-06-05'), expiryDate: date('2025-06-05')}]->(c);

MATCH (s:Staff {staffId: 'S018'}), (c:Certification {name: 'Advanced Cardiovascular Life Support (ACLS)'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2022-04-12'), expiryDate: date('2024-04-12')}]->(c);

MATCH (s:Staff {staffId: 'S019'}), (c:Certification {name: 'Basic Life Support (BLS)'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2023-07-20'), expiryDate: date('2025-07-20')}]->(c);

MATCH (s:Staff {staffId: 'S020'}), (c:Certification {name: 'MRI Machine Operation'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2022-11-08'), expiryDate: date('2025-11-08')}]->(c);

MATCH (s:Staff {staffId: 'S021'}), (c:Certification {name: 'Radiation Therapy Certification'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2021-05-15'), expiryDate: date('2025-05-15')}]->(c);

MATCH (s:Staff {staffId: 'S022'}), (c:Certification {name: 'Basic Life Support (BLS)'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2023-03-10'), expiryDate: date('2025-03-10')}]->(c);

MATCH (s:Staff {staffId: 'S023'}), (c:Certification {name: 'Basic Life Support (BLS)'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2022-10-25'), expiryDate: date('2024-10-25')}]->(c);

MATCH (s:Staff {staffId: 'S024'}), (c:Certification {name: 'Advanced Cardiovascular Life Support (ACLS)'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2022-06-18'), expiryDate: date('2024-06-18')}]->(c);

MATCH (s:Staff {staffId: 'S025'}), (c:Certification {name: 'Basic Life Support (BLS)'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2023-04-22'), expiryDate: date('2025-04-22')}]->(c);

MATCH (s:Staff {staffId: 'S028'}), (c:Certification {name: 'Laboratory Technology Certification'})
CREATE (s)-[:CERTIFIED_FOR {certificationDate: date('2021-09-15'), expiryDate: date('2024-09-15')}]->(c);

// --- STAFF → ASSIGNED_TO_SHIFT → SHIFT ---
MATCH (s:Staff {staffId: 'S001'}), (sh:Shift {shiftId: 'SH001'})
CREATE (s)-[:ASSIGNED_TO_SHIFT]->(sh);

MATCH (s:Staff {staffId: 'S002'}), (sh:Shift {shiftId: 'SH001'})
CREATE (s)-[:ASSIGNED_TO_SHIFT]->(sh);

MATCH (s:Staff {staffId: 'S003'}), (sh:Shift {shiftId: 'SH002'})
CREATE (s)-[:ASSIGNED_TO_SHIFT]->(sh);

MATCH (s:Staff {staffId: 'S005'}), (sh:Shift {shiftId: 'SH001'})
CREATE (s)-[:ASSIGNED_TO_SHIFT]->(sh);

MATCH (s:Staff {staffId: 'S006'}), (sh:Shift {shiftId: 'SH002'})
CREATE (s)-[:ASSIGNED_TO_SHIFT]->(sh);

MATCH (s:Staff {staffId: 'S008'}), (sh:Shift {shiftId: 'SH001'})
CREATE (s)-[:ASSIGNED_TO_SHIFT]->(sh);

MATCH (s:Staff {staffId: 'S009'}), (sh:Shift {shiftId: 'SH002'})
CREATE (s)-[:ASSIGNED_TO_SHIFT]->(sh);

MATCH (s:Staff {staffId: 'S011'}), (sh:Shift {shiftId: 'SH001'})
CREATE (s)-[:ASSIGNED_TO_SHIFT]->(sh);

MATCH (s:Staff {staffId: 'S012'}), (sh:Shift {shiftId: 'SH004'})
CREATE (s)-[:ASSIGNED_TO_SHIFT]->(sh);

MATCH (s:Staff {staffId: 'S013'}), (sh:Shift {shiftId: 'SH001'})
CREATE (s)-[:ASSIGNED_TO_SHIFT]->(sh);

MATCH (s:Staff {staffId: 'S015'}), (sh:Shift {shiftId: 'SH001'})
CREATE (s)-[:ASSIGNED_TO_SHIFT]->(sh);

MATCH (s:Staff {staffId: 'S016'}), (sh:Shift {shiftId: 'SH002'})
CREATE (s)-[:ASSIGNED_TO_SHIFT]->(sh);

MATCH (s:Staff {staffId: 'S018'}), (sh:Shift {shiftId: 'SH001'})
CREATE (s)-[:ASSIGNED_TO_SHIFT]->(sh);

MATCH (s:Staff {staffId: 'S019'}), (sh:Shift {shiftId: 'SH002'})
CREATE (s)-[:ASSIGNED_TO_SHIFT]->(sh);

MATCH (s:Staff {staffId: 'S021'}), (sh:Shift {shiftId: 'SH001'})
CREATE (s)-[:ASSIGNED_TO_SHIFT]->(sh);

MATCH (s:Staff {staffId: 'S022'}), (sh:Shift {shiftId: 'SH002'})
CREATE (s)-[:ASSIGNED_TO_SHIFT]->(sh);

MATCH (s:Staff {staffId: 'S024'}), (sh:Shift {shiftId: 'SH001'})
CREATE (s)-[:ASSIGNED_TO_SHIFT]->(sh);

MATCH (s:Staff {staffId: 'S025'}), (sh:Shift {shiftId: 'SH002'})
CREATE (s)-[:ASSIGNED_TO_SHIFT]->(sh);

// --- FACILITY → HAS_ACCESS_TO → EQUIPMENT ---
MATCH (f:Facility {facilityId: 'F005'}), (e:Equipment {equipmentId: 'E010'})
CREATE (f)-[:HAS_ACCESS_TO]->(e);

MATCH (f:Facility {facilityId: 'F006'}), (e:Equipment {equipmentId: 'E010'})
CREATE (f)-[:HAS_ACCESS_TO]->(e);

MATCH (f:Facility {facilityId: 'F007'}), (e:Equipment {equipmentId: 'E010'})
CREATE (f)-[:HAS_ACCESS_TO]->(e);

MATCH (f:Facility {facilityId: 'F008'}), (e:Equipment {equipmentId: 'E011'})
CREATE (f)-[:HAS_ACCESS_TO]->(e);

MATCH (f:Facility {facilityId: 'F005'}), (e:Equipment {equipmentId: 'E012'})
CREATE (f)-[:HAS_ACCESS_TO]->(e);

MATCH (f:Facility {facilityId: 'F006'}), (e:Equipment {equipmentId: 'E012'})
CREATE (f)-[:HAS_ACCESS_TO]->(e);

MATCH (f:Facility {facilityId: 'F012'}), (e:Equipment {equipmentId: 'E001'})
CREATE (f)-[:HAS_ACCESS_TO]->(e);

MATCH (f:Facility {facilityId: 'F013'}), (e:Equipment {equipmentId: 'E002'})
CREATE (f)-[:HAS_ACCESS_TO]->(e);

MATCH (f:Facility {facilityId: 'F014'}), (e:Equipment {equipmentId: 'E003'})
CREATE (f)-[:HAS_ACCESS_TO]->(e);

MATCH (f:Facility {facilityId: 'F001'}), (e:Equipment {equipmentId: 'E014'})
CREATE (f)-[:HAS_ACCESS_TO]->(e);

MATCH (f:Facility {facilityId: 'F002'}), (e:Equipment {equipmentId: 'E014'})
CREATE (f)-[:HAS_ACCESS_TO]->(e);

MATCH (f:Facility {facilityId: 'F020'}), (e:Equipment {equipmentId: 'E006'})
CREATE (f)-[:HAS_ACCESS_TO]->(e);

MATCH (f:Facility {facilityId: 'F018'}), (e:Equipment {equipmentId: 'E020'})
CREATE (f)-[:HAS_ACCESS_TO]->(e);

MATCH (f:Facility {facilityId: 'F019'}), (e:Equipment {equipmentId: 'E021'})
CREATE (f)-[:HAS_ACCESS_TO]->(e);

// --- DEPARTMENT → SHARES_RESOURCES_WITH → DEPARTMENT ---
MATCH (d1:Department {departmentId: 'D001'}), (d2:Department {departmentId: 'D004'})
CREATE (d1)-[:SHARES_RESOURCES_WITH {resourceType: 'Staff', since: date('2022-01-15')}]->(d2);

MATCH (d1:Department {departmentId: 'D002'}), (d2:Department {departmentId: 'D003'})
CREATE (d1)-[:SHARES_RESOURCES_WITH {resourceType: 'Equipment', since: date('2021-06-10')}]->(d2);

MATCH (d1:Department {departmentId: 'D001'}), (d2:Department {departmentId: 'D005'})
CREATE (d1)-[:SHARES_RESOURCES_WITH {resourceType: 'Facilities', since: date('2022-08-20')}]->(d2);

MATCH (d1:Department {departmentId: 'D004'}), (d2:Department {departmentId: 'D006'})
CREATE (d1)-[:SHARES_RESOURCES_WITH {resourceType: 'Equipment', since: date('2021-03-12')}]->(d2);

MATCH (d1:Department {departmentId: 'D007'}), (d2:Department {departmentId: 'D003'})
CREATE (d1)-[:SHARES_RESOURCES_WITH {resourceType: 'Equipment', since: date('2020-11-08')}]->(d2);

MATCH (d1:Department {departmentId: 'D008'}), (d2:Department {departmentId: 'D004'})
CREATE (d1)-[:SHARES_RESOURCES_WITH {resourceType: 'Staff', since: date('2021-09-15')}]->(d2);

// Additional cross-department connections for unified network
MATCH (d1:Department {departmentId: 'D003'}), (d2:Department {departmentId: 'D002'})
CREATE (d1)-[:SHARES_RESOURCES_WITH {resourceType: 'Imaging Equipment', since: date('2021-03-15')}]->(d2);

MATCH (d1:Department {departmentId: 'D003'}), (d2:Department {departmentId: 'D004'})
CREATE (d1)-[:SHARES_RESOURCES_WITH {resourceType: 'Imaging Support', since: date('2020-08-20')}]->(d2);

MATCH (d1:Department {departmentId: 'D003'}), (d2:Department {departmentId: 'D007'})
CREATE (d1)-[:SHARES_RESOURCES_WITH {resourceType: 'Imaging & Radiation', since: date('2020-11-08')}]->(d2);

MATCH (d1:Department {departmentId: 'D002'}), (d2:Department {departmentId: 'D004'})
CREATE (d1)-[:SHARES_RESOURCES_WITH {resourceType: 'Cardiac Surgical Support', since: date('2021-05-10')}]->(d2);

MATCH (d1:Department {departmentId: 'D006'}), (d2:Department {departmentId: 'D003'})
CREATE (d1)-[:SHARES_RESOURCES_WITH {resourceType: 'Neuroimaging', since: date('2021-01-25')}]->(d2);

MATCH (d1:Department {departmentId: 'D008'}), (d2:Department {departmentId: 'D003'})
CREATE (d1)-[:SHARES_RESOURCES_WITH {resourceType: 'Orthopedic Imaging', since: date('2021-07-12')}]->(d2);

MATCH (d1:Department {departmentId: 'D001'}), (d2:Department {departmentId: 'D003'})
CREATE (d1)-[:SHARES_RESOURCES_WITH {resourceType: 'Emergency Imaging', since: date('2020-06-18')}]->(d2);

// --- EQUIPMENT → HAS_MAINTENANCE → MAINTENANCE_RECORD ---
MATCH (e:Equipment {equipmentId: 'E001'}), (m:MaintenanceRecord {recordId: 'M001'})
CREATE (e)-[:HAS_MAINTENANCE]->(m);

MATCH (e:Equipment {equipmentId: 'E002'}), (m:MaintenanceRecord {recordId: 'M002'})
CREATE (e)-[:HAS_MAINTENANCE]->(m);

MATCH (e:Equipment {equipmentId: 'E003'}), (m:MaintenanceRecord {recordId: 'M003'})
CREATE (e)-[:HAS_MAINTENANCE]->(m);

MATCH (e:Equipment {equipmentId: 'E004'}), (m:MaintenanceRecord {recordId: 'M004'})
CREATE (e)-[:HAS_MAINTENANCE]->(m);

MATCH (e:Equipment {equipmentId: 'E005'}), (m:MaintenanceRecord {recordId: 'M005'})
CREATE (e)-[:HAS_MAINTENANCE]->(m);

MATCH (e:Equipment {equipmentId: 'E006'}), (m:MaintenanceRecord {recordId: 'M006'})
CREATE (e)-[:HAS_MAINTENANCE]->(m);

MATCH (e:Equipment {equipmentId: 'E007'}), (m:MaintenanceRecord {recordId: 'M007'})
CREATE (e)-[:HAS_MAINTENANCE]->(m);

MATCH (e:Equipment {equipmentId: 'E010'}), (m:MaintenanceRecord {recordId: 'M008'})
CREATE (e)-[:HAS_MAINTENANCE]->(m);

MATCH (e:Equipment {equipmentId: 'E014'}), (m:MaintenanceRecord {recordId: 'M009'})
CREATE (e)-[:HAS_MAINTENANCE]->(m);

MATCH (e:Equipment {equipmentId: 'E015'}), (m:MaintenanceRecord {recordId: 'M010'})
CREATE (e)-[:HAS_MAINTENANCE]->(m);

MATCH (e:Equipment {equipmentId: 'E020'}), (m:MaintenanceRecord {recordId: 'M011'})
CREATE (e)-[:HAS_MAINTENANCE]->(m);

MATCH (e:Equipment {equipmentId: 'E023'}), (m:MaintenanceRecord {recordId: 'M012'})
CREATE (e)-[:HAS_MAINTENANCE]->(m);

// ==========================================
// 5. VERIFICATION QUERIES
// ==========================================

// Count all nodes
MATCH (n) RETURN count(n) AS TotalNodes;

// Count all relationships
MATCH ()-[r]->() RETURN count(r) AS TotalRelationships;

// Show node type distribution
MATCH (n) RETURN labels(n)[0] AS NodeType, count(n) AS Count ORDER BY Count DESC;

// Show relationship type distribution
MATCH ()-[r]->() RETURN type(r) AS RelationshipType, count(r) AS Count ORDER BY Count DESC;
