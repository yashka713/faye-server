require 'rubygems'
require 'bundler'
Bundler.require
require 'faye'
require 'faye/redis'

redis = Redis.new(host: 'localhost', port: 6379, driver: :hiredis)

Faye::WebSocket.load_adapter('thin')
bayeux = Faye::RackAdapter.new(
    mount: '/faye',
    timeout: 100,
    engine: {
        type: Faye::Redis,
        host: 'localhost',
        port: 6379
    }
)

run bayeux
