# Prep data

# Select causes that are only at the level 3 hierarhcy
library(dplyr)
library(readxl)
library(tidyr)

file1 <- "data/IHME_GBD_2016_CODEBOOK/IHME_GBD_2016_CAUSE_HIERARCHY_Y2017M10D02.XLSX"
file2 <- "data/IHME-GBD_2016_DATA-80db26a0-1/IHME-GBD_2016_DATA-80db26a0-1.csv"
cause_hierarchy <- read_excel(file1)
burden <- read.csv(file2, stringsAsFactors = F)

# Join files
all_data <- burden %>% 
  left_join(cause_hierarchy) %>% 
  filter(level == 3)

# Capture cause family using the `cause_outline` column
all_data <- all_data %>% 
  mutate(cause_family = substr(cause_outline, 1, 1))

all_data$cause_family[all_data$cause_family == "A"] <- "Communicable"
all_data$cause_family[all_data$cause_family == "B"] <- "Non-communicable"
all_data$cause_family[all_data$cause_family == "C"] <- "Injuries"

# Only keep columns of interest
all_data <- all_data %>% 
  select(sex = sex_name, cause = cause_name, cause_family, val, metric = metric_name, measure = measure_name)

# Replace strings in measure_name column
all_data <- all_data %>% 
  mutate(measure = replace(measure, measure == "YLDs (Years Lived with Disability)", "ylds")) %>% 
  mutate(measure = replace(measure, measure == "DALYs (Disability-Adjusted Life Years)", "dalys")) %>% 
  mutate(measure = replace(measure, measure == "YLLs (Years of Life Lost)", "ylls")) %>% 
  mutate(measure = replace(measure, measure == "Deaths", "deaths"))

# Reshape wide for the metrics
wide_data <- all_data %>% 
  spread(measure, val)


# Write data
write.csv(wide_data, 'data/prepped_data.csv', row.names = F)