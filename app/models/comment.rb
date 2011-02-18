class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body, :type => String
  
  referenced_in :creater, :class_name => 'User'
  referenced_in :updater, :class_name => 'User'

  embedded_in :post, :inverse_of => :comments
end
