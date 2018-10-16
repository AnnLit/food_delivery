# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
csv_file = File.join(__dir__, "data/meals.csv")
meal_repo = MealRepository.new(csv_file)
controller = MealsController.new(meal_repo)

controller.list
controller.create_meal
controller.list
