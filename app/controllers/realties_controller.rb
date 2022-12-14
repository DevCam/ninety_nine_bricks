class RealtiesController < ApplicationController
  before_action :set_realty, only: %i[ show edit update destroy ]

  # WARNING!!!!!!! ->>>> THIS IS ONLY FOR DEMO
  # AUTH TOKEN SHOULD *ALWAYS* be checked!
  skip_before_action :verify_authenticity_token

  # GET /realties or /realties.json
  def index
    @realties = Realty.all
  end

  # GET /realties/1 or /realties/1.json
  def show
  end

  private
    def set_realty
      @realty = Realty.find(params[:id])
    end

    def realty_params
      params.require(:realty).permit(:address, :img)
    end
end
