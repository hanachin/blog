# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
::Bundler.require

loader = ::Zeitwerk::Loader.new
loader.push_dir("#{__dir__}/app")
loader.push_dir("#{__dir__}/lib")
loader.enable_reloading
loader.setup

if ENV['RACK_ENV'] == 'development'
  use Rack::Static, urls: [''], root: 'public/dev', cascade: true, index: 'index.html'
else
  use Rack::Static, urls: [''], root: 'public/prod', cascade: true, index: 'index.html'
end

run -> env do
  loader.reload
  ::Blog.call(env)
rescue => e
  if e.respond_to?(:call)
    e.call(env)
  else
    raise
  end
end
