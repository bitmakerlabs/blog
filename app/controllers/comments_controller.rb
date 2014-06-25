class CommentsController < ApplicationController
  before_action :ensure_logged_in
  before_action :load_article

  def create
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to article_path(@article), notice: "Thank you for your comment."
    else
      flash.now[:alert] = "Your comment failed to be created."
      render 'articles/show'
    end
  end

  def edit
    # ....
  end

  def update
    # ....
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

  def load_article
    @article = Article.find(params[:article_id])
  end
end
