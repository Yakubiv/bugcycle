class Bicycle < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :name, uniqueness: true

  scope :except_usage, -> { where(usage: false) }
end
