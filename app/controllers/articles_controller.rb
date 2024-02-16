class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
    # render :index
  end

  def show
    # @article = Article.find(params[:id])
    set_article
  end

  def new
    @article = Article.new
  end

  def create
    # binding.break
    @article = Article.new article_params

    if @article.save
      redirect_to :articles
    else
      render :new
    end
  end

  def edit
    # @article = Article.find(params[:id])
    set_article
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to :articles
    else
      render :edit
    end
  end

  def destroy
    # @article = Article.find(params[:id])
    set_article
    @article.destroy

    redirect_to :articles
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
