class CartController < ApplicationController
  def index
    @foods = []
    if saved_food_ids = cookies[:saved_food_ids]
      saved_food_ids.split(',').map(&:to_i).uniq.each do |id|
        @foods << Food.find(id)
      end
    end
    @foods
  end

  def create
    # TODO: ajaxでページ遷移しないようにする？←必須じゃないっぽい
    saved_food_ids = cookies[:saved_food_ids] || ""
    cookies.permanent[:saved_food_ids] = saved_food_ids + params[:id] + ","
    redirect_back(fallback_location: root_path)
  end

  def destroy
    # 全削除か、指定されたやつ削除かわける
    cookies.delete :saved_food_ids
    redirect_to cart_index_path
  end

  def search

  end
end
