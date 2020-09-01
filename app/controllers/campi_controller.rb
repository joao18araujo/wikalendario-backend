class CampiController < ApplicationController
  before_action :set_campus, only: [:show]

  # GET /campi/1
  def show; end

  private
    def set_campus
      @campus = Campus.find(params[:id])
    end
end
