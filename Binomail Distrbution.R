library(stats)

# ======== dbinom() =============

# Creating a sequence from 0 to 5
x <- seq(0,10,by = 1)

# Finding the probability of success of each outcome with probability of success as 0.2
y <- dbinom(x,10,0.324)
plot(x,y,type = "b")

y <- dbinom(x,10,0.6)
plot(x,y,type = "b")

y <- dbinom(x,10,1)
plot(x,y,type = "b")

y <- dbinom(x,10,0)
plot(x,y,type = "b")

# =========== pbinom() ===============

# Creating a sequence from 0 to 10
x <- seq(0,10,by = 1)
y <- pbinom(q = x,size = 10,prob = 0.21,lower.tail = T)
plot(x,y,type = "b")

y <- pbinom(q = x,size = 10,prob = 0.57,lower.tail = T)
plot(x,y,type = "b")

y <- pbinom(q = x,size = 10,prob = 0.57,lower.tail = F)
plot(x,y,type = "b")

y <- pbinom(q = x,size = 10,prob = 1,lower.tail = T)
plot(x,y,type = "b")

y <- pbinom(q = x,size = 10,prob = 0,lower.tail = T)
plot(x,y,type = "b")

# ============ qbinom() ===============

qbinom(0.25,10,0.57,lower.tail = T)
qbinom(0.75,10,0.57,lower.tail = T)

qbinom(0.25,10,0.57,lower.tail = F)
qbinom(0.75,10,0.57,lower.tail = F)

qbinom(c(0,0.33,0.66,0.99,1),10,0.57,lower.tail = F)
qbinom(c(0,0.33,0.66,0.99,1),10,0.57,lower.tail = T)

qbinom(1.23,10,0.57)


# =============== rnorm() ==================

# Binomial Distribution of mean = 60 
rbinom(8,150,0.4)

# Binomial Distribution of mean = 36 
rbinom(20,150,0.24)


# ================ EXAMPLE ==================
# dbinom Function is used to calculate Probability at a discrete point
# Consider the below binomial distribution
x <- c(1,2,3,4,5)

# Probability of success is as Below
p <- 0.12

# Probability that x = 0 is
dbinom(0,length(x),prob = p)

# Probability that x = 3 is
dbinom(3,length(x),prob = p)

# Probability that x >= 2 and x <= 4
p2 <- pbinom(1,size = length(x),prob = p,lower.tail = FALSE)
p4 <- pbinom(4,size = length(x),prob = p,lower.tail = FALSE)
p2 - p4

# Probability that x <= 3
pbinom(3,size = length(x),prob = p)

#========== R - Help Examples

require(graphics)
# Compute P(45 < X < 55) for X Binomial(100,0.5)
sum(dbinom(46:54, 100, 0.5))

## Using "log = TRUE" for an extended range :
n <- 2000
k <- seq(0, n, by = 20)
plot (k, dbinom(k, n, pi/10, log = TRUE), type = "l", ylab = "log density",
      main = "dbinom(*, log=TRUE) is better than  log(dbinom(*))")
lines(k, log(dbinom(k, n, pi/10)), col = "red", lwd = 2)
## extreme points are omitted since dbinom gives 0.
mtext("dbinom(k, log=TRUE)", adj = 0)
mtext("extended range", adj = 0, line = -1, font = 4)
mtext("log(dbinom(k))", col = "red", adj = 1)



