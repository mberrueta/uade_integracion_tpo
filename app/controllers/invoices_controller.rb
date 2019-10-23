# frozen_string_literal: true

class InvoicesController < ApplicationController
  before_action :find_one, except: %i[create index]

  def index
    render json: invoices, status: :ok
  end

  def show
    render json: @invoice, status: :ok
  end

  def update
    if @invoice.update(invoice_params)
      render json: @invoice
    else
      render json: { errors: @invoice.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def find_one
    @invoice = Invoice.find(params[:id]).includes(:items)
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Invoice not found' }, status: :not_found
  end

  def invoice_params
    params.permit(:discount)
  end

  def invoices()
    invoices = Invoice.all.includes(items: :service)
    invoices = invoices.where(student_id: params[:student_id]) if params[:student_id]
    invoices = invoices.joins(:student).where(students: { holder_id: params[:holder_id] }) if params[:holder_id]
    invoices.to_json(include: { :students, items: :service }, methods: [:subtotal, :total])
  end
end
