class Bicycle < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :name, uniqueness: true

  has_many :usages
  # has_many :bicycle_users, through: :usages, source: :user
end
