require 'rubygems'
require 'bundler'
Bundler.require
require 'faye'
require 'thin'
require 'eventmachine'

EventMachine.set_max_timers 10000000
connected_clients = 0

Faye::WebSocket.load_adapter('thin')
bayeux = Faye::RackAdapter.new(
    mount: '/faye',
    timeout: 25
)

bayeux.on(:subscribe) do |client_id|
  connected_clients += 1
  puts "#{connected_clients}"
end

run bayeux
