class UpdateTables20130801215721 < ActiveRecord::Migration
  def change



    # ------------------------------:
    # migration for table msgs 
    # ------------------------------:

    # new columns:
    add_column :msgs, :chat_rooms_as_message_id, :integer
    add_index :msgs, :chat_rooms_as_message_id

    # ------------------------------:
    # migration for table chat_rooms 
    # ------------------------------:

    # new columns:
    add_column :chat_rooms, :servers_as_room_id, :integer
    add_index :chat_rooms, :servers_as_room_id
    add_column :chat_rooms, :servers_as_room_type, :string
  end
end
