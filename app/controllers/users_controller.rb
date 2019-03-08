class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def index
		@user = User.all
	end
	private
	
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation)
  end
end
