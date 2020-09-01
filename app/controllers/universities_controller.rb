class UniversitiesController < ApplicationController
  before_action :set_university, only: [:show]

  # GET /universities
  def index
    @universities = University.all
  end

  # GET /universities/1
  def show; end

  private
    def set_university
      @university = University.find(params[:id])
    end
end
