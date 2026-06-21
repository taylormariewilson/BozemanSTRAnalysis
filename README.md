# Bozeman Short-Term Rental Seasonality & Analysis
End-to-end market analysis optimizing Bozeman short-term rental performance. Uses SQL Server to clean raw data and isolate true booking demand, paired with an interactive Tableau dashboard delivering localized geographic insights, seasonality trends, and revenue optimization strategies for stakeholders.

**[View the Interactive Dashboard on Tableau Public](https://public.tableau.com/views/BozemanSTRAnalysis/BozemanSTR?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)**

---

## Summary

In highly seasonal short-term rental (STR) markets, a one-size-fits-all pricing and marketing strategy leads to missed revenue and empty beds. This project analyzes the localized spatial and temporal dynamics of the Bozeman, Montana short-term rental market to identify peak demand drivers and optimize inventory performance.

By isolating true booking demand from raw unbooked inventory, this interactive dashboard empowers property management stakeholders to make data-driven decisions on localized dynamic pricing, seasonal asset allocation, and market tier positioning.

---

## Tech Stack & Data Pipeline

* **SQL Server (SSMS):** Used for primary data extraction, schema cleaning, and demand-logic modeling to filter out unbooked inventory and isolate true user demand.
* **Tableau Public:** Engineered a multi-view interactive dashboard using dual-axis charts, map layer adjustments, and synchronous dashboard actions.
* **GitHub:** Repository hosting, sequential script version control, and documentation.

---

### 1. Market Macro-Seasonality (The Shoulder-Season Drop)

<img width="1920" height="1080" alt="BozemanSTRAnalysis" src="https://github.com/user-attachments/assets/64762799-8967-4b61-9821-7cca1b1c1591" />


**Insight:** Bozeman experiences a sharp market-wide drop in booking demand every April when local ski resorts close for the winter season and before Yellowstone opens its interior roads for the season.

**Business Recommendation:** Property managers should schedule deep cleans, property maintenance, and owner-blockout dates during April to minimize overhead. Pricing algorithms should be aggressively dropped to baseline minimums to capture the sparse, non-tourism regional travel traffic during this shoulder month.

### 2. Geography vs. Demand Stability (Downtown Core vs. Outer Corridors)

<img width="1900" height="474" alt="02_SouthBozeman" src="https://github.com/user-attachments/assets/10b9de6e-881e-4e9f-a179-927e92491aec" />
<i>Figure 1: South Bozeman</i>

<img width="1899" height="468" alt="02_DowntownBozeman" src="https://github.com/user-attachments/assets/c552a0b7-c40c-44a6-87d6-17a8485a45e6" />
<i>Figure 2: Downtown Bozeman</i>



**Insight:** While outer corridors (like South Bozeman) suffer from volatility based on Yellowstone road closures, Downtown Bozeman acts as a structural market stabilizer. Demand spikes in August and remains resilient through the December holiday season.

**Business Recommendation:** For risk-averse investors seeking predictable, year-round cash flow, the Downtown Core is the premier target. Operators in this zone should pivot marketing packages toward university families in the Fall and holiday travelers in Q4 to maximize shoulder-season yield.

### 3. Price Tier Dynamics (Yield vs. Utilization)

<img width="1898" height="521" alt="03_PriceTierDynamics" src="https://github.com/user-attachments/assets/27c916a5-bbc8-4e04-8c0a-a3188afe2e2e" />

**Insight:** Revenue and occupancy are inversely proportional across market tiers. The Ultra-Luxury ($1,000+/night) tier generates the highest raw annual revenue per unit but operates at a restrictive 39% occupancy rate. Conversely, the Budget (<$100/night) tier maintains a commanding 45% occupancy rate but produces the lowest overall revenue yield.

**Business Recommendation:** Portfolio optimization depends entirely on stakeholder strategy:

  **Yield Maximization:** Target Ultra-Luxury assets but prepare cash reserves to weather severe, low-occupancy dry spells.

  **Asset Utilization:** Target the Moderate/Premium tiers ($100–$399) where occupancy stays high enough to reliably cover fixed operational costs and cleaning fees year-round.

  ---

**Let's Connect:** If you have questions about the methodology, the backend SQL modeling, or want to discuss these findings, feel free to reach out to me via **[LinkedIn](http://www.linkedin.com/in/taylorwilson9280)** .
