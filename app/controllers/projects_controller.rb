class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show 
    @project = Project.find_by!(name_slug: params[:id])

    if @project.albums.last.present?
      @todays_album = @project.albums.last 
    else
      @todays_album = ProjectAlbumGenerator.call(@project)
    end

    @project_album = @project.project_albums.last
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


  def search
    name_slug = params[:name_slug].to_s.strip.downcase.gsub(" ", "-")

    project = Project.find_by(name_slug: name_slug)

    if project
      redirect_to project_path(project)
    else
      flash[:alert] = "No project found"
      redirect_to root_path
    end
  end

  private 
  def project_params
    params.expect(project: [ :name ])
  end
  
end
