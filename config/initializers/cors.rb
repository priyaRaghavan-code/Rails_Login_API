Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # origins 'http://localhost:3000'
    origins 'https://auth123-front-end.herokuapp.com'

    resource '*',
      headers: :any,
      methods: [:get, :post, :options, :head],
      credentials: false
  end
end