class ChargesController < ApplicationController
  protect_from_forgery
  def new
  end

  def create
    # Amount in cents
    @amount = params[:amount]

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })

    respond_to do |format|
      format.html
      format.js
  end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
