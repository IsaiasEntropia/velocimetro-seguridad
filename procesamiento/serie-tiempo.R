# El archivo fun_aux.R contiene algunas funciones útiles para el procesamiento de datos

if (!require("pacman")) install.packages("pacman")
library(here)
pacman::p_load(dplyr, readr, tidyr, janitor,ggplot2,
               stringr, lubridate, purrr, forecast)

source("../auxiliares/fun_aux.R")

# Leer el archivo
h <- read_csv(('../datos/conteo_mes.csv'))

# Ver que se cargó bien
glimpse(h)

## Desarrollar una serie de tiempo
ts_h <- h |> 
  group_by(mes_ts) %>%
  summarise(t = sum(conteo))

# Con base en esto 
dim(ts_h)
tail(ts_h)

###

ts_h <- ts_h[ -132, ]
tail(ts_h)

### Serie de tiempo mensual

ts_mes <- ts(ts_h$t , 
             start = c(as.numeric(substr(ts_h$mes_ts[1], 1, 4)), 
                       as.numeric(substr(ts_h$mes_ts[1], 6, 7))), 
             frequency = 12)

# Lo primero que queremos hacer es graficar la serie.
plot.ts(ts_mes)


### Descomponemos la serie 

dec_ts <- decompose(ts_mes)
plot(dec_ts)

stl_decomp <- stl(ts_mes , s.window = 12)#, t.window = 15)
#s.window = "periodic")
plot(stl_decomp)


## Holt winters

ht <- HoltWinters(ts_mes) #, beta=FALSE, gamma=FALSE)

ht

plot(ht)

ht_forec <- hw(ts_mes, seasonal = "additive", h = 2)

plot(ht_forec)

ht_forec$model

ht_forec


