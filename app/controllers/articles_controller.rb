class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
    render :new
  end

  def create
    @user = User.new({
      :username => 'billybob'
    })
    @user.save
    attributes = article_params
    attributes[:user_id] = @user.id
    attributes[:points] = 0
    @article = Article.new(attributes)
    @article.save
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:link, :title, :user_id, :points => 0)
  end
end
