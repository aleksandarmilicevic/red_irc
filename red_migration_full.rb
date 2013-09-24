class UpdateTables20130801232218 < ActiveRecord::Migration
  def change
    create_table :web_clients do |t|
      t.column :auth_token, :string
      t.references :user
      t.column :user_type, :string
      t.references :user
      t.column :user_type, :string
      t.column :type, :string

      t.timestamps 
    end

    create_table :web_servers do |t|
      t.column :type, :string

      t.timestamps 
    end

    create_table :auth_users do |t|
      t.column :name, :string
      t.column :email, :string
      t.column :password_hash, :string
      t.column :remember_token, :string
      t.column :type, :string

      t.timestamps 
    end

    create_table :msgs do |t|
      t.column :text, :text
      t.references :sender
      t.column :sender_type, :string
      t.references :chat_room_as_message

      t.timestamps 
    end

    create_table :chat_rooms do |t|
      t.column :name, :string
      t.references :server_as_room
      t.column :server_as_room_type, :string

      t.timestamps 
    end
  end
end
