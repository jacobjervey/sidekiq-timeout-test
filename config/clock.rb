require './config/boot'
require './config/environment'
include Clockwork

every(5.seconds, 'Find and eat cakes') { CakeWorkers::FindAndEat.perform_async }