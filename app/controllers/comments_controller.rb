class CommentsController < ApplicationController

  def show
  end

  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
      flash[:notice] = "Comment posted!"
      redirect_to @post
    else
      flash[:alert] = "You can't leave a blank comment!"
      redirect_to @post
    end
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:name, :body, :post_id)
    end

end
