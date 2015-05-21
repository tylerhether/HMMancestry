// This file was generated by Rcpp::compileAttributes
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// c_est_fwd_back
DataFrame c_est_fwd_back(NumericVector snp_locations, NumericVector k0, NumericVector k1, double p_assign, double p_trans);
RcppExport SEXP hmmspore_c_est_fwd_back(SEXP snp_locationsSEXP, SEXP k0SEXP, SEXP k1SEXP, SEXP p_assignSEXP, SEXP p_transSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< NumericVector >::type snp_locations(snp_locationsSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type k0(k0SEXP);
    Rcpp::traits::input_parameter< NumericVector >::type k1(k1SEXP);
    Rcpp::traits::input_parameter< double >::type p_assign(p_assignSEXP);
    Rcpp::traits::input_parameter< double >::type p_trans(p_transSEXP);
    __result = Rcpp::wrap(c_est_fwd_back(snp_locations, k0, k1, p_assign, p_trans));
    return __result;
END_RCPP
}
// lapply1
List lapply1(List input, Function f);
RcppExport SEXP hmmspore_lapply1(SEXP inputSEXP, SEXP fSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< List >::type input(inputSEXP);
    Rcpp::traits::input_parameter< Function >::type f(fSEXP);
    __result = Rcpp::wrap(lapply1(input, f));
    return __result;
END_RCPP
}
