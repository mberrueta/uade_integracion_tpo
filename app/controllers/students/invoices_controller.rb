# frozen_string_literal: true

module Students
  class InvoicesController < ApplicationController
    def index
      render json: invoices, status: :ok
    end

    private

    def invoices
      Invoice.includes(:items)
            .where(student_id: params[:student_id])
            .to_json(include: :items, methods: [:subtotal, :total])
    end
  end
end
