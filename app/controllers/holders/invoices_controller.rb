# frozen_string_literal: true

module Holders
  class InvoicesController < ApplicationController
    def index
      render json: invoices, status: :ok
    end

    private

    def invoices
      Invoice.includes(items: :service)
             .joins(:student)
             .where(students: { holder_id: params[:holder_id] })
             .to_json(
               include: [
                 :student,
                 items: { methods: :name }
               ],
               methods: %i[subtotal total payed]
             )
    end
  end
end
