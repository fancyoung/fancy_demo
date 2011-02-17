class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, :type => String
  field :body, :type => String

  references_one :create_by, :class_name => 'User'
  references_one :update_by, :class_name => 'User'
end
