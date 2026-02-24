#  Marketing A/B Testing Analysis (SQL Project)

##  Project Overview
This project analyzes a **marketing A/B test experiment** to measure the **causal impact of advertising** on user conversions.  
Users were randomly split into two groups:
- **Ad group (treatment)** – users who saw advertisements  
- **PSA group (control)** – users who saw a public service announcement instead of ads  

The goal is to determine:
1. Whether advertising increases conversions  
2. How many ads should be shown (frequency)  
3. When ads should be shown (time optimization)

---

##  Dataset Description
The dataset represents a real-world A/B testing scenario with user-level data.

### Key Columns
- **user_id** – Unique user identifier  
- **test_group** – `ad` or `psa` (control)  
- **converted** – Whether the user made a purchase (TRUE/FALSE)  
- **total_ads** – Number of ads shown to the user  
- **most_ads_day** – Day with highest ad exposure  
- **most_ads_hour** – Hour with highest ad exposure  

> Note: This dataset simulates a real marketing experiment and is used to demonstrate analytical methodology and decision-making.

---

##  Analysis Workflow

### 1️⃣ Data Validation
- Checked missing values
- Validated logical ranges
- Verified group distribution

**Goal:** Ensure data quality before analysis.

---

### 2️⃣ A/B Conversion Analysis
Compared conversion rates between Ad and PSA groups.

**Results:**
- Ad conversion rate: **2.55%**
- PSA conversion rate: **1.79%**
- Conversion lift: **+0.77%**

**Conclusion:** Advertising increased conversions.

---

### 3️⃣ Statistical Significance
| Metric | Value |
|--------|-------|
| Z-Score | 8.66 |
| P-Value | < 0.00001 |
| 95% CI | [0.0059, 0.0094] |
| Verdict | Significant (p < 0.05) |
**Interpretation:** The 0.77% lift is REAL, not random chance.
---

### 4️⃣ Frequency Analysis (Ad Exposure)
Analyzed how conversion changes with the number of ads shown.

**Findings:**
- Low exposure (0–5 ads): very low conversion  
- Moderate exposure (10–15 ads): strong and stable performance  
- Very high exposure (21+ ads): inflated results due to **user self-selection bias**  

**Recommendation:**  
Apply a **frequency cap of 10–15 ads**.

---

### 5️⃣ Time Analysis (Day & Hour)
Analyzed when ads perform best.

**Findings:**
- Peak performance: **14:00 – 21:00**  
- Lowest performance: **00:00 – 06:00**  

**Recommendation:**  
Concentrate ad budget during afternoon and evening hours.

---

##  Final Recommendations
-  Continue advertising campaigns  
-  Apply a **frequency cap (10–15 ads)**  
-  Schedule ads mainly between **2 PM and 9 PM**  
-  Avoid interpreting very high exposure results without bias checks  

---

##  Key Takeaway
> Advertising works, but only when delivered at the **right frequency** and the **right time**.

---

# PROJECT FOLDER STRUCTURE
```
├── data/
│   └── marketing_.csv
│
├── sql/
│   ├── 01_data_validation.sql
│   ├── 02_ab_test_conversion.sql
│   ├── 03_statistical_significance.sql
│   ├── 04_frequency_analysis.sql
│   ├── 05_time_analysis.sql
│
├── README.md

```
---

##  Tools Used
- PostgreSQL (SQL analysis)  
- A/B testing methodology  
- Statistical reasoning  

---

## 👤 Author
**Muhiddin Axmadov**
