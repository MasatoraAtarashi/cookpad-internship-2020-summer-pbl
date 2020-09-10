class Food < ApplicationRecord
  def return_similer_foods
    similer_foods = []
    Food.all.find_each do |candidate_food|
      next if self.id == candidate_food.id

      if similer?(food1: self, food2: candidate_food)
        similer_foods << candidate_food
      end
    end
    similer_foods
  end

  private

  def similer?(food1:, food2:)
    score = calculate_nutrition_score(food1: food1, food2: food2)
    score <= 0.7
  end

  def calculate_nutrition_score(food1:, food2:)
    abs_protein = (food1.protein - food2.protein).abs
    abs_fat = (food1.fat - food2.fat).abs
    abs_carbohydrate = (food1.carbohydrate - food2.carbohydrate).abs
    sum_of_abs = [abs_protein, abs_fat, abs_carbohydrate].sum
  end
end
