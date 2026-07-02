# Insurance-Analytics-Project
## Project Objective
The insurance company wants to analyse the insurance data to monitor premiums, claims, customer behaviour, payment status, and policy performance. It helps the company to make data-driven decisions and improve operational efficiency

## Dataset used
- <a href="https://github.com/micky-abraham/Insurance-Analytics-Project/blob/main/Policy%20Data.xlsx">Dataset</a>

## KPIs
- Total Policy
- Total Customers
- Age Bucket Wise Policy Count
- Gender wise Policy Count
- Policy Type wise Policy Count
- Policy Expire This Year
- Premium Growth Rate
- Claim Status wise Policy Count
- Payment Status wise Policy Count
- Total Claim Amount
- Claim Ratio

## Excel Dashboard
- <a href="https://github.com/micky-abraham/Insurance-Analytics-Project/blob/main/Insurance%20-%20Excel.xlsx">View Dashboard</a>

## Process
- Get data into **power query** for ETL
- Remove unwanted blank spaces and check datatype of each column and the data are correct
- Data modeling done in **power pivot** and pivot tables created
- Visuals and charts are merged into a single dashboard and **slicers** added

## Dashboard
<img width="1648" height="906" alt="Screenshot 2026-06-30 154458" src="https://github.com/user-attachments/assets/3d34c8e4-db16-4163-a238-fdb5ad10f94c" />

## Tableau Dashboard
- <a href="https://github.com/micky-abraham/Insurance-Analytics-Project/blob/main/Insurance%20-%20Tableau.twbx">View Dashboard</a>

## Process
- Data file imported and relationship established in **logical layer**
- Relationship between the tables eatsblished with common fields like ID's
- Datatype and null spaces are monitored and corrected
- Each KPI created in particular sheets and dragged them to create a single dahsboard
- **Parameters and measures** created along with Filters for smooth dynamic functioning

## Dashboard
<img width="1386" height="887" alt="Screenshot 2026-06-30 113520" src="https://github.com/user-attachments/assets/d13288a9-74ba-4d00-b2c7-58ad02b849e0" />

## MySQL Queries
- <a href="https://github.com/micky-abraham/Insurance-Analytics-Project/blob/main/Insurance%20-%20SQL.sql">View Dashboard</a>

## Process
- Database created and large datafiles imported using **load data infile** statement
- Proper datatype given for each field
- Data validation done by checking there are matching headers between each table 
- Queries for each KPI created using **select** statement to extract data 
- Values arranged in ascending or descenidng order

## Dashboard
<img width="1262" height="637" alt="Screenshot 2026-07-02 143945" src="https://github.com/user-attachments/assets/4db30af6-ffac-4877-a92e-24f028664cd3" />
<img width="1248" height="672" alt="Screenshot 2026-07-02 144012" src="https://github.com/user-attachments/assets/4299cc8e-c269-41bd-9236-f278cc70f328" />
<img width="1251" height="658" alt="Screenshot 2026-07-02 144042" src="https://github.com/user-attachments/assets/40f2fe78-dddc-44bd-9138-6d83db3a06a8" />

## Power BI Dashboard
- <a href="https://github.com/micky-abraham/Insurance-Analytics-Project/blob/main/Insurance%20-%20Power%20BI.pbix">View Dashboard</a>

## Process
- Import data to **power query** and check for null values and proper datatype
- Add cards and visuals for each KPI and arrange them neatly in the canvas
- Measures created for accurate results and avoiding mix up
- **Filters** added for the interactive dashboard

## Dashboard
<img width="1345" height="756" alt="Screenshot 2026-06-30 113911" src="https://github.com/user-attachments/assets/c114da8e-6d2c-4059-ab04-9648f14891ce" />

## Project Insights
- 28% of policies are held by customers aged 65+, highlighting a strong senior base
- Auto, Health, Life, and Property policies are evenly distributed (~25% each)
- Premium growth rates fluctuate sharply, with notable declines in 2022 (‑9%) and 2023 (‑7%)
- Payment failures are nearly equal to successes (49.7% vs 50.3%), signaling process inefficiency
- Claim ratio averages around 48–50%, requiring careful risk management

## Conclusion
The Insurance Dashboard highlights a strong senior customer base and a well‑balanced policy portfolio across Auto, Health, Life, and Property. Financial metrics reveal volatility in premium growth and a nearly equal split between successful and failed payments, signaling operational inefficiencies. Overall, the dashboard underscores the need for improved payment processes, renewal strategies, and risk management to stabilize growth and enhance customer retention
