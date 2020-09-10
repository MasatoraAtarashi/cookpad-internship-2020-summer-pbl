class TopController < ApplicationController
  def index
    if @food = Food.find_by(name: params[:query])
      food_name_aggregation(name: params[:query])
      @foods = @food.return_similer_foods
    else
      # TODO 検索した食材が存在しないことをユーザーに伝える？？
    end
  end

  private

  def food_name_aggregation(name:)
    puts %w(アスパラガス あすぱらがす asuparagasu アスパラ あすぱら asupara 明日ぱら)
    puts puts %w(アスパラガス あすぱらがす asuparagasu アスパラ あすぱら asupara 明日ぱら).include?(name)

    if %w(アスパラガス あすぱらがす asuparagasu アスパラ あすぱら asupara 明日ぱら).include?(name)
      puts 'アグリ'
      puts 'アグリ'
      puts 'アグリ'
      puts 'アグリ'
      puts 'アグリ'
      puts 'アグリ'
      puts 'アグリ'
      puts 'アグリ'
      puts 'アグリ'
      puts 'アグリ'
    elsif
      puts 'a'
    else
      return false
    end
  end
end
