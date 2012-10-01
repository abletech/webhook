require 'spec_helper'
require 'webhook'

describe Webhook::Configuration do

  it "provides default values" do
    assert_config_default :user_agent, "Webhook"
  end

  it "allows values to be overwritten" do
    assert_config_overridable :user_agent
  end

  it "acts like a hash" do
    config = Webhook::Configuration.new
    hash = config.to_hash
    Webhook::Configuration::OPTIONS.each do |option|
      config[option].should eq(hash[option])
    end
  end

  it "is mergable" do
    config = Webhook::Configuration.new
    hash = config.to_hash
    config.merge(:key => 'value').should eq(hash.merge(:key => 'value'))
  end

  it "gives a new instance if non defined" do
    Webhook.configuration = nil
    Webhook.configuration.should be_a_kind_of(Webhook::Configuration)
  end

  def assert_config_default(option, default_value, config = nil)
    config ||= Webhook::Configuration.new
    config.send(option).should eq(default_value)
  end

  def assert_config_overridable(option, value = 'a value')
    config = Webhook::Configuration.new
    config.send(:"#{option}=", value)
    config.send(option).should eq(value)
  end
end
