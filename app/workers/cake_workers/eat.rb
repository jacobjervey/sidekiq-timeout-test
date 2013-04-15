module CakeWorkers
  class Eat
    include Sidekiq::Worker
    sidekiq_options :retry => false, :timeout => 5
    
    def perform(id)
      Cake.find(id).eat!
    end
  end
end