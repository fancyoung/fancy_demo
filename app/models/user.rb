class User
  include Mongoid::Document
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :invitable, :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  field :name, :type => String
  index :name
  validates_length_of :name, :minimum => 2, :maximum => 30
  
  mount_uploader :avatar, AvatarUploader

  # references_many :posts, :inverse_of => :creater
  # references_many :posts, :inverse_of => :updater
  # references_many :comments, :inverse_of => :creater
  # references_many :comments, :inverse_of => :updater
end
