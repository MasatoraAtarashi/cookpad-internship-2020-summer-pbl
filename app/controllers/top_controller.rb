class TopController < ApplicationController
  def index
    # TODO 検索結果のみを返すようにする
    @foods = Food.all
  end
end
