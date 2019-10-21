class HoldersController < ApplicationController
  before_action :find_one, except: [:create, :index]

  def index
    @holders = Holder.all
    render json: @holders, status: :ok
  end

  def show
    render json: @holder, status: :ok
  end

  def create
    @holder = Holder.new(holder_params)
    if @holder.save
      render json: @holder, status: :created
    else
      render json: { errors: @holder.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @holder.update(holder_params)
      render json: @holder
    else
      render json: { errors: @holder.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @holder.destroy
  end

  private

  def find_one
    @holder = Holder.find(params[:id])
    
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Holder not found' }, status: :not_found
  end

  def holder_params
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
