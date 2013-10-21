class UpdateTables20131021182232 < ActiveRecord::Migration
  def change

    create_table :web_servers_web_clients_online_clients, {:id=>false} do |t|
      t.column :web_server_id, :int
      t.column :web_client_id, :int
    end




  end
end
