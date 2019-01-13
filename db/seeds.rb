genres = %w(軽自動車 コンパクト ミニバン・ワゴン セダン SUV・クロカン クーペ バン・トラック ステーションワゴン ハイブリッド 電気自動車)

genres.each do |genre|
  Genre.create(name: genre)
end
