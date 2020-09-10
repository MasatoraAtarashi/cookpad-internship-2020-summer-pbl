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
    if params[:food_id]
      cookies[:saved_food_ids] = cookies[:saved_food_ids].gsub(/#{params[:food_id]},/, '')
    else
      cookies.delete :saved_food_ids
    end
    redirect_to cart_index_path
  end

  def search

  end
end
