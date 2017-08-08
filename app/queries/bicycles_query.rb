class BicyclesQuery < BaseQuery
  model Bicycle

  def search(category: nil, current_user: nil)
    bicycles = scope.includes(:category)
    bicycles = new(bicycles).no_usage_by(current_user)
    bicycles = new(bicycles).by_category(category) unless category.blank?
    bicycles
  end

  def by_category(category)
    scope.joins(:category).where(categories: {name: category})
  end

  def no_usage_by(current_user)
    scope.where.not(id: current_user.used_bicycles.ids)
  end
end
