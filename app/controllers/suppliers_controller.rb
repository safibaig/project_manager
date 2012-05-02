class SuppliersController < ApplicationController
  
  add_breadcrumb "Suppliers", "/suppliers", :except => :index
  add_breadcrumb "New supplier", "",  :only => [:new, :create]
  add_breadcrumb "Editing supplier","", :only => [:edit, :update]
  
  def index
    @suppliers = Supplier.find_by_params(params[:q])
    respond_to do |format|
      format.html
      format.json {render :json => @suppliers.map(&:attributes)}  
    end
  end

  def show
    @supplier = Supplier.find(params[:id])
    add_breadcrumb "#{@supplier.company_name}"
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(params[:supplier])
    if @supplier.save
      redirect_to suppliers_path, :flash => {:success => 'Supplier was saved succesfully'}
    else
      render :new
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end
  
  def update
    @supplier = Supplier.find(params[:id])
    if @supplier.update_attributes(params[:supplier])
      redirect_to suppliers_path, :flash => {:success => 'Supplier was updated succesfully'}
    else
      render :edit
    end
  end
  
  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy
    redirect_to suppliers_path, :flash => {:success => 'Supplier was destroyed'}
  end
end
