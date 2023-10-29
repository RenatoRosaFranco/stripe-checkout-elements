# frozen_string_literal: true

class CheckoutsController < ApplicationController
  before_action :verify_authenticy_token, only: :create

  def create
    product = Product.find(params[:product_id])
    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card', 'apple_pay'],
      line_items: [{
        name: product.name,
        description: product.description,
        amount: product.price,
        currency: 'usd',
        quantity: 1
      }],
      success_url: root_url,
      cancel_url: root_url,
    })

    render json: { id: session.id }
  end
end