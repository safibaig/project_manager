class ClientsController < ApplicationController
  before_filter :authenticate_user!

  add_breadcrumb "Clients", "/clients", :except => :index
  add_breadcrumb "New client", "",  :only => [:new, :create]
  add_breadcrumb "Editing client","", :only => [:edit, :update]

  def index
    @clients = Client.where("company_name #{LIKE} ?", "%#{params[:q]}%")
    respond_to do |format|
      format.html
      format.json { render :json => @clients.map(&:attributes) }
    end
  end

  def show
    @client = Client.find(params[:id])
    add_breadcrumb "#{@client.company_name}"
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
end
