
##zad 6.1

## ---- Examples ----


#1)
(expect_error(mode_Rcpp("a", "b")))
#2)
(expect_error(mode_Rcpp(c("a","b"))))
#3)
(expect_identical(mode_Rcpp(c(4,5,1,2,1)), "1"))
#4)
(expect_identical(mode_Rcpp(c(1,2,1,2,2)),"2" ))
#5)
(expect_identical(mode_Rcpp(c(-2,1,2,3,4,1)), "1"))
#6)
(expect_identical(mode_Rcpp(c(-3,1,3,3,4,1,3,6,3)), "3"))
#7)
(expect_equivalent(mode_Rcpp(c(75,2,4,12,2)), "2"))
#8)
mode_Rcpp(c(1,6,6,6,1,1))
#9)
mode_Rcpp(c(1.5,2,2))
#10)
mode_Rcpp(NULL)


##zad 6.2

## ---- Examples ----

#1)
l<-list(c("a","b"), c(4,5), c(6,7,8), c(4,9,1))
(expect_error(simplify2array_Rcpp(l)))
#2)
l<-list(c("a","b"), c(4,5), c(T,F,T), c(4,9,1))
(expect_error(simplify2array_Rcpp(l)))
#3)
l<-list(c(1,2,3), c(4,5,6), c(6,7,8))
(expect_identical(simplify2array_Rcpp(l), rbind(c(1,4,6), c(2,5,7), c(3,6,8))))
#4)
l<-list(c(1,2,3), c(4,5,6), c(6,7,8), c(4,9,1))
(expect_identical(simplify2array_Rcpp(l), rbind(c(1,4,6,4), c(2,5,7,9), c(3,6,8,1))))
#5)
l<-list(c(1,2,3), c(4,5), c(6,7,8), c(4,9,1))
(expect_identical(simplify2array_Rcpp(l), list(c(1,2,3), c(4,5), c(6,7,8), c(4,9,1)) ))
#6)
l<-list(1, 20, sin(pi/6), exp(1))
(expect_identical(simplify2array_Rcpp(l), t(as.matrix(c(1, 20, sin(pi/6), exp(1)))) ))
#7)
l<-list(rep(2,3), seq(1,10, by=2), NA)
(expect_equivalent(simplify2array_Rcpp(l), l ))
#8)
l<-list(rep(1,6), 2:7, c(-2,34,21,6.7,3.1,-7.98))
simplify2array_Rcpp(l)
#9)
l<-NULL
simplify2array_Rcpp(l)
#10)
l<-list(c(2,6), c("a","b"))
simplify2array_Rcpp(l)



