class PromotionsController < ApplicationController
  before_action :set_promotion, only: %i[ show edit update destroy ]

  def index
    @promotions = Promotion.all
  end

  def show
  end

  def new
    @promotion = Promotion.new
  end

  def edit
  end

  def create
    @promotion = Promotion.new(promotion_params)

    respond_to do |format|
      if @promotion.save
        format.html { redirect_to @promotion, notice: "Promotion was successfully created." }
        format.json { render :show, status: :created, location: @promotion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @promotion.update(promotion_params)
        format.html { redirect_to @promotion, notice: "Promotion was successfully updated." }
        format.json { render :show, status: :ok, location: @promotion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @promotion.destroy!

    respond_to do |format|
      format.html { redirect_to promotions_path, status: :see_other, notice: "Promotion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_promotion
      @promotion = Promotion.find(params[:id])
    end

    def promotion_params
      params.require(:promotion).permit(:status, :type, :start_date, :end_date, :quantity, :get_quantity, :percent_off, :category_id)
    end
end
