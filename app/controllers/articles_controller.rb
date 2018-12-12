class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    attributes = article_params
    attributes[:points] = 0
    @article = Article.new(attributes)
    @article.save
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:link, :title, :user_id)
  end
end
