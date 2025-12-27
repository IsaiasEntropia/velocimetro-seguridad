
## Esta función toma como argumento x que es el texto abreviado de los meses y devuelve el valor del mes en entero
mes_abr <- function(x) { 
  r <- case_when( 
    x == "Ene" ~ 1, 
    x == "Feb" ~ 2,
    x == "Mar" ~ 3,
    x == "Abr" ~ 4,
    x == "May" ~ 5,
    x == "Jun" ~ 6,
    x == "Jul" ~ 7,
    x == "Ago" ~ 8,
    x == "Sep" ~ 9,
    x == "Oct" ~ 10, 
    x == "Nov" ~ 11,
    x == "Dec" ~ 12 )  
  return(r)
  
}

### Diccionario de meses para transformar a Date

meses <- c("enero", "febrero", "marzo", "abril", "mayo", "junio", 
           "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre")


## Esta función toma como argumento st que es el nombre del archivo del SENSP y te regresa los días transcuridos hasta la fecha de corte

dias_corte_sesnp <- function(st) {
  anio_corte <- substr(st, 31, 34)
  mes_corte <- substr(st, 28, 30)
  mes_corte <- str_to_title(mes_corte)
  mes_corte <- mes_abr(mes_corte)
  fecha_corte_foo <- paste0(anio_corte,'-', mes_corte, '-01')
  fecha_corte <- ceiling_date(as.Date(fecha_corte_foo), unit = "month") - days(1)
  dias_anio <- yday(fecha_corte)
  return(dias_anio) }


#### 

tema_entropia <- 
  theme(
    plot.title = element_text(size = 30, face = "bold"), # Font size set to 16 and bold.
    panel.border = element_blank(), 
    panel.grid.major.y = element_line(color = "#EDECEC",
                                      linewidth = 1,
                                      linetype =1),    
    
    #panel.grid.major = element_blank(),
    #panel.grid.minor = element_blank(), 
    axis.text=element_text(size=15 ,face="bold"),
    axis.title=element_text(size=18,face="bold"),
    plot.caption = element_text(hjust = 0.05) ,
    plot.caption.position = "plot",
    plot.margin = margin(4, 4, 4, 4),
    axis.line = element_blank(),
    panel.background = element_rect(fill =  'white' )
    #fill, colour, size, linetype, color)
  )
