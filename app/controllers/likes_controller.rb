class LikesController < ApplicationController
  before_action :get_like, only: :create

  def create
    if @like
      @like.destroy!
    else
      @like = current_user.likes.create!(post_id: params['post_id'])
    end

    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_like
      @like = current_user.likes.find_by_post_id(params['post_id'])
    end
end
