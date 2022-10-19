class FavorsController < ApplicationController
  before_action :article_params, except: :index
  before_action :authenticate_user!, except: :index

  def index
    @user = User.find(params[:user_id])
    favor = Favor.where(user_id: @user.id).pluck(:article_id) #plunkでarticle_idを全て取得
    @favor_articles = Article.find(favor)
  end

  def create
    Favor.create(user_id: current_user.id, article_id: params[:id])
  end

  def destroy
    Favor.find_by(user_id: current_user.id, article_id: params[:id]).destroy
  end

  def article_params
    @article = Article.find(params[:id])
  end

end
