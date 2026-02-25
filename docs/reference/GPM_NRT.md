# NASA GPM Near Real Time rainfall data

This function downloads rainfall remote sensing data of IMERG from NASA
GSFC servers, extracts data from grids within a specified watershed
shapefile, and then generates tables in a format that any hydrological
model requires for rainfall data input. The function also generates the
rainfall stations file input (file with columns: ID, File NAME, LAT,
LONG, and ELEVATION) for those selected grids that fall within the
specified watershed. The minimum latency for this function is one day.

## Usage

``` r
GPM_NRT(
  Dir = "./INPUT/",
  watershed = "LowerMekong.shp",
  DEM = "LowerMekong_dem.tif",
  start = "2022-6-1",
  end = "2022-6-10"
)
```

## Arguments

- Dir:

  A directory name to store gridded rainfall and rain stations files.

- watershed:

  A study watershed shapefile spatially describing polygon(s) in a
  geographic projection crs='+proj=longlat +datum=WGS84'.

- DEM:

  A study watershed digital elevation model raster in a geographic
  projection crs='+proj=longlat +datum=WGS84'.

- start:

  Beginning date for gridded rainfall data.

- end:

  Ending date for gridded rainfall data.

## Value

A table that includes points ID, Point file name, Lat, Long, and
Elevation information, and a scalar of rainfall gridded data values at
each point within the study watershed in ascii format needed by
hydrological model weather inputs will be stored at `Dir`.

## Details

A user should visit <https://disc.gsfc.nasa.gov/information/documents>
Data Access document to register with the Earth Observing System Data
and Information System (NASA Earthdata) and then authorize NASA GESDISC
Data Access to successfully work with this function. The function
accesses NASA Goddard Space Flight Center server address for IMERG
remote sensing data products at
(<https://gpm1.gesdisc.eosdis.nasa.gov/data/GPM_L3/GPM_3IMERGDE.07/>).
The function uses variable name ('precipitation') for rainfall in IMERG
data products. Units for gridded rainfall data are 'mm'.

IMERG dataset is the GPM Level 3 IMERG \*Early\* Daily 0.1 x 0.1 deg
(GPM_3IMERGDE) derived from the half-hourly GPM_3IMERGHHE. The derived
result represents the final estimate of the daily accumulated
precipitation. The dataset is produced at the NASA Goddard Earth
Sciences (GES) Data and Information Services Center (DISC) by simply
summing the valid precipitation retrievals for the day in GPM_3IMERGHHE
and giving the result in (mm) <https://gpm.nasa.gov/data/directory>.

The IMERG data products are available from 2000-June-1 to present. The
function outputs table and gridded data files that match grid points
resolution of IMERG data products (i.e., resolution of 0.1 deg).

The `GPM_NRT` function relies on 'curl' tool to transfer data from NASA
servers to a user machine, using HTTPS supported protocol. The 'curl'
command embedded in this function to fetch precipitation IMERG netcdf
daily global files is designed to work seamlessly given that appropriate
logging information are stored in the ".netrc" file and the cookies file
".urs_cookies" as explained in registering with the Earth Observing
System Data and Information System. It is imperative to say here that a
user machine should have 'curl' installed as a prerequisite to run
`GPM_NRT`.

## Note

`start` should be equal to or greater than 2000-Jun-01.

`end` the minimum latency is 1 day.

## Author

Ibrahim Mohammed, <ibrahim.mohammed@ku.ac.ae>

## Examples

``` r
#Lower Mekong basin example
if (FALSE) GPM_NRT(Dir = "./INPUT/", watershed = "LowerMekong.shp",
DEM = "LowerMekong_dem.tif", start = "2022-6-1", end = "2022-6-10") # \dontrun{}
```
