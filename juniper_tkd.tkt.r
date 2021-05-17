library(conectigo)
library(dbplyr)
library(tidyverse)

con <- conectar_msql()

ttks <- tbl(con, in_schema("tkd", "tkt")) %>% 
  collect()

modelos <- "[ME]X\\d+|M10|JUNIPER"

ttks2 <- ttks  %>%  select(id, fecha_hora_apertura, configuration_item, description) %>% 
  filter(str_detect(configuration_item, modelos))

write.csv(ttks2, "C:\\Users\\ctejax\\Downloads\\data.csv", row.names = TRUE)

wttks <- tbl(con, in_schema("tkd", "w_ttks")) %>% 
  collect()

wttks2 <- wttks %>% 
  select(ticketid, fecha, configuracion, description) %>% 
  filter(str_detect(configuracion, modelos))
