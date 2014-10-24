class Problem < ActiveRecord::Base
  belongs_to :user
  has_many :notes

  validates :description, presence: true
  validates :tried, presence: true
end
