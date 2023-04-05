library(spotifyr)

artists <- c("Amaarae", "Baby Tate", "bbno$", "CKay", "Cochise", "Coi Leray",
             "Doechii", "Eyedress", "Feid", "Jay Wheeler", "Kali", "Magdelena Bay",
             "Måneskin", "PinkPantheress", "RealestK", "Saucy Santana",
             "Shygirl", "TisaKorean", "YungManny")

audio_features <- lapply(artists, get_artist_audio_features)

# Add artist name to each data frame in the list
for (i in seq_along(audio_features)) {
  audio_features[[i]]$artist_name <- artists[i]
}

# Combine list of dataframes into one dataframe
radiohead <- do.call(rbind, audio_features)

# Save dataframe to RDS file
saveRDS(radiohead, "radiohead.rds")

