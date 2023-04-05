library(spotifyr)

artists <- c("Amaarae", "Baby Tate", "bbno$", "CKay", "Cochise", "Coi Leray",
             "Doechii", "Eyedress", "Feid", "Jay Wheeler", "Kali", "Magdelena Bay",
             "Måneskin", "PinkPantheress", "RealestK", "Saucy Santana",
             "Shygirl", "TisaKorean", "YungManny")

audio_features_list <- list()

for (artist in artists) {
  audio_features <- get_artist_audio_features(artist)
  if (!is.null(audio_features)) {
    audio_features$artist_name <- artist
    audio_features_list[[artist]] <- audio_features
  }
}

audio_features_df <- do.call(rbind, audio_features_list)

# Save combined data frame to RDS file in inputs/data directory
saveRDS(audio_features_df, file = here::here("inputs/data/all_artists_audio_features.rds"))
