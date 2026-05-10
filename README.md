# 🛍️ Customer Behavior Analysis

> End-to-end retail customer behavior analysis using Python, PostgreSQL & Power BI. Covers data cleaning, feature engineering, SQL-based aggregations, and an interactive dashboard. Key insights: loyalty segmentation, revenue by demographics, discount effectiveness & subscription gaps. Dataset: 3,900 customers, 18 variables.

---

## 📁 Project Structure

```
customer-behavior-analysis/
│
├── customer_shopping_behavior.csv       # Raw dataset (3,900 records, 18 variables)
├── DA_project_1.ipynb                   # Data cleaning & feature engineering (Python)
├── customer_behavior.sql                # SQL queries for analysis (PostgreSQL)
├── customer_behavior_dashboard.pbix     # Interactive Power BI dashboard
├── Customer_Behavior_Analysis.docx      # Full analytics report
└── README.md
```

---

## 📊 Dataset

The dataset contains **3,900 customer transaction records** with the following key attributes:

| Variable | Description |
|---|---|
| Age | Customer age (18–70) |
| Gender | Male / Female |
| Item Purchased | 25 unique product types |
| Category | Clothing, Accessories, Footwear, Outerwear |
| Purchase Amount (USD) | Transaction value ($20–$100) |
| Review Rating | Product rating (2.5–5.0) |
| Subscription Status | Active subscription (Yes / No) |
| Shipping Type | Standard, Express, Free, etc. |
| Discount Applied | Discount used (Yes / No) |
| Previous Purchases | Number of prior orders (1–50) |
| Payment Method | PayPal, Credit Card, Cash, Venmo, Debit Card |
| Frequency of Purchases | Weekly to Annually |

---

## 🔧 Tools & Stack

- **Python** (Pandas, NumPy) — data cleaning, feature engineering, EDA
- **PostgreSQL** — aggregate queries, segmentation, window functions
- **Power BI** — interactive dashboard and visualizations
- **Jupyter Notebook** — exploratory analysis workflow
- **SQLAlchemy** — Python-to-PostgreSQL data pipeline

---

## 🧹 Data Preprocessing (`DA_project_1.ipynb`)

- Imputed missing **Review Rating** values using category-level means (37 records)
- Standardized column names to `snake_case`
- Engineered **age_group** using quantile-based binning (Young Adult → Senior)
- Mapped **purchase frequency** to numeric days (e.g. Weekly = 7, Monthly = 30)
- Dropped `promo_code_used` — confirmed perfect duplicate of `discount_applied`
- Exported cleaned data to PostgreSQL via SQLAlchemy for SQL analysis

---

## 🗄️ SQL Analysis (`customer_behavior.sql`)

Key queries include:

- **Revenue by gender** — `SUM(purchase_amount) GROUP BY gender`
- **High-value discount customers** — above-average spenders who used a discount
- **Top 5 products by review rating** — `AVG(review_rating)` per item
- **Shipping type vs. purchase amount** — Standard vs. Express comparison
- **Subscription performance** — revenue, customer count, and average spend
- **Discount rates per item** — percentage of discounted transactions by product
- **Customer segmentation** — CTE-based NEW / RETURNING / LOYAL classification
- **Top 3 items per category** — `ROW_NUMBER()` window function
- **Loyal customers by subscription** — cross-tab of retention vs. subscription
- **Revenue by age group** — spend distribution across life stages

---

## 📈 Key Findings

| Metric | Value |
|---|---|
| Total Revenue | $233,081 |
| Average Spend per Customer | $59.76 |
| Average Review Rating | 3.75 / 5.0 |
| Loyal Customers (>10 purchases) | 79.9% |
| Subscription Rate | 27.0% |
| Top Revenue Category | Clothing (44.7%) |
| Top Revenue Age Group | 56+ ($65,256) |
| Highest-Rated Product | Gloves (3.86) |

### Revenue Highlights
- **Male customers** generate 2.1× more revenue than female customers
- **Clothing** dominates at 44.7% of total revenue; Outerwear is weakest at 7.9%
- **Fall** is the highest-revenue season; Summer is the lowest
- Revenue is nearly equal across all 7 purchase frequency tiers

### Customer Segments
- **79.9% LOYAL** (>10 purchases) — strong retention base
- **18.0% RETURNING** (2–10 purchases)
- **2.1% NEW** (1 purchase) — low acquisition rate is a key risk

### Discount & Shipping Insights
- Discounted customers spend **$0.85 less** on average than non-discounted — discounts aren't driving higher basket sizes
- Express shipping correlates with **$2.02 higher** average spend vs. Standard
- Payment methods are nearly evenly split across PayPal, Credit Card, Cash, Venmo, and Debit Card

---

## 💡 Recommendations

1. **Convert loyal non-subscribers** — 2,247 loyal customers have no subscription; targeted offers could significantly grow subscription revenue
2. **Invest in new customer acquisition** — only 83 new customers (~2%) signals a top-of-funnel gap
3. **Revise discount strategy** — replace broad discounts with loyalty-based perks (free shipping, points) since discounts don't increase spend
4. **Double down on the 56+ segment** — highest-revenue group; UX and trust optimizations could further lift spending
5. **Promote Accessories** — highest customer satisfaction ratings but underrepresented in revenue; bundle with Clothing purchases
6. **Seasonal promotions** — revenue is flat across seasons; limited-edition campaigns could spike Summer performance

---

## 🚀 Getting Started

### Prerequisites
```bash
pip install pandas numpy sqlalchemy psycopg2-binary jupyter
```

### Run the Notebook
```bash
jupyter notebook DA_project_1.ipynb
```

### Set Up PostgreSQL
Update the connection string in the notebook:
```python
engine = create_engine('postgresql+psycopg2://<user>:<password>@localhost:5432/customer_behavior')
```
Then run the SQL queries in `customer_behavior.sql` using pgAdmin or any PostgreSQL client.

### Power BI Dashboard
Open `customer_behavior_dashboard.pbix` in **Power BI Desktop**. Reconnect the data source to your local CSV or PostgreSQL instance if prompted.

---

## 📄 Report

A full written report (`Customer_Behavior_Analysis.docx`) is included, covering all findings, data tables, and strategic recommendations across 10 sections.

---

## 📜 License

This project is intended for educational and portfolio purposes.
