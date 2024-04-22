# Install the readr package if not already installed
if (!require(readr)) {
  install.packages("readr", repos = "https://cloud.r-project.org/")
}

# Use read_csv to read the file
dados <- readr::read_csv("dailyGrouping.feather")