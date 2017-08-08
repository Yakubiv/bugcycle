class BicyclePolicy < ApplicationPolicy
  attr_reader :user, :bicycle

  def initialize(user, bicycle)
    @user = user
    @bicycle = bicycle
  end

  def can_suggest_improves?
    !owner? && first_suggestion?
  end

  def see_suggestion?
    owner? || suggested?
  end

  def merge_suggestion?
    owner?
  end

  def destroy?
    owner?
  end

  private

  def first_suggestion?
    user.suggestions.where(bicycle_id: bicycle.id).count == 0
  end

  def owner?
    user == bicycle.user
  end

  def suggested?
    bicycle.suggestions.where(user_id: user.id).count > 0
  end
end
