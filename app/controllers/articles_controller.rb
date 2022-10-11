class ArticlesController < ApplicationController
  def index
    @articles = Article.includes(:user)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :image, :content, :url, :category_id).merge(user_id: current_user.id)
  end

end
