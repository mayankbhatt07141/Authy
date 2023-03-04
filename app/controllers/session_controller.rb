class SessionController < ApplicationController
  skip_before_action :authenticate_user
  def login
    @user = User.find_by(email: params[:email])
    if @user&.authenticate params[:password]
      token = JwtToken.jwt_encode(user_id: @user.id)
      render json:{
        token: token
      }, status: 200
    else
      render json: {error: 'unauthorized'}, status: :unauthorized
    end
  end
end
