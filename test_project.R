library(rvest)
library(httr)
library(httr2)
library(jsonlite)


sofa_player_stats_league<-function(player_id, league_id) {
  url<-httr::GET('https://www.sofascore.com/api/v1/event/12076173/statistics')
  url2<-httr::GET('https://www.sofascore.com/api/v1/player/991011/unique-tournament/1/season/56953/statistics/overall')
}



#statistic api

url<-httr::GET('https://www.sofascore.com/api/v1/event/12076173/statistics')
veri<-jsonlite::fromJSON(rawToChar(url$content))
deneme<-veri$statistics
deneme[[2]][[1]][[2]][[3]][[2]][[1]]



#overall api

url<-httr::GET('https://www.sofascore.com/api/v1/player/991011/unique-tournament/1/season/56953/statistics/overall')
veri<-jsonlite::fromJSON(rawToChar(url$content))
deneme<-veri$statistics
deneme[1][1] %>% stringr::str_squish()
deneme[1]
deneme


install.packages('tidyverse')
install.packages('RSelenium')
library(tidyverse)
library(RSelenium)
library(rvest)
library(httr)

rD <- rsDriver(browser = "chrome")
remDr <- rD$client

remDr$navigate("https://www.worldometers.info/coronavirus/")

# Extract the total number of cases
total_cases <- remDr$findElement(using = "xpath",
                                 value = '//*[@id="maincounter-wrap"]/div/span')
total_cases <- total_cases$getElementText()[[1]]

# Extract the total number of deaths
total_deaths <- remDr$findElement(using = "xpath",
                                  value = '/html/body/div[3]/div[2]/div[1]/div/div[6]/div/span')
total_deaths <- total_deaths$getElementText()[[1]]

# Extract the total number of recoveries
total_recoveries <- remDr$findElement(using = "xpath",
                                      value = '/html/body/div[3]/div[2]/div[1]/div/div[7]/div/span')
total_recoveries <- total_recoveries$getElementText()[[1]]

# Print the extracted data
cat("Total Cases: ", total_cases, "\n")
cat("Total Deaths: ", total_deaths, "\n")
cat("Total Recoveries: ", total_recoveries, "\n")

# Close the server
remDr$close()
selServ$stop()
