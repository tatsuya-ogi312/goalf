class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @article = Article.find(params[:article_id])
    if @comment.save
      CommentChannel.broadcast_to @article, { comment: @comment, user: @comment.user } 
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, article_id: params[:article_id])
  end

end
