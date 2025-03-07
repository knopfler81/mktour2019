class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def index
		@users = User.all
	end
	private
	
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :avatar, :password, :password_confirmation)
  end
end
