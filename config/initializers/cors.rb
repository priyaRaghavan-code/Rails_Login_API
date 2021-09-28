Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # origins '*'
    origins 'http://localhost:3000'
    # origins 'https://auth1234-front-end.herokuapp.com'
    # origins Figaro.env.frontend_url

    resource '*',
      headers: :any,
      methods: [:get, :post, :options, :head],
      credentials: false
  end
end