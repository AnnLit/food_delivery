class MealView

def display(meals)
  meals.each do |meal|
    puts "#{meal.name} - $#{meal.price}"
  end
end

def ask_for_name(label)
  puts "What is the #{label}?"
  return gets.chomp
end

def ask_for_price(label)
  puts "What is the #{label}?"
  return gets.chomp.to_i
end
end
