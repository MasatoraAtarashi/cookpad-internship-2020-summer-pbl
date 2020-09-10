class TopController < ApplicationController
  def index
    if @food = Food.find_by(name: params[:query])
      @foods = @food.return_similer_foods
    else
      # TODO 検索した食材が存在しないことをユーザーに伝える？？
    end
  end
end
