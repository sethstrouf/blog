class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
  end

  def create
  end

  def destroy
  end

end
