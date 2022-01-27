===============================
NASAaccess R Guide
===============================


Prerequisites
#############

On a local machine the user should have installed the following programs as well as setting up a user account.  The list below gives a summary of what is needed to be done prior to work with NASAaccess software on any local machine:

  * `Installing R software <https://cloud.r-project.org/>`_

  *	`Installing Rstudio software <https://www.rstudio.com/>`_ (OPTIONAL)

  * NASAaccess R package needs a user registration access with `Earthdata <https://earthdata.nasa.gov/>`_. Users should set up a registration account(s) with `Earthdata <https://earthdata.nasa.gov/>`_ login as well as well as authorizing `NASA <https://www.nasa.gov/>`_ `GES DISC <https://disc.gsfc.nasa.gov/>`_ data access.  Please refer to https://disc.gsfc.nasa.gov/data-access for further details.

  * After registration with `Earthdata <https://earthdata.nasa.gov/>`_ NASAaccess software package users should create a reference file (*netrc*) with `Earthdata <https://earthdata.nasa.gov/>`_ credentials stored in it to streamline the retrieval access to `NASA <https://www.nasa.gov/>`_ servers.

      * Creating the *.netrc* file at the user machine *Home* directory and storing the user `NASA <https://www.nasa.gov/>`_ `GES DISC <https://disc.gsfc.nasa.gov/>`_ logging information in it is needed to execute the NASAaccess package commands. Accessing data at NASA servers is further explained at `NASA earth data wiki <https://wiki.earthdata.nasa.gov/display/EL/How+To+Access+Data+With+cURL+And+Wget>`_.

      * For Windows users the `NASA <https://www.nasa.gov/>`_ `GES DISC <https://disc.gsfc.nasa.gov/>`_ logging information should be saved in a file *\_netrc* beside the *.netrc* file explained above.

  * Installing `curl <https://curl.se/>`_ software .  Since Mac users have `curl <https://curl.se/>`_ as part of macOS build, Windows users should make sure that their local machines build have `curl <https://curl.se/>`_ installed properly.

  * Checking if you can run `curl <https://curl.se/>`_ from your command prompt.  Type `curl --help` and you should see the help pages for the `curl <https://curl.se/>`_ program once everything is defined correctly.

  * Within Rstudio or R terminal run the following commands to install NASAaccess:
      #. library(devtools)

      #. install_github("nasa/NASAaccess", build_vignettes = TRUE)

      #. library(NASAaccess)

   Within the Rstudio help tab the user can verify that the package has been installed and browse the help pages of the various functions of NASAaccess.



Source Code
***********

The NASAaccess source code is available on Github:

  - https://github.com/nasa/NASAaccess





