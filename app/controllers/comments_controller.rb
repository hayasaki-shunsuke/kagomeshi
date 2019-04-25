class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments/new
  def new
    @comment = Comment.new(restaurant_id:params[:restaurant_id])
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @comment.restaurant, notice: t(:'.save')
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment.restaurant, notice: t(:'.update')
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @comment.restaurant, notice: t(:'.destroy')
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :user_id, :restaurant_id, :image)
    end
end
