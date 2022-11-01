library(dplyr)
library(tidyr)

mpi <- readxl::read_excel(here::here("not_used", "2022_mpi_statistical_data_table_1_and_2_en.xlsx"),
                                     sheet = 1,
                                     col_names = FALSE,
                                     col_types = NULL,
                                     na = c("—", "\\.\\.", ""),
                                     trim_ws = TRUE,
                                     skip = 6,
                                     n_max = 122)

names(mpi) <- c("country", "note_na", "mpi_yr|mpi_survey", "note1", "mpi_value", "note2",
                "headcount%", "note3", "intensity%", "note4", "n_poor_survey_yr_1000s", "note5",
                "n_poor_2020_1000s", "note6", "inequality_among_poor", "note7", "severe_mp%",
                "note8", "vulnerable_mp%", "note9", "health%", "note10", "education%", "note11", 
                "std_living%", "note12", "below_npl_2009_2020%", "note13", "below_1.90_2009_2021%")

mpi2 <- mpi |> 
  separate(`mpi_yr|mpi_survey`, into = c("mpi_yr", "mpi_survey"), sep = " ") |> 
  filter(country %in% c("Congo", "Ghana", "Kenya", "Malawi", "Morocco", "South Africa",
                        "Tanzania (United Republic of)", "Zambia", "Egypt"))
