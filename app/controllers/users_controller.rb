class UsersController < ApplicationController

    skip_before_action :authenticate_user, only: [:create]
    before_action :find_user, only: [:update, :show, :destroy]

    def index
      users = User.all
      render json: {
        data: users
      }, status: 200
    end
    #create a new user does not require authentication
    def create
      user = User.new(user_params)
      if user.save
        render json: {message: "user created successfully"}, status: 201
      else
        render json: {errors: "something went wrong while creating the User please try again"}, status: 503
      end
    end

    def update
    end

    def show
    end

    def destroy
    end

    private
    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.permit(:name, :email, :phone_number, :password, :address)
    end
end
