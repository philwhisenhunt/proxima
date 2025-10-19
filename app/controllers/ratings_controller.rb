class RatingsController < ApplicationController
  def create
    @project_album = ProjectAlbum.find(params[:project_album_id])
    @rating = @project_album.build_rating(rating_params)

    if @rating.save
      redirect_to @project_album.project, alert: "Successfully rated album with #{@project_album.rating.stars} stars"
    else
      redirect_to @project_album.project, alert: "Submit a valid rating"
    end
  end

  def rating_params
    params.require(:rating).permit(:stars)
  end

end
