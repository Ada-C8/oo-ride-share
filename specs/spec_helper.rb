require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/driver'
require_relative '../lib/passenger'
require_relative '../lib/trip'

# Add simplecov

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# Require_relative your lib files here!

#Spec helper from previous projects.
# require 'simplecov'
# SimpleCov.start
# require 'minitest/autorun'
# require 'minitest/reporters'
# require 'minitest/skip_dsl'
