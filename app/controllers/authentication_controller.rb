# frozen_string_literal: true

class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  def login
    if user&.authenticate(params[:password])
      render json: result,
             status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def result
    {
      token: JsonWebToken.encode(user_id: user.id),
      exp: exp,
      roles: user.roles,
      user: user.as_json(
        only: %i[id name],
        include: %i[
          student
          holder
          admin_user
          employee
        ]
      )
    }
  end

  def exp
    24.hours.from_now.strftime('%m-%d-%Y %H:%M')
  end

  def user
    User.where(name: params[:username])
        .includes(
          :student,
          :holder,
          :admin_user,
          :employee
        )
        .first
  end
end
