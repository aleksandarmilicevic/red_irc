require_relative 'data_model'

# #===========================================================
# # Security model
# #===========================================================
# Red::Dsl.security_model do
#   policy HideUserPrivateData do
#     principal client: Client
    
#     restrict User.password_hash.unless do |user, pswd|
#       client.user == user
#     end
    
#     restrict User.status.when do |user, status| 
#       client.user != user &&
#       ChatRoom.none? { |room| 
#         room.members.include?(client.user) &&
#         room.members.include?(user)
#       }
#     end
#   end

#   policy FilterChatRoomMembers do
#     principal client: Client
    
#     restrict ChatRoom.members.reject do |room, member|
#       !room.messages.sender.include?(member) &&
#       client.user != member
#     end
#   end
# end
