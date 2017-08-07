class Bicycle < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :name, uniqueness: { case_sensitive: false }
end
