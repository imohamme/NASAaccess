==================================
NASAaccess Tethys Guide
==================================


.. image:: images/nasaaccess.png
   :scale: 20%
   :align: center



About
*****

The **NASAaccess** platform is available as software packages (i.e., R and conda packages) as well as an interactive format web-based environmental modeling application for earth observation data developed in the Tethys Platform framework (https://www.tethysplatform.org/). **NASAaccess** software can generate gridded ascii tables of climate `CMIP5 <https://pcmdi.llnl.gov/mips/cmip5/>`_, `CMIP6 <https://pcmdi.llnl.gov/CMIP6/>`_, and earth observation remote sensing data (`GPM <https://gpm.nasa.gov/data/directory>`_, `TRMM <https://gpm.nasa.gov/missions/trmm>`_, `GLDAS <https://ldas.gsfc.nasa.gov/gldas>`_) needed to drive various hydrological models (e.g., `VIC <https://github.com/UW-Hydro/VIC>`_, `RHESSys <https://github.com/RHESSys/RHESSys>`_, `SWAT <https://swat.tamu.edu/>`_ …etc.).  The NASAaccess has been envisioned to lower the technical barrier and simplify the process of accessing scalable distributed computing resources and leverage additional software for data and computationally intensive modeling frameworks. **NASAaccess** Tethys web-based application can be used for accessing, reformatting, and visualizing climate and earth observation remote sensing gridded time series data as well.



.. image:: images/nasaaccess_home_window.png
   :scale: 50%
   :align: center



How it works
************

The **NASAaccess** Tethys Application is simply a user interface for passing arguments into the **NASAaccess**
functions by calling the `r-nasaaccess` conda package (https://anaconda.org/conda-forge/r-nasaaccess). Using a combination of dropdowns, datepickers, and checkboxes, the app allows the user to select a watershed boundary, DEM, date range, and NASAaccess function(s) to pass to the server for running the selected **NASAaccess** function(s).


Requirements
************

- Windows:
            Setup a VirtualBox Machine via https://www.virtualbox.org/wiki/Downloads   

- Windows/MacOS/Linux:
            Anaconda (https://docs.anaconda.com/anaconda/install/index.html)  or miniconda (https://docs.conda.io/en/latest/miniconda.html)


Installation/Setup
******************
- EarthData:
      **NASAaccess** needs a user registration access with Earthdata (https://www.earthdata.nasa.gov/). Users should set up a registration account(s) with Earthdata login as well as authorizing NASA GES DISC data access. Please refer to https://disc.gsfc.nasa.gov/data-access for further details.

- Tethys:
      The **NASAaccess** Tethys Application requires the Tethys Platform to be installed beforehand. The Tethys Platform Framework installation process can be installed in a development and production environment. There is a couple of differences between both installations:

         - The production installation uses a combination of the NGINX and Daphne servers.
         - Changes Are Not Automatically Loaded in the production server, but in the development server
         - Debug Disabled to prevent sensitive information from being leaked in the production server
         - Static Files Collected  are collected to one location to be served more efficiently by NGINX.
         - Workspaces are collected to one location so they can be more easily backed up.
         - NGINX is given permission to access the static files and workspaces to be able to serve them.


   - Development:   
      The installation of tethys in a development environment serves to contribute to the development of new applications and of the Tethys platform itself. The following are the required steps:

                                       #. Create  a new conda environment and install the Tethys Platform by running the following command:
                                       ::

                                          conda create -n tethys -c tethysplatform -c conda-forge tethys-platform

                                       #. Activate the Tethys conda Environment:
                                       ::

                                          conda activate tethys
                                       
                                       #. Generate a portal_config.yml file containing custom configurations such as the database and other local settings by running the following command:
                                       ::

                                          tethys gen portal_config
                                       
                                       #. Tethys Platform requires a PostgreSQL database server. There are several options for setting up a DB server: local, docker, or dedicated. The Tethys platform can also be used to create a local server that creates and migrates the tables associated with the Tethys platform framework by running:

                                             #. Local instance
                                             ::

                                                tethys db configure
                                             
                                             #. Docker local instance (requires docker installed beforehand)
                                             ::

                                                tethys docker init -c postgis

                                                tethys docker start -c postgis

                                                PGPASSWORD=<POSTGRES_PASSWORD> tethys db configure --username <TETHYS_DB_USERNAME> --password <TETHYS_DB_PASSWORD> --superuser-name <TETHYS_DB_SUPER_USERNAME> --superuser-password <TETHYS_DB_SUPER_PASSWORD> --portal-superuser-name <PORTAL_SUPERUSER_USERNAME> --portal-superuser-email '<PORTAL_SUPERUSER_EMAIL>' --portal-superuser-pass <PORTAL_SUPERUSER_PASSWORD>

                                       #. Install `r-nasaaccess` in the tethsy environment:
                                       ::

                                          conda install -c conda-forge r-nasaaccess

                                       #. Initialize tables in persistent store databases:
                                       ::

                                          tethys syncstores nasaaccess

                                       #. Finally start the Tethys development server:
                                       ::

                                          tethys manage start

   - Production:



Source Code
***********

The NASAaccess source code is available on Github:

  - https://github.com/imohamme/tethys_nasaaccess
