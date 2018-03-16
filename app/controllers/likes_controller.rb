class LikesController < ApplicationController
  before_action :get_like, only: :create

  def create
    if @like
      @like.destroy!
    else
      current_user.likes.create!(post_id: like_params['post_id'])
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_like
      @like = current_user.likes.find_by_post_id(like_params['post_id'])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      params.require(:like).permit(:post_id)
    end
end
