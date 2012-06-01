class ProspectsController < ApplicationController
  
  layout "dashboard"
  before_filter :authenticate_user!
  
  def index
    @prospects = Prospect.search(params)
  end

  def show
    @prospect = Prospect.find(params[:id])
  end

  def new
    @user = current_user
    @prospect = @user.build_prospect
  end
  
  def create
    @user = current_user
    @prospect = @user.build_prospect(params[:prospect])
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
    @prospects = Prospect.find_by_status(params[:status]).page(params[:page])
  end
  
  def interested_in_software
    @prospects = Prospect.interested_in_software.page(params[:page])
    render :index
  end
  
  def interested_in_graphic_design
     @prospects = Prospect.interested_in_graphic_design.page(params[:page])
     render :index
   end
  
  def interested_in_industrial_design
    @prospects = Prospect.interested_in_industrial_design.page(params[:page])
    render :index
  end
    
  def interested_in_business_planning
     @prospects = Prospect.interested_in_business_planning.page(params[:page])
     render :index
  end
  
  def interested_in_research_and_development
    @prospects = Prospect.interested_in_research_and_development.page(params[:page])
    render :index
  end
  
  def by_date_range
    @prospects = Prospect.by_date_range(params[:from], params[:to]).page(params[:page])
    render :index
  end
  
end
