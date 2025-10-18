class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show 
    @project = Project.find_by(params[:name_slug])

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
    @project.name_slug = @project.name_without_spaces
    if @project.save
      @todays_album = ProjectAlbumGenerator.call(@project)
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
