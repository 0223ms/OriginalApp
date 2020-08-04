class ExhibitionsController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def save_post
    @user = User.find(params[:id])
  end

  def tag_post
    @user = User.find(params[:id])
  end
end
