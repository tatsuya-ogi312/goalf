class FavorsController < ApplicationController
  before_action :article_params
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
