class UpdateTables20130809185616 < ActiveRecord::Migration
  def change


    # ------------------------------:
    # migration for table auth_users 
    # ------------------------------:

    # new columns:
    add_column :auth_users, :status, :string


  end
end
