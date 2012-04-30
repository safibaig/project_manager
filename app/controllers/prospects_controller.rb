class ProspectsController < ApplicationController
  
  add_breadcrumb "Prospects", "/prospects", :except => :index
  add_breadcrumb "New prospect", "",  :only => [:new, :create]
  add_breadcrumb "Editing prospect","", :only => [:edit, :update]
  
  def index
    @prospects = Prospect.all
  end

  def show
    @prospect = Prospect.find(params[:id])
    add_breadcrumb "#{@prospect.company_name}"
  end

  def new
    @prospect = Prospect.new
  end
  
  def create
    @prospect = Prospect.new(params[:prospect])
    if @prospect.save
      redirect_to prospects_path, :success => 'Prospect was successfully created.' 
    else
      render :new
    end
  end

  def edit
    @prospect = Prospect.find(params[:id])
  end
  
  def update
    @prospect = Prospect.find(params[:id])
    if @prospect.update_attributes(params[:prospect])
      redirect_to prospects_path, :success => 'Prospect was successfully updated.' 
    else
      render :edit
    end
  end
  
  def destroy
    @prospect = Prospect.find(params[:id])
    @prospect.destroy
    redirect_to prospects_path, :success => 'Prospect was successfully destroyed.' 
  end
  
end
