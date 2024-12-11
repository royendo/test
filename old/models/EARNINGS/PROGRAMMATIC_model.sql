-- Model SQL
-- Reference documentation: https://docs.rilldata.com/reference/project-files/models

select 
    TRIM(SPLIT_PART(Time, '/', 1))::DATE AS date,
 --   TRIM(SPLIT_PART(Time, '/', 2))::DATE AS end_date,
    "Publisher",   "Sales Channel Type", "Sales Channel ID", "Sales Channel", "Net Revenue (USD)", "Impressions"
  
  from RILL_TEST___PROGRAMMATIC