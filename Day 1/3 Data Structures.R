
# Vector

seq(1,7,1)
1:7
seq_len(7)

rep(9, 4)

## variable

x <- seq(1,7,1)
y <- rep(9,4)
z <- c(x,y)
a <- c(2, 3, 1, 0)

## Index

a[1]
a[2]
a[c(1,2)]
length(a)
a[length(a)]

# Matrix

mat1 <- matrix(c(1,2,5,6), nrow = 2, ncol = 2, byrow = T)
mat2 <- rbind(c(1,2),c(5,6))
mat3 <- cbind(c(1,2),c(5,6))
mat4 <- matrix(c(1,2,5,"6"), nrow = 2)

mat1[1,]
mat1[,1]
mat1[,c(1,2)]

# Array

arr1 <- array(1:16, c(2,2,4))
arr1 

# List

li1 <- list(z, mat1, arr1)
li2 <- list(vac = z, matr = mat1, arra = arr1)

li1[[1]]
li1[[1]]

li2[["vac"]] 
li2$vac


# Data Frame

df1 <- data.frame(id = 1:4, gender = c("M","M","F","F"), age = c(19,21,18,24))

df2 <- data.frame(id = c(5,6), gender = c("F", "M"), age = c(19, 19))

df3 <- rbind(df1, df2)
df3

df4 <- edit(df3)
df4

View(df4)
