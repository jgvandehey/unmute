Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :twitter, ENV['Jxh8anc9BaYFr9zQQhNIoEyiC'], ENV['Fz2IGnW0TZyD4vhVoAq25HTwr4CwtbfvUkND0r3EqKx8omLkdI']
end