#include <Rcpp.h>
using namespace Rcpp;

//' @title
//' mode_Rcpp
//' @description
//' This function determines the most frequently occurring value in an integer vector(mode).
//' 
//' @details
//' ARGUMENTS:
//' x - an integer vector
//'
//' RETURN VALUE:
//' a string value
//'
//' @family fungroup
//' @export
// [[Rcpp::export]]


String mode_Rcpp(IntegerVector x) {

Function R_factor("factor");

x = R_factor(x);

CharacterVector levels = x.attr("levels");

int nl = levels.size();

int nx = x.size();

IntegerVector out(nl);

for (int i=0; i<nx; ++i) {

out[x[i]-1]++;

}

out.names() = levels;

Function R_sort("sort");

out=R_sort(out);

CharacterVector v=out.names();

int nv=v.size();

String a=v[nv-1];

return a;
}











