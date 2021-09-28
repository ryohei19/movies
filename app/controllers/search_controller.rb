class SearchController < ApplicationController
  before_action :authenticate_user!

  def form #サイドバーから検索ページに遷移するため
    @genres = Genre.all
  end

  def search
    @user  = current_user
    @genres = Genre.all
    @good = Good.new
    @value = params["search"]["value"]         #データを代入
    @how = params["search"]["how"]             #データを代入
    @datas = search_for(@how, @value)          #def search_forを実行(引数に検索ワードと検索方法)
  end

  private

  def match(value)
    #.orを使用することで、valueに一致するカラムのデータをnameカラムとgenre_idカラムから探してきます。
    Movie.where(name: value).or(Movie.where(genre_id: value))
  end

  def partical(value)
    Movie.where("name LIKE ?", "%#{value}%")
  end


  def search_for(how, value)
    case how                     #引数のhowと一致する処理に進むように定義しています。
    when 'match'                 #ジャンル検索の場合はmatchで固定してるので、必ず'match'の処理に進みます。
      match(value)
    when 'partical'
      partical(value)
    end
  end

end
