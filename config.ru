# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
::Bundler.require

loader = ::Zeitwerk::Loader.new
loader.push_dir("#{__dir__}/app")
loader.push_dir("#{__dir__}/lib")
loader.enable_reloading
loader.setup

run -> env do
  loader.reload
  ::Blog.call(env)
end
