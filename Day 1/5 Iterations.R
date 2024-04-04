
# for

for(i in 1:3){
  print(i)
}

for(i in 1:10){
  if(i %% 2 == 0){
    print(paste0(i," is divisible by 2"))
  }
}

## next

for(i in 1:10){
  if(i %% 3 == 0){
    print(paste0(i," is divisible by 2"))
    
    print("Next executed.")
    next  # start next loop
  }
  print(paste0("i = ", i))
}

## break

for(i in 1:10){
  if(i %% 5 == 0){
    print(paste0(i," is divisible by 2"))
    
    print("Break executed.")
    break
  }
  print(paste0("i = ", i))
}

# while

i <- 1
while(i <= 5){
  print(paste0("i = ", i))
  i <- i + 1
}

# apply

mtcars
apply(mtcars, 2, mean)
sapply(mtcars, mean)
lapply(mtcars, mean)
