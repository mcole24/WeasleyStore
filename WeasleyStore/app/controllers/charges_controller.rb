class ChargesController < ApplicationController
    include CurrentCart
    before_action :set_cart, only: [:new, :create]
    #before_action :set_charge, only: [:create]

    def new
    	@charge = Charge.new
	end

	def create #METHOD IS CALLED AFTER PAYMENT IS MADE
	# Amount in cents

	@charge = Charge.new(charge_params)
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
      params.require(:charges).permit(:first_name, :last_name, :address, :city, :state, :email, :total_price)
    end

end
