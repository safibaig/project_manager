class ProjectsController < ApplicationController
  
  layout "dashboard"
  
  before_filter :authenticate_user!
  
  def index
    @projects = Project.search(params)
  end

  def show
    @project = Project.find(params[:id])
    add_breadcrumb "#{@project.name}"
  end

  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to projects_path, :flash => {:success => 'Project was saved succesfully'}
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to @project, :flash => {:success => 'Project was updated succesfully'}
    else
      render :edit
    end
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path, :flash => {:success => 'Project was destroyed succesfully'}
  end
  
  def internal
    @projects = Project.internal.page(params[:page])
    render :index
  end
  
  def external
    @projects = Project.external.page(params[:page])
    render :index
  end
  
  def by_date_range
    @projects = Project.by_date_range(params[:from], params[:to]).page(params[:page])
    render :index
  end
  
end
