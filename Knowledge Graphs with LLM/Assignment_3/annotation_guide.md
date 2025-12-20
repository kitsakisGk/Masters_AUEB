# Evaluation Dataset Annotation Guide

## Overview
This guide will help you manually annotate the evaluation dataset for Assignment 3.

## Your Task
For each of the 12 texts in `evaluation_dataset.json`, you need to fill in the `ground_truth` section with:
1. **Equipment** entities (medical devices, machines, equipment)
2. **Department** entities (hospital departments, units, clinical services)

## Annotation Rules

### Equipment Entities
Extract **exact terms** from the text that refer to medical equipment, including:
- Imaging devices (MRI machine, CT scanner, X-ray machine, ultrasound)
- Surgical equipment (da Vinci robot, surgical robot, anesthesia machine)
- Life support (ventilator, infusion pump, patient monitor)
- Diagnostic devices (ECG monitor, defibrillator, endoscopy equipment)
- Therapeutic equipment (hemodialysis machine, linear accelerator)

**Examples:**
- ✅ "CT scanner", "MRI machine", "ventilator", "da Vinci 5 robotic surgical system"
- ✅ Include variations: "CT equipment", "CT unit", "CT scanner" are all valid
- ❌ Don't include general terms like "equipment", "technology", "system" alone

### Department Entities
Extract **exact terms** from the text that refer to hospital departments/units, including:
- Clinical departments (Cardiology, Radiology, Neurology, Oncology)
- Service units (Emergency Department, ICU, Operating Room, Diagnostic Imaging)
- Specialized units (Interventional Radiology, Post-Anesthesia Care Unit)

**Examples:**
- ✅ "Emergency Department", "Cardiology", "ICU", "Radiology", "Surgery"
- ✅ Include full names: "Diagnostic Imaging department", "Interventional Radiology suite"
- ❌ Don't include: "hospital", "facility", "center" alone (unless part of department name)

## Annotation Format

For each text, list the entities **as they appear in the text** (preserve capitalization and phrasing):

```json
{
  "id": 1,
  "ground_truth": {
    "Equipment": [
      "photon-counting computed tomography",
      "CT scanner",
      "conventional scanners"
    ],
    "Department": [
      "Chao Family Comprehensive Cancer Center",
      "oncology",
      "neurosciences",
      "digestive health",
      "orthopedic services"
    ]
  }
}
```

## Example Annotation

**Text 1** (UCI Health):
```
"UCI Health has become the first Southern California health system to deploy photon-counting computed tomography technology..."
```

**Annotated Equipment:**
- "photon-counting computed tomography technology" (or "photon-counting computed tomography")
- "conventional scanners"

**Annotated Departments:**
- "radiological sciences" (mentioned as Dr. Yaghmai's department)
- "oncology"
- "neurosciences"
- "digestive health"
- "orthopedic services"

## Tips

1. **Be Consistent**: If "CT scanner" appears multiple times, only list it once
2. **Extract Exact Phrases**: Use the exact wording from the text
3. **Include All Variations**: If text says "MRI" and "MRI machine", include both
4. **Department Names**: Include both short ("Radiology") and long forms ("Diagnostic Imaging department")
5. **Don't Infer**: Only extract what's explicitly mentioned in the text

## Next Steps

After you complete the annotations:
1. Save the updated `evaluation_dataset.json` file
2. Run the evaluation notebook cells to test the extractor
3. Calculate Precision and Recall metrics
4. Compare extractor output with your ground truth

---

**Need Help?**
- Texts 1-7 are based on real press releases (should be easier)
- Texts 8-12 are synthesized but realistic (for variety)
- When in doubt, include the entity (better to have false positives during annotation than miss entities)
