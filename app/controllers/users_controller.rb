class UsersController < ApplicationController
  
  def index
    @users = User.where("name #{LIKE} ?", "%#{params[:q]}%")
    respond_to do |format|
      format.html
      format.json { render :json => @users.map(&:attributes) }
    end
  end

end
