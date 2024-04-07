MERISKILL PROJECT 1:

Purpose:

         Analyze sales data to identify trends, top-selling products, and revenue metrics for business decision-making.


Description: 
       
          In this project, you will dive into a large sales dataset to extract valuable insights. 

Things to look for :
1. Sales trends over time.
2. Identifying the best selling products.
3. Calculate revenue metrics such as total sales, profit margins and sales quantity.
4. Create visualizations to derive insights from large datasets to make data driven recommendations for optimizing sales strategies.


Dataset:

Dataset consisted of 185950 rows .
Dataset was clean enough to load to power bi and start the analysis there.
Downloaded the dataset.

Transform Data:

Uploaded the dataset to Power Bi and transformed the data.

Data at this point got loaded into power query where I could make the changes needed in the dataset.

Changed the column headers by clicking ' Use First Row as Headers'.

Navigated to Transform tab and selected 'Detect Data Type'. This action will automatically identify the data type of each column and convert them as needed.

Changed the 'Order Date' column into separate column of Date and Time. Selected the desired column and then selected the split column option and gave space as delimeter.

Then clicked on Close & Apply. 
Data was now loaded into Power BI and could be used for visualizations.


Visualization of Data:

Created a Line chart to show Sales By Month.

Created a Tree map to show Top 5 Products by Sales .

Created a Stacked Bar Chart to show Top 5 Best Selling Products.

Created a Map to show Sum of Sales by City.

Created a Column chart to show weekly sales distribution by weekday.

Added Slicers to create a list for Month and Day.

Added Slicers to create a drop down list for City and Product.

Created a Table to show Product and Sum of Price Each.

Created a Slicer for Product Sales.

Created Card visualization type to show the Revenue, Sales Quantity and Profit Margin.

To calculate the Profit Margin used the formula

PM = (([TOTAL SALES] - [TOTAL COST])/[TOTAL SALES])*100

Created DAX calculation for PM. Clicked on New measure and type the formula: TOTAL COST = SUM('Sales Data'[Price Each])
         TOTAL SALES = SUM('Sales Data'[Sales])


Key Insights: 

Total Revenue is approximately 34,492K

Total Sales quantity is 209.08K

Profit Margin is 58.83%

Top 5 Products by sales are Macbook Pro laptop, ThinkPad laptop, Iphone, Google phone and Vareebadd Phone.

Top 5 best selling products by count are AAA Batteries, AA Batteries, USB-C charging cable, Lightning Charging cable and Wired Headphones.

December 2019 witnessed the highest sales, totalling $4.6 million, making it the peak sales period.














