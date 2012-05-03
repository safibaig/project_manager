class EmployeesController < ApplicationController
  
  layout "dashboard"
  before_filter :authenticate_user!
  
  def index
    @employees = User.search(params)
  end

  def show
  end

  def new
    @employee = User.new
  end
  
  def create
    @employee = User.new(params[:user])
    if @employee.save
      redirect_to employees_path, :success => 'Employee was successfully created.' 
    else
      render :new
    end
  end
  
  
  def destroy
    @employee = User.find(params[:id])
    @employee.destroy
    redirect_to employees_path, :success => 'Employee was successfully destroyed.' 
  end
  
  def edit
  end
  
  def filter_by_status
    @employees = User.find_by_status(params[:status])
  end
  
  def male
    @employees = User.male
    render :index
  end
  
  def female
    @employees = User.female
    render :index
  end
end
