# frozen_string_literal: true

module Invoices
  class PaymentsController < ApplicationController
    def index
      render json: payments, status: :ok
    end

    private

    def payments
      Payment.where(holder_id: params[:holder_id])
    end
  end
end
