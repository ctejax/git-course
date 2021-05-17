library(readxl)
library(dbplyr)
library(tidyverse)

id <- read_excel("C:/users/ctejax/Downloads/spof_home.xlsx")

id2 <- id %>% select(Hub, Comentario) %>%  collect()

npart <- c("MPC7E|EX9200|MPC2E")

def <- id2 %>% select(Hub, Comentario) %>% 
  filter(str_detect(Comentario, npart))
