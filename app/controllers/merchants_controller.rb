class MerchantsController < ApplicationController
  before_action :set_merchant, only: %i[ show edit update destroy ]

  def index
    @merchants = Merchant.all
  end

  def show
  end

  def new
    @merchant = Merchant.new
  end

  def edit
  end

  def create
    @merchant = Merchant.new(merchant_params)

    respond_to do |format|
      if @merchant.save
        format.html { redirect_to @merchant, notice: "Merchant was successfully created." }
        format.json { render :show, status: :created, location: @merchant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @merchant.update(merchant_params)
        format.html { redirect_to @merchant, notice: "Merchant was successfully updated." }
        format.json { render :show, status: :ok, location: @merchant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @merchant.destroy!

    respond_to do |format|
      format.html { redirect_to merchants_path, status: :see_other, notice: "Merchant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_merchant
      @merchant = Merchant.find(params[:id])
    end

    def merchant_params
      params.require(:merchant).permit(:name)
    end
end
