# frozen_string_literal: true

module Holders
  class PaymentsController < ApplicationController
    def index
      render json: payments, status: :ok
    end

    private

    def payments
      ::Payment.joins(invoice: :student)
               .where(invoice: { students: { holder_id: params[:holder_id] } })
    end
  end
end
