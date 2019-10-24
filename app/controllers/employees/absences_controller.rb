# frozen_string_literal: true

module Employees
  class AbsencesController < ApplicationController
    def create
      result = Services::Presentism.new.absences(options)
      if result[:error].blank?
        render json: result, status: :created
      else
        Rails.logger.error("Error creating an absence: `#{result[:error]}`")
        render json: result, status: :unprocessable_entity
      end
    end

    private

    def create_params
      params.permit(:start_date, :end_date, :employee_id, :reason)
    end

    def options
      {
        employee: employee,
        start_date: create_params[:start_date],
        end_date: create_params[:end_date],
        employee_id: create_params[:employee_id],
        reason: create_params[:reason]
      }
    end

    def employee
      Employee.find(create_params[:employee_id])
    end
  end
end
