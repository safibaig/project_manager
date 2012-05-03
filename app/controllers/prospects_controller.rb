class ProspectsController < ApplicationController
  
  layout "dashboard"
  before_filter :authenticate_user!
  
  add_breadcrumb "Prospects", "/prospects", :except => [:index,:interested_in_software, 
                                                        :interested_in_graphic_design,
                                                        :interested_in_industrial_design,
                                                        :interested_in_business_planning,
                                                        :interested_in_research_and_development,
                                                        :filter_by_status]
  add_breadcrumb "New prospect", "",  :only => [:new, :create]
  add_breadcrumb "Editing prospect","", :only => [:edit, :update]
  
  def index
    @prospects = Prospect.search(params)
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
      redirect_to prospects_path, :flash => {:success => 'Prospect was successfully updated.' }
    else
      render :edit
    end
  end
  
  def destroy
    @prospect = Prospect.find(params[:id])
    @prospect.destroy
    redirect_to prospects_path, :success => 'Prospect was successfully destroyed.' 
  end
  
  def filter_by_status
    @prospects = Prospect.find_by_status(params[:status])
  end
  
  def interested_in_software
    @prospects = Prospect.interested_in_software
    render :index
  end
  
  def interested_in_graphic_design
     @prospects = Prospect.interested_in_graphic_design
     render :index
   end
  
  def interested_in_industrial_design
    @prospects = Prospect.interested_in_industrial_design
    render :index
  end
    
  def interested_in_business_planning
     @prospects = Prospect.interested_in_business_planning
     render :index
  end
  
  def interested_in_research_and_development
    @prospects = Prospect.interested_in_research_and_development
    render :index
  end
  
end
