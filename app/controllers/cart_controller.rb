class CartController < ApplicationController
  def index
    @foods = []
    if saved_food_ids = [cookies[:saved_food_ids]]
      saved_food_ids.each do |id|
        # なぜかidが&10として保存されており、to_iすると0になってしまうのでこういう処理をした。
        @foods << Food.find(id.slice(1..-1).to_i)
      end
    end
  end

  def create
    # TODO: ajaxでページ遷移しないようにする？←必須じゃないっぽい
    saved_food_ids = [cookies[:saved_food_ids]] || []
    cookies.permanent[:saved_food_ids] = saved_food_ids.append(params[:id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    # 全削除か、指定されたやつ削除かわける
    cookies.delete :saved_food_ids
  end

  def search

  end
end
