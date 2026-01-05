SELECT *
  FROM bike_share_yr_1;

-- Alter datatype for the date column
ALTER TABLE [dbo].[bike_share_yr_0] ALTER COLUMN [season] INT;
ALTER TABLE [dbo].[bike_share_yr_0] ALTER COLUMN [yr] INT;
ALTER TABLE [dbo].[bike_share_yr_0] ALTER COLUMN [mnth] INT;
ALTER TABLE [dbo].[bike_share_yr_0] ALTER COLUMN [hr] INT;
ALTER TABLE [dbo].[bike_share_yr_0] ALTER COLUMN [weekday] INT;
ALTER TABLE [dbo].[bike_share_yr_0] ALTER COLUMN [riders] INT;

ALTER TABLE [dbo].[bike_share_yr_1] ALTER COLUMN [season] INT;
ALTER TABLE [dbo].[bike_share_yr_1] ALTER COLUMN [yr] INT;
ALTER TABLE [dbo].[bike_share_yr_1] ALTER COLUMN [mnth] INT;
ALTER TABLE [dbo].[bike_share_yr_1] ALTER COLUMN [hr] INT;
ALTER TABLE [dbo].[bike_share_yr_1] ALTER COLUMN [weekday] INT;
ALTER TABLE [dbo].[bike_share_yr_1] ALTER COLUMN [riders] INT;

-- Join both bike share tables using UNION. Use UNION ALL if you want to see duplicated rows
SELECT *
  FROM bike_share_yr_0
UNION
SELECT *
  FROM bike_share_yr_1;

-- To join the cost table with both share tables, convert the union of the share table into a CTE (Common Table Expression), then LEFT JOIN
WITH cte_table as (
SELECT *
  FROM bike_share_yr_0
UNION
SELECT *
  FROM bike_share_yr_1)

SELECT *
	FROM
  cte_table a
  LEFT JOIN cost_table b
  ON a.yr = b.yr;

-- Output without selecting every column in the cte table
WITH cte_table as (
SELECT *
  FROM bike_share_yr_0
UNION
SELECT *
  FROM bike_share_yr_1)

  SELECT 
  dteday,
  season,
  a.yr,
  weekday,
  hr,
  rider_type,
  riders,
  price,
  COGS,
  riders*price as revenue,
  riders*(price - COGS) as profit

FROM
  cte_table a
  LEFT JOIN cost_table b
  ON a.yr = b.yr;

  -- DAX expressions were used in power BI during the process of the task.
