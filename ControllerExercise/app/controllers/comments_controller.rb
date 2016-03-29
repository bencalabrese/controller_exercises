class CommentsController < ApplicationController
  def index
    commentable_object = commentable_type.find(params[commentable_type_key])
    render json: commentable_object.comments
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render(
        json: @comment.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    render json: @comment
    @comment.destroy
  end

  def show
    render json: Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      render json: @comment
    else
      render(
        json: @comment.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  private

  def commentable_type
    commentable_type_key[0..-4].gsub("_","").camelize.constantize
  end

  def commentable_type_key
    params.keys.find { |key| key.to_s.include?("id") }
  end

  def comment_params
    params.require(:comment).permit(
      :author_id,
      :text,
      :commentable_id,
      :commentable_type
    )
  end
end
