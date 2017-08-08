class MergeSuggestion
  attr_reader :bicycle, :suggestion

  def initialize(bicycle_id:, suggestion_id:)
    @bicycle = Bicycle.find(bicycle_id)
    @suggestion = Suggestion.find(suggestion_id)
  end

  def approve
    bicycle.update(suggestion_attrs)
    suggestion.update(approved: true, approved_at: Date.current)
  end

  def disapprove
    suggestion.update(approved: false, approved_at: Date.current)
  end

  private

  def suggestion_attrs
    { name: suggestion.name,
      image: suggestion.image,
      description: suggestion.description,
      category_id: suggestion.category_id }
  end
end
