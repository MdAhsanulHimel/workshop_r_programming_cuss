
# using palmerpenguins dataset from UCI Machine Learning Repository
# install.packages("palmerpenguins")

data(package = 'palmerpenguins')

data(penguins, package = "palmerpenguins")

str(penguins)

summary(penguins)

# Quick viz with GGally

library(GGally)
ggpairs(penguins, aes(colour = species), progress = TRUE) +
  theme_bw()

# Bar plot
ggplot(penguins)+
  geom_bar(aes(x=island))+
  labs(title = "Islands in Palmerpenguins Dataset")

ggplot(penguins)+
  geom_bar(aes(x=sex))+
  labs(title = "Sex of Penguins")

ggplot(penguins) +
  geom_bar(aes(x = island, fill = sex)) +
  labs(title = "Islands in Palmerpenguins Dataset")

ggplot(penguins) +
  geom_bar(aes(x = island)) +
  labs(title = "Islands in Palmerpenguins Dataset") +
  facet_grid(. ~ sex)

penguins %>% 
  filter(!is.na(sex)) %>% 
  mutate(sex = factor(sex, labels = c("Female","Male"))) %>% 
  ggplot() +
  geom_bar(aes(x = island, fill = sex)) +
  labs(title = "Islands in Palmerpenguins Dataset",
       subtitle = "Segmented by Sex",
       x = "Island", y = "Freq.") +
  facet_grid(. ~ sex) +
  guides(fill = "none") +
  theme_bw()

penguins %>% 
  filter(!is.na(sex)) %>% 
  mutate(sex = factor(sex, labels = c("Female","Male"))) %>% 
  ggplot() +
  geom_bar(aes(x = island, fill = sex)) +
  labs(title = "Islands in Palmerpenguins Dataset",
       subtitle = "Segmented by Year and Sex",
       x = "Island", y = "Freq.") +
  facet_grid(sex ~ year) +
  guides(fill = "none") +
  theme_bw() +
  scale_fill_brewer(palette="Paired")

# Scatter plot

ggplot(penguins) +
  geom_point(aes(x = bill_length_mm, y = bill_depth_mm, color = island))
ggplot(penguins) +
  geom_point(aes(x = bill_length_mm, y = bill_depth_mm, color = sex))
ggplot(penguins) +
  geom_point(aes(x = bill_length_mm, y = bill_depth_mm, color = species))

ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point() +
  geom_smooth(formula = y ~ x, method = lm) +
  theme_bw() +
  labs(x = "Bill length (in mm)",
       y = "Bill depth (in mm)",
       title = "Relationship between bill length and bill depth",
       subtitle = "Grouped by Species") +
  scale_color_brewer(palette="Set1")

# density plot

ggplot(penguins) +
  geom_density(aes(x = body_mass_g, fill = species), alpha = 0.6) +
  facet_grid(species~.) +
  theme_bw() +
  labs(x = "Body Mass (in grams)", y = "Density", fill = "Species",
       title = "Histogram of Body Mass by Species") +
  scale_y_continuous(labels = scales::label_number())

library(ggridges) 
ggplot(penguins, aes(x = body_mass_g, y = species, fill = species)) +
  geom_density_ridges(alpha = 0.6) + 
  guides(fill = "none") +
  theme_light() +
  labs(x = "Body mass (in grams)", y = NULL)



# boxplot

ggplot(penguins) +
  geom_boxplot(aes(y = body_mass_g, x = species))

ggplot(penguins, aes(y = body_mass_g, x = species)) +
  geom_boxplot() +
  geom_jitter()

# violin plot

ggplot(penguins) +
  geom_violin(aes(y = body_mass_g, x = species))


# Line plot

library(readxl)
co2_df <- read_xlsx("data/P_Data_Extract_From_World_Development_Indicators.xlsx", 
                    sheet = "Data")

co2_df %>% 
  filter(between(Time, 2004, 2020)) %>% 
  tidyr::pivot_longer(cols = `Bangladesh [BGD]`:`Sweden [SWE]`,
                      names_to = "Country", values_to = "CO2 Emissions (kt)") %>% 
  select(Time, Country, `CO2 Emissions (kt)`) %>% 
  mutate(`CO2 Emissions (kt)` = as.numeric(`CO2 Emissions (kt)`)) %>% 
  ggplot(aes(x = Time, y = `CO2 Emissions (kt)`, group = Country, color = Country)) +
  geom_line(aes(linetype = Country)) + 
  geom_point() + 
  scale_linetype_manual(values=c("solid", "dotted", "longdash")) +
  scale_y_continuous(label = scales::label_number(suffix = " kt", 
                                                  scale_cut = scales::cut_long_scale())) +
  theme_bw() +
  ggtitle("CO2 Emissions for Three Countries") +
  theme(legend.position="bottom") 
