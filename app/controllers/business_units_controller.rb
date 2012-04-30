class BusinessUnitsController < ApplicationController
  
  def index
    @business_units = BusinessUnit.where("name like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.html
      format.json { render :json => @business_units.map(&:attributes) }
    end
  end

end
