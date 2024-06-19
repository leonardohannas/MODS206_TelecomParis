library(data.table)
library(readr)
library(fixest)

dat <- read_csv("info/weeklyGrouping.csv")

library(dplyr)

dat_stations <- filter(dat, city == 1)

mod_twfe <- feols(pedestrianDeath ~ i(treated_time, treated, ref = -1),
                  data = dat_stations)
png("results/pedestDeathPerWeekStations.png", width = 800, height = 500)
iplot(mod_twfe, ref.line = -1, xlab = "Time to treatment",
      main = "Effect on Pedestrian Deaths",
      ylab = "Estimate and 95% Conf. Int.",
      xlim = c(-9, 8),
      legend = "treated")
axis(1, at = -9:8, labels = -9:8)
dev.off()

mod_twfe <- feols(carCrash ~ i(treated_time, treated, ref = -1),
                  data = dat_stations)
png("results/carCrashPerWeekStations.png", width = 800, height = 500)
iplot(mod_twfe, ref.line = -1, xlab = "Time to treatment",
      main = "Effect on Car Crashes",
      ylab = "Estimate and 95% Conf. Int.",
      xlim = c(-9, 8),
      legend = "treated")
axis(1, at = -9:8, labels = -9:8)
dev.off()

dat_cities <- filter(dat, city %in% c(1, 6))

dat_cities <- mutate(dat_cities, treated = ifelse(city == 1, 1, 0))

mod_twfe <- feols(pedestrianDeath ~ i(treated_time, treated, ref = -1),
                  data = dat_cities)
png("results/pedestDeathPerWeekCities.png", width = 800, height = 500)
iplot(mod_twfe, ref.line = -1, xlab = "Time to treatment",
      main = "Effect on Pedestrian Deaths",
      ylab = "Estimate and 95% Conf. Int.",
      xlim = c(-9, 8),
      legend = "treated")
axis(1, at = -9:8, labels = -9:8)
dev.off()

mod_twfe <- feols(carCrash ~ i(treated_time, treated, ref = -1),
                  data = dat_cities)
png("results/carCrashPerWeekCities.png", width = 800, height = 500)
iplot(mod_twfe, ref.line = -1, xlab = "Time to treatment",
      main = "Effect on Car Crashes",
      ylab = "Estimate and 95% Conf. Int.",
      xlim = c(-9, 8),
      legend = "treated")
axis(1, at = -9:8, labels = -9:8)
dev.off()
