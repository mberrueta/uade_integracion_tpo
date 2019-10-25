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
    result = invoice.pay!(payment_params)
    @payment = result[:payment]

    return render json: { errors: result[:error] }, status: :unprocessable_entity if result[:error]

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
    params.permit(
      :card_number,
      :expiration_date,
      :cvv,
      :payments,
      :cbu,
      :payment_method
    )
  end

  def invoice
    Invoice.find(params[:invoice_id])
  end
end
