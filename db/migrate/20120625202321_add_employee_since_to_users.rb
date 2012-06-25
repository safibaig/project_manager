class AddEmployeeSinceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :employee_since, :date

  end
end
