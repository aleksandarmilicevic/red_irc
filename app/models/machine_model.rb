require 'red/stdlib/web/auth/model'

include RedLib::Web::Auth

#===========================================================
# Machine model
#===========================================================
Red::Dsl.machine_model do
  
  machine Client < AuthClient do
    refs user: User
  end
  
  machine Server < AuthServer do
    owns rooms: (set ChatRoom)
  end
  
end 
