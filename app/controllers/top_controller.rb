class TopController < ApplicationController
  def index
    if food_name = food_name_aggregation(name: params[:query])
      food = Food.find_by(name: food_name)
      @foods = food.return_similer_foods
    else
      # TODO 検索した食材が存在しないことをユーザーに伝える？？
    end
  end

  private

  def food_name_aggregation(name:)
    if %w(アスパラガス あすぱらがす asuparagasu アスパラ あすぱら asupara 明日ぱら).include?(name)
      return "アスパラガス"
    elsif %w(アスパラガス あすぱらがす asuparagasu アスパラ あすぱら asupara 明日ぱら).include?(name)
      return 'オクラ'
    elsif %w(アスパラガス あすぱらがす asuparagasu アスパラ あすぱら asupara 明日ぱら).include?(name)
      return 'オクラ'
    elsif %w(アスパラガス あすぱらがす asuparagasu アスパラ あすぱら asupara 明日ぱら).include?(name)
      return 'オクラ'
    elsif %w(アスパラガス あすぱらがす asuparagasu アスパラ あすぱら asupara 明日ぱら).include?(name)
      return 'オクラ'
    elsif %w(アスパラガス あすぱらがす asuparagasu アスパラ あすぱら asupara 明日ぱら).include?(name)
      return 'オクラ'
    elsif %w(アスパラガス あすぱらがす asuparagasu アスパラ あすぱら asupara 明日ぱら).include?(name)
      return 'オクラ'
    elsif %w(アスパラガス あすぱらがす asuparagasu アスパラ あすぱら asupara 明日ぱら).include?(name)
      return 'オクラ'
    elsif %w(アスパラガス あすぱらがす asuparagasu アスパラ あすぱら asupara 明日ぱら).include?(name)
      return 'オクラ'
    elsif %w(アスパラガス あすぱらがす asuparagasu アスパラ あすぱら asupara 明日ぱら).include?(name)
      return 'オクラ'
    elsif %w(アスパラガス あすぱらがす asuparagasu アスパラ あすぱら asupara 明日ぱら).include?(name)
      return 'オクラ'
    elsif %w(アスパラガス あすぱらがす asuparagasu アスパラ あすぱら asupara 明日ぱら).include?(name)
      return 'オクラ'
    elsif %w(アスパラガス あすぱらがす asuparagasu アスパラ あすぱら asupara 明日ぱら).include?(name)
      return 'オクラ'
    elsif %w(アスパラガス あすぱらがす asuparagasu アスパラ あすぱら asupara 明日ぱら).include?(name)
      return 'オクラ'
    elsif %w(アスパラガス あすぱらがす asuparagasu アスパラ あすぱら asupara 明日ぱら).include?(name)
      return 'オクラ'
    elsif %w(アスパラガス あすぱらがす asuparagasu アスパラ あすぱら asupara 明日ぱら).include?(name)
      return 'オクラ'
    elsif %w(アスパラガス あすぱらがす asuparagasu アスパラ あすぱら asupara 明日ぱら).include?(name)
      return 'オクラ'
    else
      # TODO: return falseに戻す
      return name
    end
  end
end
