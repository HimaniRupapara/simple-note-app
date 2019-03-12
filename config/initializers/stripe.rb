Rails.configuration.stripe = {
  :publishable_key => 'pk_test_fJNySMaTYIw8DCUcGrnMDoWM',
  :secret_key      => 'sk_test_OD45guyTa64bcJlE7AZM2amE'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
