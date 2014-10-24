class User < ActiveRecord::Base
  has_many :problems
  has_many :notes, through: :problems

  has_secure_password

  validates :name, presence: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: /\A[\w\-\.]+@[\w\-\.]+\Z/, message: "must be a valid email address" }

end
