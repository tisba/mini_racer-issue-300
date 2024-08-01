# frozen_string_literal: true

require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "mini_racer", "0.13.0"
end

require "libv8-node"
require "rbconfig"

puts "RbConfig::CONFIG['LIBS']: #{RbConfig::CONFIG["LIBS"]}"
puts "RUBY_VERSION : #{RUBY_VERSION}"
puts "RUBY_PLATFORM: #{RUBY_PLATFORM}"
puts "MiniRacer::VERSION: #{MiniRacer::VERSION}"
puts "MiniRacer::LIBV8_NODE_VERSION: #{MiniRacer::LIBV8_NODE_VERSION}"
puts "Libv8::Node::VERSION: #{Libv8::Node::VERSION}"
puts "Libv8::Node::NODE_VERSION: #{Libv8::Node::NODE_VERSION}"
puts "Libv8::Node::LIBV8_VERSION: #{Libv8::Node::LIBV8_VERSION}"

Thread
  .new do
    ctx = MiniRacer::Context.new
    ctx.eval(File.read("./eval.js"))
  end
  .join
