% Generated by roxygen2 (4.0.2): do not edit by hand
\name{setComprehensiveTemperatureGeneratorParameters}
\alias{setComprehensiveTemperatureGeneratorParameters}
\title{Computes climatic and correlation information useful for creating an auto-regeressive random generation of maximum and minimun daily temparature. This function is called by  \code{\link{ComprehensiveTemperatureGenerator}}.}
\usage{
setComprehensiveTemperatureGeneratorParameters(station, Tx_all, Tn_all,
  mean_climate_Tn = NULL, mean_climate_Tx = NULL, Tx_spline = NULL,
  Tn_spline = NULL, year_max = 1990, year_min = 1961, leap = TRUE,
  nmonth = 12, verbose = FALSE, cpf = NULL, normalize = TRUE,
  sample = NULL, option = 2, yearly = FALSE)
}
\arguments{
\item{station}{character vector of the IDs of the considered meteorological stations}

\item{Tx_all}{data frame containing daily maximum temperature of all meteorological station. See \code{\link{TEMPERATURE_MAX}} for formatting.}

\item{Tn_all}{data frame containing daily minimum temperature of all meteorological station. See \code{\link{TEMPERATURE_MIN}} for formatting.}

\item{mean_climate_Tn}{a matrix containing monthly mean minimum daily temperature for the considered station or an object as returned by \code{\link{getMonthlyMean}}. If \code{NULL}, it is calculated. See input of \code{\link{is.monthly.climate}}}

\item{mean_climate_Tx}{a matrix containing monthly mean maximum daily temperature for the considered station or an object as returned by \code{\link{getMonthlyMean}}. If \code{NULL}, it is calculated. See input of \code{\link{is.monthly.climate}}}

\item{Tx_spline}{daily timeseries (from the first day of \code{year_min} to the last day of \code{year_max}) of averaged maximum temperature which can be obtained by a spline interpolation of monthly mean values. Default is \code{NULL} and returned as output. See for spline interpolation utilized: \code{\link{splineInterpolateMonthlytoDailyforSeveralYears}}.}

\item{Tn_spline}{daily timeseries (from the first day of \code{year_min} to the last day of \code{year_max}) of averaged minimum temperature which can be obtained by a spline interpolation of monthly mean values. Default is \code{NULL} and returned as output. See for spline interpolation utilized: \code{\link{splineInterpolateMonthlytoDailyforSeveralYears}}.}

\item{year_max}{start year of the recorded (calibration) period}

\item{year_min}{end year of the recorded (calibration) period}

\item{leap}{logical variables. It is \code{TRUE} (Default) if leap years are considered}

\item{nmonth}{number of months in one year. Default is 12.}

\item{verbose}{logical variable}

\item{cpf}{see \code{\link{normalizeGaussian_severalstations}}}

\item{normalize}{logical variable If \code{TRUE} \code{\link{normalizeGaussian_severalstations}} is used, otherwise it is not. If \code{option} is 2, it is always \code{TRUE}.}

\item{sample}{see \code{\link{normalizeGaussian_severalstations}}}

\item{option}{integer value. If 1, the generator works with minimum and maximum temperature, if 2 (default) it works with the average value between maximum and minimum temperature and the respective daily thermal range.}

\item{yearly}{logical value. If \code{TRUE} the monthly mean values are calculated for each year from \code{year_min} to \code{year_max} separately. Default is \code{FALSE}.}
}
\value{
This function creates and returns the following gloabal variables:




\code{data_original} matrix containing normalized and standardized data (i.e. \code{data_original})

\code{data_for_var}  matrix returned from \code{normalizeGaussian_severalstations} by processing \code{data_original} if \code{normalize} is \code{TRUE}), otherwise it is equal to \code{data_original}.

\code{Tn_mes} matrix containing measured minimum daily temperature in the analyzed time period ( \eqn{Tn_{mes}})

\code{Tx_mes} matrix containing measured maximum daily temperature in the analyzed time period ( \eqn{Tx_{mes}})

\code{Tm_mes} matrix calculated as to \deqn{\frac{Tx_{mes}+Tn_{mes}}{2}}

\code{DeltaT_mes} matrix corresponding to \eqn{Tx_{mes}-Tn_{mes}}

\code{monthly_mean_Tn} matrix containing monthly means of minimum daily temperature for the considered station. It is calculated according to the input format \code{\link{is.monthly.climate}} if \code{saveMonthlyClimate} is  \code{TRUE}.

\code{monthly_mean_Tx} matrix containing monthly means of maximum daily temperature for the considered station. It is calculated according to the input format \code{\link{is.monthly.climate}} if \code{saveMonthlyClimate} is  \code{TRUE}.

\code{Tx_spline} matrix containing the averaged  daily values of maximimum temperature obtained by a spline interpolation of the monthly climate \code{monthly_mean_Tx} or \code{mean_climate_Tx}
using \code{\link{splineInterpolateMonthlytoDailyforSeveralYears}} ( \eqn{Tx_{s}})

\code{Tn_spline} matrix containing the averaged  daily values of minimun temperature obtained by a spline interpolation of the monthly climate \code{monthly_mean_Tn} or \code{mean_climate_Tn}
using \code{\link{splineInterpolateMonthlytoDailyforSeveralYears}} ( \eqn{Tn_{s}})

\code{SplineAdvTm} matrix calculated as \eqn{\frac{Tx_{s}+Tn_{s}}{2}}

\code{SplineAdvDeltaT}, matrix corresponding to \eqn{Tx_{s}-Tn_{s}}

\code{stdTn} vector containing the standard deviation of minimum temperature anomalies \eqn{Tn_{mes}-Tn_s} (\eqn{\sigma_{Tn}})

\code{stdTx} vector containing the standard deviation of maximum temperature anomalies \eqn{Tx_{mes}-Tx_s} (\eqn{\sigma_{Tx}})

\code{stdTm} vector containing the standard deviation of "mean" temperature anomalies \eqn{Tm_{mes}-Tm_s} (\eqn{\sigma_{Tm}})

\code{Tn_mes_res} standard core (standardization) of \eqn{Tn_mes} obtained
by solving column by column the expression  \deqn{\frac{Tn_{mes}-Tn_s}{\sigma_{Tn}}}

\code{Tx_mes_res} standard core (standardization) of \eqn{Tx_mes} obtained
by solving column-by-column the expression  \deqn{\frac{Tx_{mes}-Tn_s}{sd_{Tm}}}

\code{Tm_mes_res} standard core (standardization) of \eqn{Tm_mes} obtained
by solving column-by-column the expression  \deqn{\frac{Tm_{mes}-Tn_s}{sd_{Tm}}}

\code{DeltaT_mes_res} equal to \code{DeltaT_mes}

\code{data_original} matrix obtained as \code{cbind(Tx_mes_res,Tn_mes_res)} if \code{option}==1, or \code{cbind(Tm_mes_res,DeltaT_mes_res)} if \code{option}==2

See the R code for further details.
}
\description{
Computes climatic and correlation information useful for creating an auto-regeressive random generation of maximum and minimun daily temparature. This function is called by  \code{\link{ComprehensiveTemperatureGenerator}}.
}
\author{
Emanuele Cordano, Emanuele Eccel
}
\seealso{
\code{\link{splineInterpolateMonthlytoDailyforSeveralYears}},\code{\link{ComprehensiveTemperatureGenerator}}
}

