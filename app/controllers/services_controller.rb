# frozen_string_literal: true

class ServicesController < ApplicationController
  before_action :find_one, except: %i[create index]

  def index
    @services = Service.all
    render json: @services, status: :ok
  end

  def show
    render json: @service, status: :ok
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      render json: @service, status: :created
    else
      render json: { errors: @service.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @service.update(service_params)
      render json: @service
    else
      render json: { errors: @service.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @service.destroy
  end

  private

  def find_one
    @service = Service.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Service not found' }, status: :not_found
  end

  def service_params
    params.require(:name)
    params.permit(
      :name,
      :description,
      :price
    )
  end
end
