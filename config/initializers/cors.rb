Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins [
        "http://localhost:3000",
        "http://apps.itassetmgt.com",
        "https://itassetmgt-7659d44ac774.herokuapp.com",
        "https://itassetmgt-7659d44ac774.herokuapp.com/api/v1",
    ]
    
      resource "*",
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        credentials: true
    end
  end
 