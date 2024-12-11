-- Model SQL
-- Reference documentation: https://docs.rilldata.com/reference/project-files/models

select CAST(strptime("Release Date", '%d-%b-%y') AS DATE) AS date,
  "Episode", "Downloads", 

  
  "Program Name"
  
  
  from RILL_TEST___Impressions_by_episode_total_