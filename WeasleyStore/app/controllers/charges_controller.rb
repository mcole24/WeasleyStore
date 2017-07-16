class ChargesController < ApplicationController
    include CurrentCart
    before_action :set_cart, only: [:new, :create]

    def new
	end

	def create #METHOD IS CALLED AFTER PAYMENT IS MADE
	# Amount in cents
	@amount = (@cart.total_price * 735) + 100
	

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

end
