class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show 
    @project = Project.find(params[:id])

    if @project.albums.last.present?
      @todays_album = @project.albums.last 
    else
      @todays_album = ProjectAlbumGenerator.call(@project)
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      render :new, status: :unprocessable_entity
    end
  end

  private 
  def project_params
    params.expect(project: [ :name ])
  end
  
end
