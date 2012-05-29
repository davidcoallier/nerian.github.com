class Post
  include Mongoid::Document
  
  field :title, type: String, default: 'This is a title'
  field :content, type: String, default: 'helloooo'
  field :publish_date, type: Date, default: Date.today
end
