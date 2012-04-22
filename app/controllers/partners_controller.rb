class PartnersController < ApplicationController
  
  add_breadcrumb "Partners", "/partners", :except => :index
  add_breadcrumb "New partner", "",  :only => [:new, :create]
  add_breadcrumb "Editing partner","", :only => [:edit, :update]
  
  def index
    @partners = Partner.all
  end

  def show
    @partner = Partner.find(params[:id])
    add_breadcrumb "#{@partner.partner_name}"
  end

  def new
    @partner = Partner.new
  end

  def create
    @partner = Partner.new(params[:partner])
    if @partner.save
      redirect_to partners_path, :flash => {:success => 'Partner was saved succesfully'}
    else
      render :new
    end
  end

  def edit
    @partner = Partner.find(params[:id])
  end
  
  def update
    @partner = Partner.find(params[:id])
    if @partner.update_attributes(params[:partner])
      redirect_to partners_path, :flash => {:success => 'Partner was updated succesfully'}
    else
      render :edit
    end
  end
  
  def destroy
    @partner = Partner.find(params[:id])
    @partner.destroy
    redirect_to partners_path, :flash => {:success => 'Partner was destroyed'}
  end
end
