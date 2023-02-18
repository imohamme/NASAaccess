===============================
NASAaccess Python Guide
===============================


.. image:: https://anaconda.org/conda-forge/r-nasaaccess/badges/platforms.svg
   :target: https://anaconda.org/conda-forge/r-nasaaccess
   :alt: Platform


   
Prerequisites
*************

On a local machine the user should have installed the following programs as well as setting up a user account.  The list below gives a summary of what is needed to be done prior to work with *NASAaccess* software on any local machine:

  * Installing `Anaconda <https://docs.anaconda.com/anaconda/install/index.html>`_  or `miniconda <https://docs.conda.io/en/latest/miniconda.html>`_ 

  * *NASAaccess* software needs a user registration access with `Earthdata <https://earthdata.nasa.gov/>`_. Users should set up a registration account(s) with `Earthdata <https://earthdata.nasa.gov/>`_ login as well as well as authorizing `NASA <https://www.nasa.gov/>`_ `GES DISC <https://disc.gsfc.nasa.gov/>`_ data access.  Please refer to https://disc.gsfc.nasa.gov/data-access for further details.

  * After registration with `Earthdata <https://earthdata.nasa.gov/>`_ *NASAaccess* software package users should create a reference file (*netrc*) with `Earthdata <https://earthdata.nasa.gov/>`_ credentials stored in it to streamline the retrieval access to `NASA <https://www.nasa.gov/>`_ servers.

      * Creating the *.netrc* file at the user machine *Home* directory and storing the user `NASA <https://www.nasa.gov/>`_ `GES DISC <https://disc.gsfc.nasa.gov/>`_ logging information in it is needed to execute the NASAaccess package commands. Accessing data at NASA servers is further explained at `NASA earth data wiki <https://wiki.earthdata.nasa.gov/display/EL/How+To+Access+Data+With+cURL+And+Wget>`_. The *.netrc* file should look like:


        .. figure::  images/netrc.png
               :scale: 30%
               :align: center
               :alt: netrc file layout



        .. note::

                  In your *.netrc* file <uid> is your user name and <password> is your Earthdata Login password.


      * For Windows users the `NASA <https://www.nasa.gov/>`_ `GES DISC <https://disc.gsfc.nasa.gov/>`_ logging information should be saved in a file *\_netrc* beside the *.netrc* file explained above. Define a %HOME% variable in your Environment Variables by picking any directory you want to be referenced as your %HOME% directory. In many machines %HOME% directory is already set to be your personal `Documents` folder (i.e., `C:\/Users\/yourname\/Documents`). Store your netrc file(s) in your `Documents` or the specfied %HOME% directory.


NASAaccess Conda Package Installation
**************************************

Installing the `r-nasaaccess` conda package is obtained by:


      .. code-block::


            conda install -c conda-forge r-nasaaccess




Getting Started with the NASAaccess Conda package
**************************************************

The *NASAaccess* commands can be easily executed in the conda environment by writing the *NASAaccess* commands to a separate file (e.g., work.R) and running it by calling the Rscript executable in conda.

         ::

            Rscript work.R



More examples on NASAaccess functionalities can be found `Here <https://imohamme.github.io/NASAaccess/articles/About.html>`_.
