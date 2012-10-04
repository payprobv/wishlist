require File.expand_path('../../lib/wishlist.rb', __FILE__)

require 'minitest/autorun'
require 'webmock/minitest'
require 'turn'
require 'vcr'

Turn.config do |c|
  c.format = :outline
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/wishlist_cassettes'
  c.hook_into :webmock
  
  c.ignore_request do |req|
    URI(req.uri).query == "/wlmapi/2.0/json/auth"
  end
end