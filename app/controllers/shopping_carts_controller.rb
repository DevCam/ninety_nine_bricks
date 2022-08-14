class ShoppingCartsController < ApplicationController
  before_action :set_shopping_cart, only: %i[ show edit update destroy checkout]

  # WARNING!!!!!!! ->>>> THIS IS ONLY FOR DEMO
  # AUTH TOKEN SHOULD *ALWAYS* be checked!
  skip_before_action :verify_authenticity_token

  # GET /shopping_carts or /shopping_carts.json
  def index
    @shopping_carts = ShoppingCart.all
  end

  # GET /shopping_carts/1 or /shopping_carts/1.json
  def show
  end

  # GET /shopping_carts/1/checkout
  def checkout
    # int checkout process?

  end

  # GET /shopping_carts/new
  def new
    @shopping_cart = ShoppingCart.new
  end

  # GET /shopping_carts/1/edit
  def edit
  end

  def create
    @shopping_cart = ShoppingCart.new(shopping_cart_params)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to shopping_cart_url(@shopping_cart), notice: "Cart was successfully created." }
        format.json { render :show, status: :created, location: @shopping_cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shopping_cart.errors, status: :unprocessable_entity }
      end
    end

  end

  private
    def set_shopping_cart
      @shopping_cart = ShoppingCart.find(params[:id]) if params[:id]
      # @shopping_cart = User.find(params[:user_id]).shopping_cart if params[:user_id]
    end

    # Only allow a list of trusted parameters through.
    def shopping_cart_params
      params.require(:shopping_cart).permit(:user_id)
    end
end
