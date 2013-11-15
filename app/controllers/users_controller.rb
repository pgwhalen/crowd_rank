class UsersController < ApplicationController

	def index
		@users = User.all.to_a
	end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		sign_in @user
      user_group = UserGroup.find_by_name("Everyone")
      @user.user_groups << user_group
  		flash[:success] = "Success"
  		redirect_to root_url
  	else
  		render root_url
  	end
  end

  def show
    @user = User.find(params[:id])
    @rankings = Ranking.where(user_id: params[:id])
  end


  private

  	def user_params
  		params.require(:user).permit(:username, :email, :password, :password_confirmation)
  	end

  	def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
