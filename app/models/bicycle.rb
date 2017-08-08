class Bicycle < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :name, uniqueness: { case_sensitive: false }

  has_many :suggestions

  has_many :usages
  # has_many :bicycle_users, through: :usages, source: :user

  def to_s
    name
  end
end
