require_relative "../views/meals_view"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def add
    # Ask user for meal name
    name = @view.ask_for("name")
    # Ask user for meal price
    price = @view.ask_for("price").to_i
    # Create a new meal instance
    meal = Meal.new(name: name, price: price)
    # Add the meal to the repository
    @meal_repository.create(meal)
  end

  def list
    # Get all meals from the repository
    meals = @meal_repository.all
    # Display all meals
    @view.display(meals)
  end
end
