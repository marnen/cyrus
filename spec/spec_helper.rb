require 'minitest/autorun'
require_relative '../bootstrap'

Dir['lib/**/*.rb'].each { |file| require File.expand_path(file) }