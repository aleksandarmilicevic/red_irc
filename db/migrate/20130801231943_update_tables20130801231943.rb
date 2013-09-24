class UpdateTables20130801231943 < ActiveRecord::Migration
  def change



    # ------------------------------:
    # migration for table msgs 
    # ------------------------------:

    # obsolete columns:
    remove_column :msgs, :chat_rooms_as_message_id

    # new columns:
    add_column :msgs, :chat_room_as_message_id, :integer
    add_index :msgs, :chat_room_as_message_id

    # ------------------------------:
    # migration for table chat_rooms 
    # ------------------------------:

    # obsolete columns:
    remove_column :chat_rooms, :servers_as_room_id
    remove_column :chat_rooms, :servers_as_room_type

    # new columns:
    add_column :chat_rooms, :server_as_room_id, :integer
    add_index :chat_rooms, :server_as_room_id
    add_column :chat_rooms, :server_as_room_type, :string
  end
end
