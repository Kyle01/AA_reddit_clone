class User < ApplicationRecord
  validates :username, :session_token, uniqueness:true, presence: true
  validates :password, length: {minimum: 6, allow_nil:true}
  validates :password_digest, presence: true
  
  attr_reader :password
  
  after_initialize :ensure_session_token
  
  has_many :subs,
  foreign_key: :moderator_id,
  class_name: :Sub
  
  has_many :posts,
  foreign_key: :author_id,
  class_name: :Post
  
  has_many :subs_user,
  foreign_key: :user_id,
  class_name: :SubsUser
  
  has_many :subscriptions,
  through: :subs_user,
  source: :sub
  
  has_many :comments,
  foreign_key: :author_id,
  class_name: :Comment
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end
  
  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end
  
  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end
  
  def User.find_by_credentials(username, password)
    user = User.find_by(username: username)
    user && user.is_password?(password) ? user : nil
  end
  
end
