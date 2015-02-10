class UpdatesController < ApplicationController
  before_action :require_user!

  def create
    current_user.update_in_profiles2
    current_user.update_out_profiles2
    redirect_to root_url
  end
end
