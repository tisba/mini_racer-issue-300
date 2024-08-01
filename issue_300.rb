# frozen_string_literal: true

require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "mini_racer", "0.13.0"
end

Thread
  .new do
    ctx = MiniRacer::Context.new
    ctx.eval(File.read("./eval.js"))
  end
  .join
