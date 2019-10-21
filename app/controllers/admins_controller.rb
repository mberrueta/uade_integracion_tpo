class AdminsController < ApplicationController
    before_action :find_one, except: [:create, :index]
  
    def index
      @holders = AdminUser.all
      render json: @admin_users, status: :ok
    end
  
    def show
      render json: @admin_users, status: :ok
    end
  
    def create
      @holder = AdminUser.new(holder_params)
      if @holder.save
        render json: @admin_user, status: :created
      else
        render json: { errors: @admin_user.errors.full_messages },
               status: :unprocessable_entity
      end
    end
  
    def update
      if @admin_user.update(admin_params)
        render json: @admin_user
      else
        render json: { errors: @admin_user.errors.full_messages },
               status: :unprocessable_entity
      end
    end
  
    def destroy
      @admin_user.destroy
    end
  
    private
  
    def find_one
      @admin_user = AdminUser.find(params[:id])
  
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'AdminUser not found' }, status: :not_found
    end
  
    def admin_params
      params.permit(
        :name,
        :last_name,
        :email,
        :phone,
        :address,
        :user_id,
      )
      params.required(:name)
    end
  end