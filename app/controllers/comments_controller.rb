class CommentsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:comenter, :body, :status)
    end
end
