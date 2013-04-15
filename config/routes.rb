require 'sidekiq/web'
SidekiqTimeoutTest::Application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
end
