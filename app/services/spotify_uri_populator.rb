class SpotifyUriPopulator

    def call
        throttle_seconds = 0.5
        Album.where(spotify_link: [nil, '']).find_each(batch_size: 50) do |album|
            puts "Fetching URI for #{album.title}} - #{album.artist}"
            SpotifyUriFetcher.call(album)
            sleep(throttle_seconds)
        rescue => e
            Rails.logger.error("Error for album #{album.id}: #{e.class} #{e.message}")
        end
    end

end