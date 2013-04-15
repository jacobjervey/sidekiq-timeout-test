module CakeWorkers
  class FindAndEat
    include Sidekiq::Worker
    sidekiq_options :retry => false, :timeout => 10

    def perform
      if Cake.count == 0
        for i in 1..200 do
          Cake.bake!
        end
      end
      Cake.all.each do |cake|
        CakeWorkers::Eat.perform_async(cake.id)
      end
    end
  end
end