class TopController < ApplicationController
  def index
    if food_name = food_name_aggregation(name: params[:query])
      food = Food.find_by(name: food_name)
      @foods = food.return_similer_foods
    else
      unless params[:query].nil?
        flash.now[:alert] = 'メッセージを入力してください。'
        render :index
      end
    end
  end

  private

  def food_name_aggregation(name:)
    if %w(アスパラガス あすぱらがす asuparagasu アスパラ あすぱら asupara 明日ぱら).include?(name)
      return "アスパラガス"
    elsif %w(オクラ おくら okura).include?(name)
      return 'オクラ'
    elsif %w(たこ タコ 蛸 凧 tako octopus).include?(name)
      return 'たこ'
    elsif %w(いか イカ 烏賊 ika).include?(name)
      return 'いか'
    elsif %w(えび エビ 海老 ebi).include?(name)
      return 'えび'
    elsif %w(マグロ まぐろ maguro トロ とろ つな ツナ 大トロ 中トロ 赤身).include?(name)
      return 'マグロ'
    elsif %w(さんま サンマ sanma).include?(name)
      return 'さんま'
    elsif %w(さば サバ saba).include?(name)
      return 'さば'
    elsif %w(サケ sake 鮭 さけ シャケ しゃけ).include?(name)
      return 'サケ'
    elsif %w(かつお カツオ 鰹 katsuo).include?(name)
      return 'かつお'
    elsif %w(いわし イワシ 鰯).include?(name)
      return 'いわし'
    elsif %w(あじ アジ 鯵 aji).include?(name)
      return 'あじ'
    elsif %w(ラム肉 ラム らむ ramu ramuniku hitsuji 羊).include?(name)
      return 'ラム肉'
    elsif %w(ソーセージ そーせーじ ウィンナー うぃんなー).include?(name)
      return 'ソーセージ'
    elsif %w(豚ひき肉 ひき肉 挽き肉).include?(name)
      return '豚ひき肉'
    elsif %w(豚バラ肉 豚バラ butabara バラ肉 bara バラ).include?(name)
      return '豚バラ肉'
    elsif %w(くじら肉 クジラ くじら クジラ肉 鯨 鯨肉 kujira).include?(name)
      return 'くじら肉'
    elsif %w(馬肉 ばにく 桜 バニク うまにく うま肉 baniku).include?(name)
      return '馬肉'
    elsif %w(牛ヒレ肉 ぎゅうひれ 牛ひれ肉 gyuhire).include?(name)
      return '牛ヒレ肉'
    elsif %w(豚モモ肉 ぶたもも 豚モモ 豚もも肉 ぶたモモ肉 ぶたももにく).include?(name)
      return '豚モモ肉'
    elsif %w(鶏むね肉 鶏胸肉 torimuneniku 鶏むね 鳥むね肉 鳥胸肉 サラダチキン さらだちきん).include?(name)
      return '鶏むね肉'
    elsif %w(ブロッコリー ぶろっこ ぶろっこりー ぶろこりー カリフラワー かりふらわ-).include?(name)
      return 'ブロッコリー'
    elsif %w(トマト とまと tomato).include?(name)
      return 'トマト'
    elsif %w(豆乳 とうにゅう 投入).include?(name)
      return '豆乳'
    elsif %w(ごま ゴマ 胡麻 goma 護摩).include?(name)
      return 'ごま'
    elsif %w(卵  たまご タマゴ 玉子).include?(name)
      return '卵'
    elsif %w(しらす シラス 白洲).include?(name)
      return 'しらす'
    elsif %w(たら タラ 鱈).include?(name)
      return 'たら'
    elsif %w(ナッツ なっつ クリーピーナッツ カシューナッツ 落花生 ピーナッツ).include?(name)
      return 'ナッツ'
    elsif %w(もち お餅 餅).include?(name)
      return 'もち'
    elsif %w(ヨーグルト ヤクルト よーぐると).include?(name)
      return 'ヨーグルト'
    elsif %w(牛乳 ぎゅうにゅう ギュウニュウ 乳).include?(name)
      return '牛乳'
    elsif %w(れんこん レンコン 蓮根).include?(name)
      return 'れんこん'
    elsif %w(キャベツ きゃべつ).include?(name)
      return 'キャベツ'
    elsif %w(ねぎ ネギ 葱).include?(name)
      return 'ねぎ'
    elsif %w(ごぼう ゴボウ 牛蒡).include?(name)
      return 'ごぼう'
    elsif %w(かぼちゃ カボチャ 南瓜).include?(name)
      return 'かぼちゃ'
    elsif %w(納豆 なっとう ナットウ natto ネバネバ).include?(name)
      return '納豆'
    elsif %w(グリーンピース ぐりーんぴーす そらまめ そら豆).include?(name)
      return 'グリーンピース'
    elsif %w(とうもろこし もろこし トウモロコシ 玉蜀黍).include?(name)
      return 'とうもろこし'
    elsif %w(米 こめ コメ　タイ米 こしひかり).include?(name)
      return '米'
    elsif %w(スパゲッティ パスタ 麺 めん うどん そば 蕎麦 中華麺 ラーメン らーめん).include?(name)
      return 'スパゲッティ'
    elsif %w(食パン パン bread 菓子パン 揚げパン ぱん 食ぱん).include?(name)
      return '食パン'
    else
      # TODO: return falseに戻す
      return false
    end
  end
end
