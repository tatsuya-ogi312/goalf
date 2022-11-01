class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show search]
  before_action :find_article, only: %i[show edit update destroy]
  before_action :contributor_confirmation, only: %i[edit update destroy]
  impressionist actions: [:show] # showアクションのカウントを行う

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
    impressionist(@article, nil, unique: [:request_hash]) # 参照するカラムをセット
  end

  def edit; end

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

  def search
    @articles = SearchArticlesService.search(params[:keyword]) # 独自のメソッドを用いて、可読性UP
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
