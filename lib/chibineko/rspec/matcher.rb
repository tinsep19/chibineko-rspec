# -*- coding: utf-8 -*-
require "rspec/expectations"

RSpec::Matchers.define :be_ok do
  match do |actual|
    actual.ok?
  end

  description do 
    "should be passed."
  end
  
  failure_message do |actual|
    "expected that #{actual.item} should be passed."
  end
end
