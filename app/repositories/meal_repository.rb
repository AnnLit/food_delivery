require 'csv'
require_relative '../models/meal'

class MealRepository
#attr_reader :meals

  def initialize(csv_file_path)
    #@id = attributes[:id]
    @csv_options = { headers: :first_row, header_converters: :symbol }
    @csv_file_path = csv_file_path
    @meals = []
    load_meals if File.file?(csv_file_path)
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end

  def all
    @meals
  end

  def add(meal)
    meal.id = @next_id
    @next_id += 1
    @meals << meal #[:id],attributes[:name], attributes[:price])
    save_meals
  end

  def find(id)
    meal = @meals.find { |meal| meal.id == id }
    return meal
  end

private

  # def next_id
  # @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  # end
  def save_meals
    CSV.open(@csv_file_path, "wb", @csv_options) do |csv|
      csv << ["id", "name", "price"]
      @meals.each { |meal| csv <<  [meal.id, meal.name, meal.price] }
    end
  end

  def load_meals
    CSV.foreach(@csv_file_path, @csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
    end
  end


end
