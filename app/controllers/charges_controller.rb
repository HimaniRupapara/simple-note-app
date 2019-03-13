class ChargesController < ApplicationController
  protect_from_forgery

  def new
  end

  def create
  # redirect_to notes_path and return
    # Amount in cents
    @amount = 5000

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
    if charge
      @note = Note.find(params[:note_id])
      @note.chargeID=charge.id
      @note.save
      redirect_to root_path
      flash[:notice] = 'payment done successfully'
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path

end

def refund
    @note = Note.find(params[:id])
    refund = Stripe::Refund.create({
    charge: @note.chargeID,
    amount: 5000,
    })
    @note.chargeID=nil
    @note.save
    redirect_to root_path
    flash[:notice] = 'Your amount successfully refunded'
end
end
