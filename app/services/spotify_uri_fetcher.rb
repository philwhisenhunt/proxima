class SpotifyUriFetcher
    def self.call(album)
        return if album.spotify_link.present?

        query = album.title
        query += " artist:#{album.artist}" if album.artist.present?
        
        results = RSpotify::Album.search(query, limit: 1)
        spotify_album = results.first

        return unless spotify_album

        uri = spotify_album.uri
        album.update!(spotify_link: uri)
        puts "Added album link for " + album.title
        uri

    rescue RestClient::TooManyRequests => e
        retry_after = e.response.headers[:retry_after].to_i
        sleep(retry_after)
        retry
    end
end