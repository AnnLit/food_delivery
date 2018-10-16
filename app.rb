require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'router'

csv_file = File.join(__dir__, "data/meals.csv")
meal_repo = MealRepository.new(csv_file)
controller = MealsController.new(meal_repo)
router = Router.new(controller)

router.run
