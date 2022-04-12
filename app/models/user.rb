class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 4 }
  
  def self.authenticate_with_credentials(email, password)    
    user = User.find_by_email(email)&.authenticate(password)    
    if user
      return user
    else
      nil
    end
  end
end