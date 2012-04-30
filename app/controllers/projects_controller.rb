class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  
  add_breadcrumb "Projects", "/projects", :except => :index
  add_breadcrumb "New project", "",  :only => [:new, :create]
  add_breadcrumb "Editing project","", :only => [:edit, :update]
  
  def index
    @projects = Project.all
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
      redirect_to projects_path, :flash => {:success => 'Project was updated succesfully'}
    else
      render :edit
    end
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path, :flash => {:success => 'Project was destroyed succesfully'}
  end
end