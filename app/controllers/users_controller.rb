class UsersController < ApplicationController

    skip_before_action :authenticate_user, only: [:create, :confirm_email]
    before_action :find_user, only: [:update, :show, :destroy]

    def index
      users = User.all
      render json: {
        data: users
      }, status: 200
    end
    #create a new user does not require authentication
    def create
      @user = User.new(user_params)
      if @user.save
        VerificationMailer.verfiy_email(@user).deliver
        @verified_user = VerifiedUser.create(user: @user)
        render json: {message: "user created successfully please verify your email"}, status: 201
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

    def confirm_email
      user = User.find_by_verification_token(params[:verification_token])
      if user
        user.email_activate
        # flash[:success] = "Welcome to the Sample App! Your email has been confirmed.
        # Please sign in to continue."
        # redirect_to signin_url
        render json:{message: "Email is conrifmed"}
      else
        # flash[:error] = "Sorry. User does not exist"
        # redirect_to root_url
        render json:{message: "Sorry. User does not exist"}
      end
    end

    private
    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.permit(:name, :email, :phone_number, :password, :address)
    end
    
    
end
