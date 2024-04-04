
# if - else

x <- 20

if(x <= 10){
  print("Less than or equal to 10")
}else{
  print("Greater than 10")
}

# if - else if - else

x <- 19

if(x <= 10){
  print("Less than or equal to 10")
}else if(x >= 20){
  print("Greater than or equal to 20")
}else{
  print("Between 10 and 20")
}

# ifelse



# switch

# case_when

x <- c(10, 14, 21, 23, 35, 70, 80, 100, NA, 6)
dplyr::case_when(
  x == 35 ~ "fizz buzz",
  x %% 5 == 0 ~ "fizz",
  x == 7 ~ "buzz",
  is.na(x) ~ "???",
  TRUE ~ as.character(x)
)
