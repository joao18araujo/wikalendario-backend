class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show]

  # GET /departments/1
  def show; end

  private
    def set_department
      @department = Department.find(params[:id])
    end
end
