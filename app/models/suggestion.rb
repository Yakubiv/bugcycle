class Suggestion < ApplicationRecord
  belongs_to :bicycle
  belongs_to :user
  belongs_to :category

  validate :uniq_name

  def status
    return 'Pending' if approved.nil?
    approved? ? 'Approved' : 'Disapproved'
  end

  private

  def uniq_name
    if Bicycle.where.not(id: bicycle.id).exists?(name: name)
      errors.add(:name, 'has been already taken')
    end
  end
end
