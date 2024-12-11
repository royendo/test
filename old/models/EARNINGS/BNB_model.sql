-- Model SQL
-- Reference documentation: https://docs.rilldata.com/reference/project-files/models

UNPIVOT "RILL_TEST___BNB"
on      "1/1/2024", "2/1/2024", "3/1/2024", "4/1/2024", 
        "5/1/2024", "6/1/2024", "7/1/2024", "8/1/2024",
        "9/1/2024", "10/1/2024", "11/1/2024", "12/1/2024"
INTO 
  NAME date
  VALUE sales