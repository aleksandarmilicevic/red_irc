class UpdateTables20130731210043 < ActiveRecord::Migration
  def change


    # ------------------------------:
    # migration for table auth_users 
    # ------------------------------:

    # new columns:
    add_column :auth_users, :remember_token, :string


  end
end
