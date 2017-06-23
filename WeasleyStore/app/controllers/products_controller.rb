class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.search(params[:term]).page(params[:page]).per(9)
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def add_to_cart
    @product = Product.find(params[:product_id])
    params[:id] = @product
    @newCartItem = Cart.create!(user_id: current_user.id, product_id: @product.id)
    respond_to do |format|
     	format.html { redirect_to @product, notice: 'Added to cart'} 
     	format.json { render :show, status: :ok, location: @product } 
   	end  
  end
  
  def remove_from_cart
    @product = Product.find(params[:product_id])
    params[:id] = @product
    @oldCartItem = Cart.where(:product_id => params[:product_id], :user_id => current_user.id).first
    if @oldCartItem.present?
      @oldCartItem.destroy()
    end
    respond_to do |format|
   	  format.html { redirect_to @product, notice: 'This item was removed from your cart.'} 
   	  format.json { render :show, status: :ok, location: @product } 
 	  end  
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:product_name, :images, :weight, :galleons, :description, :quantity, {images: []}, :remove_images, :term)
    end
end
