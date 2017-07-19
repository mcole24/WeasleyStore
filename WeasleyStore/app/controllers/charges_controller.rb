class ChargesController < ApplicationController
    include CurrentCart
    before_action :set_cart, only: [:new, :create, :index, :edit]
    before_action :set_charge, only: [:show, :edit, :update]

    def new
    	@charge = Charge.new
	end
	
	def index
		@charges = Charge.all.page(params[:page]).per(5)
		unless current_user && current_user.admin?
		  redirect_to root_path, notice: "Must be signed in as Admin"
		end
	end
	
	def show
		
	end
	
	def edit
		unless current_user && current_user.admin?
		  redirect_to root_path, notice: "Must be signed in as Admin"
		end
	end
	
	def update
		respond_to do |format|
			if @charge.update(charge_params)
				format.html { redirect_to @charge, notice: 'Order was successfully updated.' }
				format.json { render :show, status: :ok, location: @charge }
			else
				format.html { render :edit }
				format.json { render json: @charge.errors, status: :unprocessable_entity }
			end
		end
	end

	def create #METHOD IS CALLED AFTER PAYMENT IS MADE
	# Amount in cents

	@charge = Charge.new(charges_params)
	@charge.save
	@amount = (@cart.total_price * 735) 
	

	customer = Stripe::Customer.create(
	  :email => params[:stripeEmail],
	  :source  => params[:stripeToken]
	)

	charge = Stripe::Charge.create(
	  :customer    => customer.id,
	  :amount      => @amount,
	  :description => 'Witch or Wizard',
	  :currency    => 'usd'
	)

	Cart.destroy(session[:cart_id]) 

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_charge
      @charge = Charge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def charge_params
      params.require(:charge).permit(:first_name, :last_name, :address, :city, :state, :email, :total_price)
    end
    
    def charges_params
    	params.require(:charges).permit(:first_name, :last_name, :address, :city, :state, :email, :total_price)
    end	

end
