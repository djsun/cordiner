class ProjectsController < ApplicationController

  def index
    @projects = API::Project.all
  end

  def show
    @project = API::Project.find(params[:id])
  end

  protected

end
