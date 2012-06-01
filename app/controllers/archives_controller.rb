class ArchivesController < ApplicationController
  
  def create
    @project = Project.find(params[:project_id])
    @archive = @project.archives.build(params[:archive])
    if @archive.save
      redirect_to @project, :flash => {:success => "File uploaded successfully"}
    else
      redirect_to @project, :flash => {:success => "Something went wrong"}
    end
  end
  
  def destroy
    @archive = Archive.find(params[:id])
    @archive.destroy
    redirect_to @archive.project, :flash => {:success => "File successfully destroyed"}
  end
  
end
