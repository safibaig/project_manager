class BusinessUnitsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @business_units = BusinessUnit.where("name #{LIKE} ?", "%#{params[:q]}%")
    respond_to do |format|
      format.html
      format.json { render :json => @business_units.map(&:attributes) }
    end
  end

end
