#(94) Calculate YoY% Budget growth ?
WITH YearlyBudget AS (
    SELECT
        Year,
        SUM(Budget) AS Total_Budget
    FROM boxoffice
    GROUP BY Year
)

SELECT
    Year,
    Total_Budget,
    LAG(Total_Budget) OVER (ORDER BY Year) AS Previous_Year_Budget,
    ROUND(
        (
            (Total_Budget -
            LAG(Total_Budget) OVER (ORDER BY Year))
            /
            LAG(Total_Budget) OVER (ORDER BY Year)
        ) * 100,
        2
    ) AS YoY_Budget_Growth_Percentage
FROM YearlyBudget
ORDER BY Year;


#(95) Calculate YoY% Worldwide total collelctions growth ?
WITH YearlyWorldwide AS (
    SELECT
        Year,
        SUM(Worldwide_Collection_in_Crores) AS Total_Worldwide_Collection
    FROM boxoffice
    GROUP BY Year
)

SELECT
    Year,
    Total_Worldwide_Collection,
    
    LAG(Total_Worldwide_Collection)
        OVER (ORDER BY Year) AS Previous_Year_Collection,

    ROUND(
        (
            (
                Total_Worldwide_Collection -
                LAG(Total_Worldwide_Collection)
                    OVER (ORDER BY Year)
            )
            /
            LAG(Total_Worldwide_Collection)
                OVER (ORDER BY Year)
        ) * 100,
        2
    ) AS YoY_Worldwide_Growth_Percentage

FROM YearlyWorldwide
ORDER BY Year;


#(96) Calculate YoY% Indian Gross colelctions growth ?          
WITH YearlyIndiaGross AS (
    SELECT
        Year,
        SUM(India_Gross_Collection) AS Total_India_Gross
    FROM boxoffice
    GROUP BY Year
)

SELECT
    Year,
    Total_India_Gross,

    LAG(Total_India_Gross)
        OVER (ORDER BY Year) AS Previous_Year_India_Gross,

    ROUND(
        (
            (
                Total_India_Gross -
                LAG(Total_India_Gross)
                    OVER (ORDER BY Year)
            )
            /
            LAG(Total_India_Gross)
                OVER (ORDER BY Year)
        ) * 100,
        2
    ) AS YoY_India_Gross_Growth_Percentage

FROM YearlyIndiaGross
ORDER BY Year;
