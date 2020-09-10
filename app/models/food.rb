class Food < ApplicationRecord
  def return_similer_foods
    similer_foods = []
    Food.all.each do |candidate_food|
      next if self.id == candidate_food.id
      if similer?(food1: self, food2: candidate_food)
        similer_foods << candidate_food
      end
    end
  end

  private

  def similer?(food1:, food2:)
    score = calculate_nutrition_score(food1: food1, food2: food2)
    score <= 20
  end

  def calculate_nutrition_score(food1:, food2:)
    return 20
  end
end
