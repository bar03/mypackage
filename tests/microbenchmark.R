
##zad 6.1

###R function

mode_R<-function(x){
  
  x<-factor(x)
  
  levels<-levels(x)
  
  nl<-length(levels)
  
  a<-names(sort(table(x))[nl])
  
  return(a)
  
}


##tests
library(microbenchmark)

#1)
x<-c(4,5,1,2,1)
microbenchmark(mode_Rcpp(x), mode_R(x))
#2)
x<-c(1,2,1,2,2)
microbenchmark(mode_Rcpp(x), mode_R(x))
#3)
x<-c(-2,1,2,3,4,1)
microbenchmark(mode_Rcpp(x), mode_R(x))
#4)
x<-c(-3,1,3,3,4,1,3,6,3)
microbenchmark(mode_Rcpp(x), mode_R(x))
#5)
x<-c(rep(1,1000), rep(2,3000), rep(5,30000))
microbenchmark(mode_Rcpp(x), mode_R(x))



##zad 6.2


##R function

simplify2array_R<-function(x){
  
  n<-length(x)
  
  len<-numeric(n)
  
  for(i in 1:n){
    
    if(!is.numeric(x[[i]])){
      
      stop("there is a vector which is not numeric")
      
    }else{
      
      y<-x[[i]]
      
      len[i]<-length(y)
      
    }
    
  }
  
  for(i in 2:n){
    
    if(len[i]!=len[1]){
      
      return(x)
      
    }
    
  }
  
  mat<-matrix(0,len[1],n)
  
  for(i in 1:n){
    
    for(j in 1:len[1]){
      
      z<-x[[i]]
      
      mat[j,i]<-z[j]
      
    }
    
  }
  
  return(mat)
  
}



##tests

#1)
l<-list(rep(1,6), 2:7, c(-2,34,21,6.7,3.1,-7.98))
microbenchmark(simplify2array_Rcpp(l), simplify2array_R(l))
#2)
l<-list(c(1,2,3), c(4,5,6), c(6,7,8))
microbenchmark(simplify2array_Rcpp(l), simplify2array_R(l))
#3)
l<-list(c(1,2,3), c(4,5,6), c(6,7,8), c(4,9,1))
microbenchmark(simplify2array_Rcpp(l), simplify2array_R(l))
#4)
l<-list(rep(1,30), rep(2,30), rep(3,30),rep(4,30), rep(5,30))
microbenchmark(simplify2array_Rcpp(l), simplify2array_R(l))
#5)
l<-list(rep(1,1000), rep(2,1000), rep(3,1000),rep(4,1000))
microbenchmark(simplify2array_Rcpp(l), simplify2array_R(l))




