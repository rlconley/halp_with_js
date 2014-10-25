class Problem < ActiveRecord::Base
  belongs_to :user
  has_many :notes

  validates :user, presence: true
  validates :description, presence: true
  validates :tried, presence: true
end
