Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :twitter,'u0oxwnJPj3M9WGEQE5y7dfVYQ', 'Yx1Oy3GQdvszDWNDX3PHjcuVFx4uvcjUpkPPi3UhLx65McNQjj'
end