class ProjectAlbumGenerator

    def self.call(project)
        albums = Album.where.not(project: project)
        used_album_ids = project.project_albums.pluck(:album_id)
        album = Album.where.not(id: used_album_ids).order("RANDOM()").first

        return unless album #if no album, then we have generated all the albums

        project.project_albums.create!(album: album)
    end

end