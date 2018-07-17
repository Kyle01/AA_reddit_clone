class Sub < ApplicationRecord
  validates :title, :description, presence: true
  
  belongs_to :user,
  foreign_key: :moderator_id,
  class_name: :User
  
  has_many :posts,
  foreign_key: :sub_id,
  class_name: :Post
  
  has_many :subs_user,
  foreign_key: :sub_id,
  class_name: :SubsUser
  
  has_many :subscribers,
  through: :subs_user,
  source: :user
end
