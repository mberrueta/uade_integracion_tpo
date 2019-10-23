# frozen_string_literal: true

module Holders
  class PaymentsController < ApplicationController
    def index
      render json: payments, status: :ok
    end

    private

    def payments
      ::Payment.where(invoice_id: params[:invoice_id])
    end
  end
end
