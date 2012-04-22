class ClientsController < ApplicationController
  before_filter :authenticate_user!

  add_breadcrumb "Clients", "/clients"
  add_breadcrumb "New client", "",  :only => [:new, :create]
  add_breadcrumb "Editing client","", :only => [:edit, :update]

  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
    add_breadcrumb "#{@client.name}"
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
      redirect_to clients_path, :success => 'Client was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    @client = Client.find(params[:id])
    if @client.update_attributes(params[:client]) 
      redirect_to clients_path, :success => 'Client was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to clients_url
  end
end
