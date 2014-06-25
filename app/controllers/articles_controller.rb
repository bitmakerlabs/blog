class ArticlesController < ApplicationController
  before_action :ensure_logged_in, except: [:index, :show]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)

    # You can also do
    # @article = Article.new(article_params)
    # @article.user_id = current_user.id

    # PATH vs. URL
    # article_path => "/articles/3"
    # article_url => "http://localhost:3000/articles/3"

    if @article.save
      flash[:notice] = "This article was successfully created. YAY!"
      redirect_to article_path(@article)
    else
      flash.now[:alert] = "OMG SOMETHING BAD HAPPENED. BOO."
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = @article.comments.build
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    @article.update(article_params)
    redirect_to article_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
