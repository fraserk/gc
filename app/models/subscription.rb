class Subscription < ActiveRecord::Base
  belongs_to :event

  attr_accessor :stripe_card_token

def save_with_payment
  if valid?
    charge = Stripe::Charge.create(description: event_id, card: stripe_card_token, :amount => '1000', :currency => "usd")
    self.stripe_customer_token = stripe_card_token
    save!
  end
rescue Stripe::InvalidRequestError => e
  logger.error "Stripe error while creating customer: #{e.message}"
  errors.add :base, "There was a problem with your credit card."
  false
end
end
