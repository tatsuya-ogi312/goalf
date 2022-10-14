class CommentChannel < ApplicationCable::Channel
  def subscribed
    @article = Article.find(params[:article_id])
    stream_for @article
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
