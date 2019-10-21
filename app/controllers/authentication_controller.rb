# frozen_string_literal: true

class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  def login
    @user = User.find_by_name(params[:username])
    if @user&.authenticate(params[:password])
      render json: result,
             status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def result
    {
      token: JsonWebToken.encode(user_id: @user.id),
      exp: Time.now + Integer(24.hours, 10).strftime('%m-%d-%Y %H:%M'),
      username: @user.name
    }
  end
end
