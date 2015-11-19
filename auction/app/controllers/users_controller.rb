class UsersController < ApplicationController

	def index
			@users = User.list_users(10)
			if @users.empty?
				render "no_projects"
			end
	end

	def show
		@users = User.list_users(10)
			if @users.empty?
				render "no_projects"
			end
	end

	def new

	end

	def create
	end

	def destroy
	end

end
