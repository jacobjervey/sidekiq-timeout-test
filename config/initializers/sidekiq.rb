Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.insert_before(Sidekiq::Middleware::Server::Timeout, Kiqstand::Middleware)
  end
end