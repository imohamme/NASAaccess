% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GPMswat.R
\name{GPMswat}
\alias{GPMswat}
\title{SWAT rainfall data from NASA GPM}
\usage{
GPMswat(
  Dir = "./SWAT_INPUT/",
  watershed = "LowerMekong.shp",
  DEM = "LowerMekong_dem.tif",
  start = "2015-12-1",
  end = "2015-12-3"
)
}
\arguments{
\item{Dir}{A directory name to store gridded rainfall and rain stations files.}

\item{watershed}{A study watershed shapefile spatially describing polygon(s) in a geographic projection crs='+proj=longlat +datum=WGS84'.}

\item{DEM}{A study watershed digital elevation model raster in a geographic projection crs='+proj=longlat +datum=WGS84'.}

\item{start}{Beginning date for gridded rainfall data.}

\item{end}{Ending date for gridded rainfall data.}
}
\value{
A table that includes points ID, Point file name, Lat, Long, and Elevation information formatted to be read with \acronym{SWAT}, and
a scalar of rainfall gridded data values at each point within the study watershed in ascii format needed by \acronym{SWAT} model weather inputs will be stored at \code{Dir}.
}
\description{
This function downloads rainfall remote sensing data of \acronym{TRMM} and \acronym{IMERG} from \acronym{NASA} \acronym{GSFC} servers, extracts data from grids within a specified watershed shapefile, and then generates tables in a format that \acronym{SWAT} requires for rainfall data input. The function also generates the rainfall stations file input (file with columns: ID, File NAME, LAT, LONG, and ELEVATION) for those selected grids that fall within the specified watershed.
}
\details{
A user should visit \url{https://disc.gsfc.nasa.gov/information/documents} Data Access document to register with the Earth Observing System Data and Information System (\acronym{NASA Earthdata}) and then authorize \acronym{NASA} GESDISC Data Access to successfully work with this function. The function accesses \acronym{NASA} Goddard Space Flight Center server address for \acronym{IMERG} remote sensing data products at (\url{https://gpm1.gesdisc.eosdis.nasa.gov/data/GPM_L3/GPM_3IMERGDF.06/}), and \acronym{NASA} Goddard Space Flight Center server address for \acronym{TRMM} remote sensing data products (\url{https://disc2.gesdisc.eosdis.nasa.gov/data/TRMM_RT/TRMM_3B42RT_Daily.7/}).  The function uses variable name ('precipitationCal') for rainfall in \acronym{IMERG} data products and variable name ('precipitation') for \acronym{TRMM} rainfall data products. Units for gridded rainfall data are 'mm'.

\acronym{IMERG} dataset is the GPM Level 3 \acronym{IMERG} *Final* Daily 0.1 x 0.1 deg (GPM_3IMERGDF) derived from the half-hourly GPM_3IMERGHH. The derived result represents the final estimate of the daily accumulated precipitation. The dataset is produced at the \acronym{NASA} Goddard Earth Sciences (GES) Data and Information Services Center (DISC) by simply summing the valid precipitation retrievals for the day in GPM_3IMERGHH and giving the result in (mm) \url{https://gpm.nasa.gov/data/directory}.

\acronym{TRMM} dataset is a daily 0.25 x 0.25 deg accumulated precipitation product that is generated from the Near Real-Time 3-hourly TMPA (3B42RT). It is produced at the NASA GES DISC, as a value added product. Simple summation of valid retrievals in a grid cell is applied for the data day. The result is given in (mm) \url{https://gpm.nasa.gov/data/directory}.

Since \acronym{IMERG} data products are only available from 2000-June-1 to present, then this function uses \acronym{TRMM} data products for time periods earlier than 2000-June-1. Keep in mind that \acronym{TRMM} data products that are compatible with \acronym{IMERG} data products are only available from 2000-March-01.
The function outputs table and gridded data files that match grid points resolution of \acronym{IMERG} data products (i.e., resolution of 0.1 deg). Since \acronym{TRMM} and \acronym{IMERG} data products do not have a similar spatial resolution (i.e., 0.25 and 0.1 deg respectively), the function assigns the nearest \acronym{TRMM} grid point to any missing \acronym{IMERG} data point as an approximate (i.e. during 2000-March-01 to 2014-March-11 time period).

The \command{GPMswat} function relies on 'curl' tool to transfer data from \acronym{NASA} servers to a user machine, using HTTPS supported protocol.  The 'curl' command embedded in this function to fetch precipitation \acronym{IMERG}/\acronym{TRMM} netcdf daily global files is designed to work seamlessly given that appropriate logging information are stored in the ".netrc" file and the cookies file ".urs_cookies" as explained in registering with the Earth Observing System Data and Information System. It is imperative to say here that a user machine should have 'curl' installed as a prerequisite to run \command{GPMswat}.
}
\note{
\command{start} should be equal to or greater than 2000-Mar-01.
}
\examples{
#Lower Mekong basin example
\dontrun{GPMswat(Dir = "./SWAT_INPUT/", watershed = "LowerMekong.shp",
DEM = "LowerMekong_dem.tif", start = "2015-12-1", end = "2015-12-3")}
}
\author{
Ibrahim Mohammed, \email{ibrahim.mohammed@nasa.gov}
}
\keyword{IMERG}
\keyword{NASA}
\keyword{Precipitation}
\keyword{TRMM}
