class SubsUser < ApplicationRecord
  validates_uniqueness_of :user_id, :scope => [:sub_id]
  
  belongs_to :user,
  foreign_key: :user_id,
  class_name: :User
  
  belongs_to :sub,
  foreign_key: :sub_id,
  class_name: :Sub
end
