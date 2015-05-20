# -*- coding: utf-8 -*-
require "rspec/expectations"

RSpec::Matchers.define :be_ok do
  match do |actual|
    actual.ok?
  end

  description do 
    "should be complete."
  end

  failure_message do |actual|
    if actual.execute?
      # NG
      "expected that #{actual.item} should be completed."
    else
      # 未実施
      "expected that #{actual.item} should be executed."
    end
  end
end
