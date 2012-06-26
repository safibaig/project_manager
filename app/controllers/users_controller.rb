class UsersController < ApplicationController
  
  layout "dashboard"
  before_filter :authenticate_user!
  
  def index
    @users = User.find_by_params(params[:q])
    respond_to do |format|
      format.html
      format.json { render :json => @users.map(&:attributes) }
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      #sign_in(@user, :bypass => true)
      redirect_to @user
    else
      render :edit
    end
  end

end
