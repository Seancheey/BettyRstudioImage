# Start with the rocker/rstudio image
FROM rocker/rstudio:latest

# Install required system dependencies
RUN apt-get update && apt-get install -y \
    libssl-dev \
    libcurl4-openssl-dev \
    unixodbc-dev \
    libxml2-dev \
    libmariadb-dev \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install R packages
RUN R -e "install.packages(c('hal9001', 'dplyr', 'ggplot2', 'caret', 'glmnet', 'ranger'))"
# v2 install
RUN R -e "install.packages(c('tidyverse'))"
# v3 install
RUN R -e "install.packages(c('doParallel', 'mice', 'xgboost'))"

# Expose RStudio Server port
EXPOSE 8787

# Set default command
CMD ["/init"]

