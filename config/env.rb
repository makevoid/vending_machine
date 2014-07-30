require 'bundler/setup'
Bundler.require :default


# infer path
path = File.expand_path "../../", __FILE__
PATH = path

module VendingMachine
end

require "#{path}/lib/vending_machine"