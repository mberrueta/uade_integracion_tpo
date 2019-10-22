# frozen_string_literal: true

module Holders
  class InvoicesController < ApplicationController
    def index
      render json: invoices, status: :ok
    end

    private

    def invoices
      Invoice.includes(:items)
            .joins(:student)
            .where(students: { holder_id: params[:holder_id] })
            .to_json(include: :items, methods: [:subtotal, :total])
    end
  end
end
