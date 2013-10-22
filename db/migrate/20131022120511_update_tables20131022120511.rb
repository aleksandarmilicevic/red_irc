class UpdateTables20131022120511 < ActiveRecord::Migration
  def change


    # ------------------------------:
    # migration for table auth_users 
    # ------------------------------:

    # obsolete columns:
    remove_column :auth_users, :status


  end
end
