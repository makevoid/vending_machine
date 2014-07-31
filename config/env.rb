require 'bundler/setup'
Bundler.require :default


# infer path
path = File.expand_path "../../", __FILE__
PATH = path

require 'logger'

require "#{path}/data/coin"
require "#{path}/data/product"
require "#{path}/lib/vending_machine"