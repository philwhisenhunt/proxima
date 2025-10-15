class SpotifyURIPopulator

    def call
        throttle_seconds = 0.5
        Album.where(spotify_uri: [nil, '']).find_each(batch_size: 50) do |album|
            puts "Fetching URI for #{album.title}} - #{album.artist}"
            SpotifyAlbumUriFetcher.call(album)
            sleep(throttle_seconds)
        rescue => e
            Rails.logger.error("Error for album #{album.id}: #{e.class} #{e.message}")
        end
    end

end