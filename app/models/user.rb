class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bicycles

  has_many :usages
  has_many :used_bicycles, through: :usages, source: :bicycle

  def to_s
    name
  end
end
