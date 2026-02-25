# Air temperature data from NASA GLDAS on centroid

This function downloads remote sensing data of GLDAS from NASA GSFC
servers, extracts air temperature data from grids falling within a
specified sub-basin(s) watershed shapefile, and assigns a pseudo air
temperature gauge located at the centroid of the sub-basin(s) watershed
a weighted-average daily minimum and maximum air temperature data. The
function generates tables in a format that SWAT or other rainfall-runoff
hydrological model requires for minimum and maximum air temperatures
data input. The function also generates the air temperature stations
file input (file with columns: ID, File NAME, LAT, LONG, and ELEVATION)
for those selected grids that pseudo grids that correspond to the
centroids of the watershed sub-basins.

## Usage

``` r
GLDASpolyCentroid(
  Dir = "./SWAT_INPUT/",
  watershed = "LowerMekong.shp",
  DEM = "LowerMekong_dem.tif",
  start = "2015-12-1",
  end = "2015-12-3"
)
```

## Arguments

- Dir:

  A directory name to store gridded air temperature and air temperature
  stations files.

- watershed:

  A study watershed shapefile spatially describing polygon(s) in a
  geographic projection crs='+proj=longlat +datum=WGS84'.

- DEM:

  A study watershed digital elevation model raster in a geographic
  projection crs='+proj=longlat +datum=WGS84'.

- start:

  Beginning date for gridded air temperature data.

- end:

  Ending date for gridded air temperature data.

## Value

A table that includes points ID, Point file name, Lat, Long, and
Elevation information formatted to be read with SWAT or other
hydrological model, and a scalar of maximum and minimum air temperature
gridded data values at a pseudo air temperature grid located at the
centroid of each sub-basin within the study watershed provided in ascii
format needed by SWAT model or other hydrological model weather inputs.
All air temperature tables will be stored at `Dir`.

## Details

A user should visit <https://disc.gsfc.nasa.gov/information/documents>
Data Access document to register with the Earth Observing System Data
and Information System (NASA Earthdata) and then authorize NASA GESDISC
Data Access to successfully work with this function. The function
accesses NASA Goddard Space Flight Center server address for GLDAS
remote sensing data products at
(<https://hydro1.gesdisc.eosdis.nasa.gov/data/GLDAS/GLDAS_NOAH025_3H.2.1/>).
The function uses variable name ('Tair_f_inst') for air temperature in
GLDAS data products. Units for gridded air temperature data are degrees
in 'K'. The `GLDASpolyCentroid` function outputs gridded air temperature
(maximum and minimum) data in degrees 'C'.

The goal of the Global Land Data Assimilation System GLDAS is to ingest
satellite and ground-based observational data products, using advanced
land surface modeling and data assimilation techniques, in order to
generate optimal fields of land surface states and fluxes (Rodell et
al., 2004). GLDAS data set used in this function is the GLDAS Noah Land
Surface Model L4 3 hourly 0.25 x 0.25 degree V2.1. The full suite of
GLDAS data sets are available at
<https://hydro1.gesdisc.eosdis.nasa.gov/dods/>. The `GLDASpolyCentroid`
finds the minimum and maximum air temperatures for each day at each grid
within the study watershed by searching for minima and maxima over the
three hours air temperature data values available for each day and grid.

The `GLDASpolyCentroid` function relies on "curl" tool to transfer data
from NASA servers to a user machine, using HTTPS supported protocol. The
"curl" command embedded in this function to fetch GLDAS netcdf daily
global files is designed to work seamlessly given that appropriate
logging information are stored in the ".netrc" file and the cookies file
".urs_cookies" as explained in registering with the Earth Observing
System Data and Information System. It is imperative to say here that a
user machine should have "curl" installed as a prerequisite to run
`GLDASpolyCentroid`.

The GLDAS V2.1 simulation started on January 1, 2000 using the
conditions from the GLDAS V2.0 simulation. The GLDAS V2.1 simulation was
forced with National Oceanic and Atmospheric Administration NOAA, Global
Data Assimilation System GDAS atmospheric analysis fields (Derber et
al., 1991), the disaggregated Global Precipitation Climatology Project
GPCP precipitation fields (Adler et al., 2003), and the Air Force
Weather Agency's AGRicultural METeorological modeling system AGRMET
radiation fields which became available for March 1, 2001 onward.

## Note

`start` should be equal to or greater than 2000-Jan-01.

## References

Adler, R. F., G. J. Huffman, A. Chang, R. Ferraro, P.-P. Xie, J.
Janowiak, B. Rudolf, U. Schneider, S. Curtis, D. Bolvin, A. Gruber, J.
Susskind, P. Arkin, and E. Nelkin (2003), The Version-2 Global
Precipitation Climatology Project (GPCP) Monthly Precipitation Analysis
(1979–Present), J. Hydrometeorol., 4, 1147-1167,
doi:10.1175/1525-7541(2003)004\<1147:tvgpcp\>2.0.co;2.

Derber, J. C., D. F. Parrish, and S. J. Lord (1991), The New Global
Operational Analysis System at the National Meteorological Center,
Weather Forecast, 6, 538-547,
doi:10.1175/1520-0434(1991)006\<0538:tngoas\>2.0.co;2.

Rodell, M., P. R. Houser, U. Jambor, J. Gottschalck, K. Mitchell, C.-J.
Meng, K. Arsenault, B. Cosgrove, J. Radakovich, M. Bosilovich, J. K.
Entin\*, J. P. Walker, D. Lohmann, and D. Toll (2004), The Global Land
Data Assimilation System, B. Am. Meteorol. Soc., 85, 381-394,
doi:10.1175/bams-85-3-381.

## Author

Ibrahim Mohammed, <ibrahim.mohammed@ku.ac.ae>

## Examples

``` r
#Lower Mekong basin example
if (FALSE) GLDASpolyCentroid(Dir = "./SWAT_INPUT/", watershed = "LowerMekong.shp",
DEM = "LowerMekong_dem.tif", start = "2015-12-1", end = "2015-12-3") # \dontrun{}
```
