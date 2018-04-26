# Factorial Function

fact <- function(n)
{
  if(n < 0 | !round(n) == n)
    stop("Factorial of a Negative or Decimal number is Impossible!")
  if(n == 1 | n == 0)return(1)
  else{
    options(scipen = 9999)
    return(n*fact(n-1))
  }
}

#==== Permutation

permutate <- function(n,r)
{
  if(r > n | r < 0 | n < 0)
    stop("Permutation of given arguments is Invalid !")
  else
    return(fact(n)/fact(n-r))
}

#========== Combination

combinate <- function(n,r)
{
  if(r > n | r < 0 | n < 0)
    stop("Combination of given arguments is Invalid !")
  else
    return(fact(n)/(fact(n-r)*fact(r)))
}











