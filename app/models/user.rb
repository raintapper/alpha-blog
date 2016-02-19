class User < ActiveRecord::Base
  has_many :articles


  before_save { self.email = email.downcase }

  validates :username, presence: true, uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX= /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/i

  validates :email, presence: true, uniqueness: {case_sensitve: false},
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }

  has_secure_password
end