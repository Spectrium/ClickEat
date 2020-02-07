class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    chosen_product = Dish.find(params[:dish_id])
    current_cart = @current_cart

    # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
    if current_cart.line_items && is_included(chosen_product)
      # Find the line_item with the chosen_product
      @line_item = current_cart.line_items.find_by(:dish_id => chosen_product.id)
      # Iterate the line_item's quantity by one
      @line_item.quantity += 1
    else
      @line_item = LineItem.new
      @line_item.cart = current_cart
      @line_item.dish = chosen_product
    end

    # Save and redirect to cart show path
    @line_item.amount = @line_item.quantity.to_i * @line_item.dish.price
    @line_item.save
    redirect_to cart_path
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_path(@current_cart), notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_quantity
    @line_item = LineItem.find(params[:id])
    @line_item.quantity += 1
    @line_item.amount = @line_item.quantity.to_i * @line_item.dish.price
    @line_item.save
    redirect_to cart_path(@current_cart)
  end
  
  def reduce_quantity
    @line_item = LineItem.find(params[:id])
    if @line_item.quantity > 1
      @line_item.quantity -= 1
    end
    @line_item.amount = @line_item.quantity.to_i * @line_item.dish.price
    @line_item.save
    redirect_to cart_path(@current_cart)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:quantity, :dish_id, :cart_id)
    end

    def is_included(dish)
      current_cart.list_item_not_to_order.each do |line_item|
        if line_item.dish.id == dish.id
          return true
        end
      end
      return false
    end

    def name
      
    end
end
