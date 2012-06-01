class ClientsController < ApplicationController
  
  layout "dashboard"
  before_filter :authenticate_user!

  def index
    @clients = Client.search(params)
    respond_to do |format|
      format.html
      format.json { render :json => @clients.map(&:attributes) }
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def edit
    @client = Client.find(params[:id])
  end

  def create
    @client = Client.new(params[:client])
    if @client.save
      redirect_to clients_path, :flash => {:success => 'Client was successfully created.'}
    else
      render :action => "new"
    end
  end

  def update
    @client = Client.find(params[:id])
    if @client.update_attributes(params[:client]) 
      redirect_to clients_path, :flash => {:success => 'Client was successfully updated.'}
    else
      render :action => "edit"
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to clients_url,:flash => {:success => 'Client was successfully destroyed.'}
  end
  
  def interested_in_software
    @clients = Client.interested_in_software.page(params[:page])
    render :index
  end
  
  def interested_in_graphic_design
     @clients = Client.interested_in_graphic_design.page(params[:page])
     render :index
   end
  
  def interested_in_industrial_design
    @clients = Client.interested_in_industrial_design.page(params[:page])
    render :index
  end
    
  def interested_in_business_planning
     @clients = Client.interested_in_business_planning.page(params[:page])
     render :index
  end
  
   def interested_in_research_and_development
      @clients = Client.interested_in_research_and_development.page(params[:page])
      render :index
    end
    
  def by_date_range
    @clients = Client.by_date_range(params[:from], params[:to]).page(params[:page])
    render :index
  end
end
