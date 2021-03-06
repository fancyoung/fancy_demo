class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, :type => String
  field :body, :type => String

  referenced_in :creater, :class_name => 'User'
  referenced_in :updater, :class_name => 'User'
  
  embeds_many :comments
end
