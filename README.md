# GROUP 6 - dillards-project

## Weekly updates

### Team members:
* Muhammet Ali Büyüknacar
* Zhiwei Gu
* Jialong (Mark) Li
* Siyan Li

### Week1 -> Oct.13

- Set up Github repo
- Connected to the NU resource servers
- Uploaded datasets into database schema
- Figured out SQL connection in Python
- Explored datasets in Python and R

  deptinfo: 60 rows, 2 columns

  skstinfo: 39230146 rows, 4 columns. There is no null values. For COST, mean 24.16, min 0.00, median 15.36, max 2700.00. For RETAIL, mean 43.33, min 0.00, median 24.50, max 6017.00.
  There are 3423 SKU with COST equals to 0, but when COST is 0, RETAIL might not be 0. The correlation between COST and RETAIL is 0.896.
  For difference between COST and RETAIL, mean 19.17, min -864.18, median 9.75, max 3977.46.

  skuinfo: include 8148 rows with extra columns. Since the number of rows with extra column is relatively small compared with total number of rows, it is reasonable to drop these.
  After dropping, there are 1556030 rows, 10 columns, there is no null values.

  strinfo: 453 rows, 4 columns


### Week2: -> Oct.20

- Brainstorm on business question
- Come up with ways to incorporate external data to enrich the dataset: state population data, weather, holiday, weekend
- Continue data exploration and data cleaning

  dept-sku: merge dept with sku dataset, perform exploration on each column. We generated bar plots to visualize the distribution of the number of rows within each DEPT, STYLE, COLOR, SIZE, VENDOR, and BRAND. Most of these bar plots skew to the right, with a majority of relatively low values with a few exceptionally high values. COLOR and SIZE column have many similar values, so they require further grouping if needed in the analysis.

  skstinfo: created histogram between number of SKU in each store, the distribution is relatively normal, the mean is 109888.36 and the median is 114042.00

  strinfo: merge with outside dataset on state region and division, find number of stores in each state, region, division. Most stores are in the South region.

  trnsact: sample 1/1000 from original dataset, column 9 and 10 are exactly the same, column 13 is binary without clear meaning, so drop column 10 and 13. Rename remaining columns, the order from the data schema is incorrect. Plot the relationship between ORIGPRICE and AMT, and the correlation is 0.80320634. In over 50% of cases, ORIPRICE > AMT, so calculate discount from AMT / ORIGPRICE. A minority of rows have AMT > ORIPRICE which requires further investigation. 

  

Jialong (Mark):  
**Explore Databricks**  

As a software-as-a-service (SaaS) platform, Databrick offers cost-effective and convenient data science solutions, rapidly becoming one of the leading cloud-based data warehousing platforms. Compared to Snowflake, Databrick seamlessly integrates with Apache Spark for large-scale data processing and provides well-around support for entire machine learning lifecycle [1]. Given that we have a large dataset, and machine learning methods are required to include in our project, Databrick might be an ideal tool for us to achieve our objectives.  

**Reference**  
[1] [Why use Databricks for machine learning and deep learning?](https://docs.databricks.com/en/machine-learning/index.html)


### Week3: -> Oct.27

- Narrow down business question
- Continue EDA on trnsact

