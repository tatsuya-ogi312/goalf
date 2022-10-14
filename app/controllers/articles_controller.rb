class ArticlesController < ApplicationController
 before_action :authenticate_user!, except: [:index, :show]
 before_action :find_article, only: [:show, :edit, :update, :destroy]
 before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @articles = Article.includes(:user).order('created_at DESC')
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

  def show
    @comment = Comment.new
    @comments = @article.comments.includes(:user)
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article.id)
    else
      render edit
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :image, :content, :url, :category_id).merge(user_id: current_user.id)
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path if @article.user_id != current_user.id
  end

end
