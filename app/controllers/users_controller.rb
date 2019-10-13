class UsersController < ApplicationController

  def index
		users = User.order('score DESC');
		render json: {status: 'SUCCESS', message: 'Users loaded', data: users}, status: :ok
	end

  def create
		user = User.new(user_params)
		if user.save
			render json: {status: 'SUCCESS', message: 'User score saved', data: user}, status: :ok
		else
			render json: {status: 'ERROR', message: 'User score not saved', data: user.erros}, status: :unprocessable_entity
		end
	end

  private

	def user_params
		params.permit(:name, :score)
	end

end
