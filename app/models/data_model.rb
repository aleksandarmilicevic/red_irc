require 'red/stdlib/web/auth/model'
require 'red/stdlib/crud/model'

include RedLib::Web::Auth

#===========================================================
# Data model
#===========================================================
Red::Dsl.data_model do
  record User < AuthUser do
    # refs status: String
  end
  
  record Msg do
    refs text: Text, 
         sender: User
  end
  
  record ChatRoom do
    refs name: String, 
         members: (set User)
    owns messages: (set Msg)
  end  
end
