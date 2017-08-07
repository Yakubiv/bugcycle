class BicyclePolicy < ApplicationPolicy
  attr_reader :user, :bicycle

  def initialize(user, bicycle)
    @user = user
    @bicycle = bicycle
  end

  def show?
  end

  def update?
  end

  def destroy?
    user == bicycle.user
  end
end
