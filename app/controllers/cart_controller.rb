class CartController < ApplicationController
  def index
    @foods = []
    if food_ids = split_saved_food_ids_to_food_ids(saved_food_ids: cookies[:saved_food_ids])
      food_ids.each do |id|
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
    cookpad_base_url = 'https://cookpad.com/search/'
    search_url = cookpad_base_url
    if food_ids = split_saved_food_ids_to_food_ids(saved_food_ids: cookies[:saved_food_ids])
      food_ids.each_with_index do |id, idx|
        food_name = Food.find(id).name
        if idx == 0
          query = food_name
        else
          query = "%20" + food_name
        end
        search_url += query
      end
    end
    redirect_to search_url
  end

  private

  def split_saved_food_ids_to_food_ids(saved_food_ids:)
    saved_food_ids.split(',').map(&:to_i).uniq
  end
end
