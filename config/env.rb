require 'bundler/setup'
Bundler.require :default


# infer path
path = File.expand_path "../../", __FILE__
PATH = path

require 'logger'

require "#{path}/lib/vending_machine"
require "#{path}/data/coin"