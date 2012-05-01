class EmployeesController < ApplicationController
  
  def index
    @employees = User.employees
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
end
