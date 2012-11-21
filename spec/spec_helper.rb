require 'minitest/autorun'
require_relative '../lib/bootstrap'

Dir['lib/**/*.rb'].each { |file| require File.expand_path(file) }