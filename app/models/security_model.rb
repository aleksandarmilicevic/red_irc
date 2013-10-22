require_relative 'data_model'

#===========================================================
# Security model
#===========================================================
Red::Dsl.security_model do
  policy EditUserData do
    principal client: Client
    global    server: Server

    # @desc = "Can't edit other people's data"
    # write User.*.when do |user|
    #   client.user == user
    # end

    # read User.status.when do |user|
    #   client.user == user ||
    #     server.rooms.some? {|room| ([user, client.user] - room.members).empty?}
    # end

    # restrict ChatRoom.messages.reject do |room, msg|
    #   msg.sender != client.user &&
    #     (msg.text.starts_with?("@") && !msg.text.starts_with?("@#{client.user.name} "))
    # end
  end
end
