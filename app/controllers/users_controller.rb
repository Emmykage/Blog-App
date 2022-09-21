class UsersController < ApplicationController
  def index; end

  def show
    @user = params[:user_id]
  end
end
