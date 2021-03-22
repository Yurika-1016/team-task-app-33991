class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
    @tasks = Task.where(operator_id: current_user.id)
  end
end
