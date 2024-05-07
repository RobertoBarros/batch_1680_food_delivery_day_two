class MealsView
  def ask_for(attribute)
    puts "What is the meal #{attribute}?"
    print "> "
    gets.chomp
  end

  def display(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1} - #{meal.name} - $ #{meal.price}"
    end
  end
end
