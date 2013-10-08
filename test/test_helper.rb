ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails/capybara'
require 'valid_attribute'
require 'minitest/matchers'
require 'context_validations/minitest'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  
  class << self
    alias :context :describe
  end

  include ::ValidAttribute::Method

  def self.must(&block)
    it { subject.must instance_eval(&block) }
  end

  def self.wont(&block)
    it { subject.wont instance_eval(&block) }
  end

  def must(*args, &block)
    subject.must(*args, &block)
  end

  def wont(*args, &block)
    subject.wont(*args, &block)
  end
end
