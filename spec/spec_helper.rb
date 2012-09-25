require File.expand_path('../../lib/wishlist.rb', __FILE__)

require 'minitest/autorun'
require 'webmock/minitest'
require 'turn'

Turn.config do |c|
  c.format = :outline
end
