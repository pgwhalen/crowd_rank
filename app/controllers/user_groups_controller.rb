class UserGroupsController < ApplicationController

	def show
		@user_group = UserGroup.find(params[:id])
	end
end
