require_relative '../views/meal_view'
require_relative '../repositories/meal_repository'

class MealsController
  attr_reader :repository

 def initialize(repository)
  @repository = repository
  @view = MealView.new
 end

  def list
    @view.display(@repository.all)
  end

  def add
    attributes = {}
    attributes[:name] = @view.ask_for_name("name")
    attributes[:price] = @view.ask_for_price("price")
    meal = Meal.new(attributes)
    @repository.add(meal)
  end
end

