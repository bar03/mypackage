#include <Rcpp.h>
using namespace Rcpp;

//' @title
//' simplify2array_Rcpp
//' @description
//' This function mimics the behavior of the simplify2array fucntion as close as possible.
//' 
//' @details
//' ARGUMENTS:
//' x - a list numeric values
//'
//' RETURN VALUE:
//' list or matrix
//'
//' @family fungroup
//' @export
// [[Rcpp::export]]



RObject simplify2array_Rcpp(List x) {
  
  int n=x.size();
  
  NumericVector len(n);
  
  for(int i=0; i<n; i++){
    
    if(!Rf_isNumeric(x[i])){
      
      stop("there is a vector which is not numeric");
      
    }else{
      
      NumericVector y=x[i];
      
      len[i]=y.size();
      
    }
    
  }
  
  for(int i=1; i<n; i++){
    
    if(len[i]!=len[0]){
      
      return x;
      
      break;
      
    }
    
  }
  
  NumericMatrix mat(len[0],n);
  
  for(int i=0; i<n; i++){
    
    for(int j=0; j<len[0]; j++){
      
      NumericVector z=x[i];
      
      mat(j,i)=z[j];
      
    }
    
  }
  
  return mat;
  
}
















