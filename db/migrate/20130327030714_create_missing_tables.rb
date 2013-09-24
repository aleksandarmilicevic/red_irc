class CreateMissingTables < ActiveRecord::Migration
  def change
    create_table :web_clients do |t| 
      t.column :auth_token, :string
      t.references :user, {:polymorphic=>true}
      t.references :user, {:polymorphic=>true}
      t.column :type, :string

      t.timestamps 
    end

    create_table :web_servers do |t| 
      t.column :type, :string

      t.timestamps 
    end

    create_table :servers_chat_rooms_rooms, {:id=>false} do |t| 
      t.column :server_id, :int
      t.column :chat_room_id, :int
    end

    create_table :auth_users do |t| 
      t.column :name, :string
      t.column :email, :string
      t.column :password_hash, :string
      t.column :type, :string

      t.timestamps 
    end

    create_table :msgs do |t| 
      t.column :text, :text
      t.references :sender, {:polymorphic=>true}

      t.timestamps 
    end

    create_table :chat_rooms do |t| 
      t.column :name, :string

      t.timestamps 
    end

    create_table :chat_rooms_users_members, {:id=>false} do |t| 
      t.column :chat_room_id, :int
      t.column :user_id, :int
    end

    create_table :chat_rooms_msgs_messages, {:id=>false} do |t| 
      t.column :chat_room_id, :int
      t.column :msg_id, :int
    end
  end
end
