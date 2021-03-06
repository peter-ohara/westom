class DealsController < ApplicationController
  before_action :set_deal, only: %i[show edit update destroy]

  # GET /deals
  # GET /deals.json
  def index
    @deals = Deal.filter(params.slice(:expires_by, :stage_higher_than))
  end

  # GET /deals/1
  # GET /deals/1.json
  def show; end

  # GET /deals/new
  def new
    @deal = Deal.new(broker: current_user)
  end

  # GET /deals/1/edit
  def edit; end

  # POST /deals
  # POST /deals.json
  def create
    @deal = Deal.new(deal_params)

    respond_to do |format|
      if @deal.save
        format.html { redirect_to @deal, notice: 'Deal was successfully created.' }
        format.json { render :show, status: :created, location: @deal }
      else
        format.html { render :new }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deals/1
  # PATCH/PUT /deals/1.json
  def update
    respond_to do |format|
      if @deal.update(deal_params)
        format.html { redirect_to @deal, notice: 'Deal was successfully updated.' }
        format.json { render :show, status: :ok, location: @deal }
      else
        format.html { render :edit }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deals/1
  # DELETE /deals/1.json
  def destroy
    @deal.destroy
    respond_to do |format|
      format.html { redirect_to deals_url, notice: 'Deal was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_deal
    @deal = Deal.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def deal_params
    params.require(:deal).permit(:contact_id,
                                 :property_id,
                                 :user_id,
                                 :type_of_service,
                                 :request_date,
                                 :request_details,
                                 :amount,
                                 :deadline,
                                 :stage,
                                 :date_of_closing,
                                 :expiration_date)
  end
end
