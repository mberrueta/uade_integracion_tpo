# frozen_string_literal: true

class PayrollController < ApplicationController
  def index
    result = Services::Payroll.new.call
    if result[:errors].blank?
      render json: result, status: :created
    else
      render json: result, status: :unprocessable_entity
    end
  end
end
