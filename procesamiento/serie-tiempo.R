# El archivo fun_aux.R contiene algunas funciones útiles para el procesamiento de datos

if (!require("pacman")) install.packages("pacman")
pacman::p_load(dplyr, readr, tidyr, readxl,janitor,ggplot2,
               here, stringr, lubridate, purrr, forecast)

source("fun_aux.R")