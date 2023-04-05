# Load the audio features data frame
audio_features_df_2021 <- readRDS(here::here("inputs/data/all_artists_audio_features.rds"))

# Filter out rows with album_release_year after 2021
audio_features_df_2021 <- audio_features_df[audio_features_df$album_release_year <= 2021, ]

# Save the updated data frame to a new file
saveRDS(audio_features_df, file = here::here("inputs/data/before2021.rds"))