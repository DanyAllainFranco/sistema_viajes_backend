class SessionsController < ApplicationController
  def create
    user = User.find_by(user_username: params[:username])

    if user && BCrypt::Password.new(user.user_password_hash) == params[:password]
      render json: { message: "Login exitoso", token: generate_token(user) }, status: :ok
    else
      render json: { message: "Credenciales inválidas" }, status: :unauthorized
    end
  end

  private

  def generate_token(user)
    JWT.encode({ user_id: user.user_user_id }, "secret_key", "HS256")
  end
end
