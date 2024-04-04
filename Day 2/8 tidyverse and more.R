
# all packages

tidyverse::tidyverse_packages(include_self = F)

# readr

library(readr)
readr::read_csv()  # . as decimal separator
readr::read_csv2()  # , as decimal separator

# readxl

readxl::read_xlsx()  # for xlsx
readxl::read_xls()   # for xls
readxl::read_excel() # for both types

# haven

haven::read_spss()
haven::read_stata()

# dplyr

library(dplyr)

df1 <- data.frame(id = 1:4, gender = c("M","M","F","F"), age = c(19, 19, 17, 24))
df2 <- data.frame(id = 5:8, gender = c("F", "M", "M", "F"), age = c(19, 17, 23, 20))
df3 <- df1 %>% 
  bind_rows(df2)

df3 %>% filter(age >= 18)
df3 %>% select(gender, age)
df3 %>% mutaet(age_in_months = age*12)
df3 %>% mutate(age_group = case_when(age < 18 ~ "< 18",
                                     age >= 18 & age <= 20 ~ "18 - 20",
                                     age >= 21 & age <= 24 ~ "21 - 24",
                                     .default = as.character(age)))

df3 %>% arrange(age)
df3 %>% arrange(desc(age))
df3 %>% arrange(gender, desc(age))

df3 %>% 
  group_by(gender) %>% 
  summarize(Average_age = mean(age)) 

# tidyr

idf <- read.csv("data/age and gender major age group.csv")
str(idf)

idf %>%
  tidyr::pivot_longer(cols = X2002:X2010, names_to = "Year", values_to = "Value") %>%
  mutate(Year = stringr::str_replace_all(Year, "X", "")) %>%
  group_by(Gender) %>%
  summarize(Value = sum(Value))

# ggplot2

library(ggplot2)

idf2 <- idf %>%
  tidyr::pivot_longer(cols = X2002:X2010, names_to = "Year", values_to = "Value") %>% 
  mutate(Year = stringr::str_replace_all(Year, "X", "")) %>% 
  group_by(Gender, Age.Group) %>% 
  summarize(Value = sum(Value))

ggplot(data = idf2, mapping = aes(x = Gender, y = Value, fill = Age.Group)) + 
  geom_col() +
  labs(x = NULL, y = "Value", fill = "Age group", title = "A simple bar plot") +
  theme_bw()

ggplot(idf2) + 
  geom_col(aes(x = Gender, y = Value, fill = Age.Group)) +
  labs(x = NULL, y = "Value", fill = "Age group",
       title = "A simple bar plot") +
  theme_bw() +
  # https://github.com/r-lib/scales?tab=readme-ov-file#breaks-and-labels
  scale_y_continuous(labels = scales::label_number(scale_cut = scales::cut_long_scale())) +
  scale_fill_manual(values=c("lightblue2", "sandybrown", "#0004A9")) 

# more on scales: https://bookdown.org/Maxine/ggplot2-maps/posts/2019-11-27-using-scales-package-to-modify-ggplot2-scale/
