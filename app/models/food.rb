class Food < ApplicationRecord
  # TODO: validation

  STANDARD_SCORE = 5.freeze

  def return_similer_foods
    similer_foods = {}
    Food.all.find_each do |candidate_food|
      # TODO: 自分自身を表示すべきか？
      # next if self.id == candidate_food.id
      score = calculate_nutrition_score(food1: self, food2: candidate_food)
      if score <= STANDARD_SCORE
        similer_foods[score] = candidate_food
      end
    end
    similer_foods.sort.to_h.values
  end

  private

  def calculate_nutrition_score(food1:, food2:)
    abs_protein = (food1.protein - food2.protein).abs
    abs_carbohydrate = (food1.carbohydrate - food2.carbohydrate).abs
    abs_lipid = (food1.lipid - food2.lipid).abs
    abs_vitamin = (food1.vitamin - food2.vitamin).abs
    sum_of_abs = [abs_protein, abs_lipid, abs_carbohydrate].sum
  end
end
