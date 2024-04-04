
# data and initial inspection

pharma_df <- read.csv("data/Pharmaceutical Drug Spending.csv", stringsAsFactors = T)

summary(pharma_df)

library(dplyr)

sub_pharma_df <- pharma_df %>% 
  filter(LOCATION %in% c("KOR","FIN","AUS")) %>% 
  mutate(LOCATION = factor(LOCATION))

summary(sub_pharma_df)

# crosstable

library(crosstable)

sub_pharma_df$PC_HEALTHXP <- set_label(sub_pharma_df$PC_HEALTHXP, "Per Capita Health Exp.")
sub_pharma_df$PC_GDP <- set_label(sub_pharma_df$PC_GDP, "Per Capita GDP")
sub_pharma_df$USD_CAP <- set_label(sub_pharma_df$USD_CAP, "USD Capital")
sub_pharma_df$FLAG_CODES <- set_label(sub_pharma_df$FLAG_CODES, "Flag Codes")
sub_pharma_df$TOTAL_SPEND <- set_label(sub_pharma_df$TOTAL_SPEND, "Total Spending")

crosstable(sub_pharma_df, cols = c(PC_HEALTHXP:TOTAL_SPEND), 
           by = LOCATION, 
           total="row", 
           percent_pattern="{n} ({p_row})",
           percent_digits=2, 
           test = FALSE) %>%
  as_flextable(
    header_show_n = TRUE, header_show_n_pattern=list(cell="{.col} (N={.n})"),
    compact = TRUE,
    fontsizes = list(body = 9, subheaders = 10, header = 10)
  ) %>% flextable::save_as_docx( path = "sub farma summary.docx")

# smart EDA

library(DataExplorer)

create_report(sub_pharma_df)

# psych

library(psych)

describe(sub_pharma_df)
describe(sub_pharma_df, omit = T)
describe(sub_pharma_df ~ LOCATION)

# dlookr

library(dlookr)

eda_web_report(sub_pharma_df)


# Model output

library(plm)

data(penguins, package = "palmerpenguins")

model1 <- plm(body_mass_g ~ bill_length_mm + bill_depth_mm, data=penguins, index=c("island", "year"), model="within")
model2 <- plm(body_mass_g ~ bill_length_mm + bill_depth_mm + flipper_length_mm, data=penguins, index=c("island", "year"), model="within")
model3 <- plm(body_mass_g ~ bill_length_mm + bill_depth_mm + flipper_length_mm + species, data=penguins, index=c("island", "year"), model="within")

library(stargazer)

stargazer(model1, model2, model3,
          type = "text", 
          header = FALSE, 
          dep.var.labels = "Body Mass (in Grams)",
          column.labels = c("Model 1", "Model 2", "Final Model"), 
          covariate.labels = c("Bill Length (in mm)", "Bill Depth (in mm)", 
                               "Flipper Length (in mm)", "Species: Chinstrap", "Species: Gentoo"),
          out = "Model.html")
