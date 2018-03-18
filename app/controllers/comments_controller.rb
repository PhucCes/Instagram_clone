class CommentsController < ApplicationController
  before_action :set_post, only: :create

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    if @comment.save!
      respond_to do |format|
        format.js
      end
    else
      render root_path
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    if @comment
      @comment.destroy!
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end


  private

    def set_post
      @post = Post.find(params['post_id'])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end
end
