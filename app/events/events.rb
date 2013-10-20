#===========================================================
# Event model
#===========================================================
Red::Dsl.event_model do

  #------------------------------------------------------
  # Event +CreateRoom+
  #------------------------------------------------------
  event CreateRoom do
    from client: Client
    to   serv: Server

    params roomName: String

    requires {
      client.user &&
      roomName && roomName != "" &&
      serv.rooms.select{|r| r.name == roomName}.empty?
    }

    def ensures
      room = ChatRoom.create! :name => roomName
      room.members = [client.user]
      serv.rooms << room
      serv.save!

      success "Room '#{room.name}' created"
    end
  end

  #------------------------------------------------------
  # Event +JoinRoom+
  #------------------------------------------------------
  event JoinRoom do
    from client: Client
    to   serv: Server

    params room: ChatRoom

    requires {
      client.user
    }

    ensures {
      room.members << client.user
      room.save!

      success "#{client.user.name} joined '#{room.name}' room"
    }
  end

  #------------------------------------------------------
  # Event +JoinRoom+
  #------------------------------------------------------
  event LeaveRoom do
    from client: Client
    to   serv: Server

    params room: ChatRoom

    requires {
      room.members.include? client.user
    }

    ensures {
      room.members.delete client.user
      room.save!

      success "#{client.user.name} left '#{room.name}' room"
    }
  end

  #------------------------------------------------------
  # Event +SendMsg+
  #------------------------------------------------------
  event SendMsg do
    from client: Client
    to   serv: Server

    params {{
      room: ChatRoom,
      msgText: String
    }}

    @desc = "Must join the room before sending messages"
    requires { room.members.member?(client.user) }

    ensures {
      msg = Msg.create! :text => msgText
      msg.sender = client.user
      msg.save!
      room.messages << msg
      room.save!
    }
  end

end
