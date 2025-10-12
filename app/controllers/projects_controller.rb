class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show 
    @project = Project.find(params[:id])
    @todays_album = Album.first
  end

end
