#Rails.configuration.stripe = { 
#    publishable_key: ENV['stripe_publishable_key'], 
#    secret_key: ENV['stripe_secret_key'] 
    
#} 

#Stripe.api_key = Rails.configuration.stripe[:secret_key]


Stripe.api_key = Rails.application.secrets.stripe_secret_key
raise "Missing Stripe API Key" unless Stripe.api_key