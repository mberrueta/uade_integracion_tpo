# frozen_string_literal: true

class PaymentsController < ApplicationController
  before_action :find_one, except: %i[create index]

  def index
    @payments = Payment.all
    render json: @payments, status: :ok
  end

  def show
    render json: @payment, status: :ok
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      render json: @payment, status: :created
    else
      render json: { errors: @payment.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @payment.update(payment_params)
      render json: @payment
    else
      render json: { errors: @payment.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @payment.destroy
  end

  private

  def find_one
    @payment = Payment.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Payment not found' }, status: :not_found
  end

  def payment_params
    params.require(:invoice_id)
    params.require(:amount)
    params.require(:payment_method)
    params.permit(
      :invoice_id,
      :amount,
      :payment_method
    )
  end
end
