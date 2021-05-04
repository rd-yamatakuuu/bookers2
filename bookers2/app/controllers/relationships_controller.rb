class RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.unfollow(params[:id])
    redirect_back(fallback_location: root_path)
  end

  def index
    @user = User.find(params[:user_id])
  end

  def index2
    @user = User.find(params[:user_id])
  end

end
