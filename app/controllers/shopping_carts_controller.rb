class ShoppingCartsController < ApplicationController
  before_action :set_shopping_cart, only: %i[ show edit update destroy checkout accept_terms complete_purchase]

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
  end

  def accept_terms
    @shopping_cart.terms_accepted = true
    @shopping_cart.save
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

  def complete_purchase
    respond_to do |format|

      @shopping_cart.offers.each do | offer |
        brick = offer.brick
        brick.user = @shopping_cart.user
        brick.on_sale = false
        brick.save
        offer.destroy
      end

      format.html { redirect_to user_url(@shopping_cart.user), notice: "Purchase was sucesfull!" }
      format.json { render :show, status: :ok, location: @shopping_cart.user }
    end
  end

  private
    def set_shopping_cart
      @shopping_cart = ShoppingCart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shopping_cart_params
      params.require(:shopping_cart).permit(:user_id)
    end
end
