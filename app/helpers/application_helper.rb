module ApplicationHelper
  def active_if?(conditions)
    active_conditions = {
      action: action_name == conditions[:action],
      controller: controller_name == conditions[:controller]
    }.select{ |k,_| conditions.keys.include? k }.values
    return 'active' if active_conditions.all?
  end
end
