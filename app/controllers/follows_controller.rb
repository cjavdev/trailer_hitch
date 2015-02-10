class FollowsController < ApplicationController
  def destroy
    pro = current_user.out_profiles.find_by(id: params[:id])
    pro.unfollow!
    redirect_to root_url
  end
end
