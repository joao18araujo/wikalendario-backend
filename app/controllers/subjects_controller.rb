class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show]

  # GET /subjects/1
  def show; end

  private
    def set_subject
      @subject = Subject.find(params[:id])
    end
end
