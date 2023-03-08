class SessionController < ApplicationController
  skip_before_action :authenticate_user

  def login
    @user = User.find_by(email: params[:email])
    is_verified =  VerifiedUser.find_by(user_id: @user.id).is_verified
    if @user&.authenticate params[:password] && is_verified
      token = JwtToken.jwt_encode({user_id: @user.id})
      render json:{
        token: token
      }, status: 200
    elsif is_verified == false
      render json: {error: 'please verify your email'}, status: :unauthorized
    else
      render json: {error: 'unauthorized'}, status: :unauthorized
    end
  end
end
