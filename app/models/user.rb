class User
  include Mongoid::Document
  
  authenticates_with_sorcery!
  
  field :username, type: String
  field :password, type: String
  
  attr_accessible :username, :password
end
