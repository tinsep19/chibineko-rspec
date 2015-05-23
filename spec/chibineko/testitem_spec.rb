# coding: utf-8
require "spec_helper"


RSpec.describe Chibineko::TestItem do
  HEADERS = ["-","-","-","-","","",""]
  subject { described_class.new(row, "http://www.example.com",1) }
  let(:row) do
    data = ['group1', 'group2', 'group3', nil, "item", "OK", "memo"]
    CSV::Row.new(HEADERS, data)
  end

  it { expect(described_class).to be_a(Class) }  
  its(:memo) { should eq "memo" }
  its(:item) { should eq "item" }
  its(:status) { should eq "OK" }

  it "#groups.size always 5" do
    expect(subject.groups.size).to eq 5
  end
  it "#groups should be padding using nil" do
    expect(subject.groups).to eq ["group1", "group2", "group3", nil, nil]
  end

  [:ok?, :ng?, :pending?, :skip?, :execute?].each do |m|
    shared_examples "#{m}" do |lit, truthy_or_falsy|
      it "#{m} returns #{truthy_or_falsy} when #status is \"#{lit}\"" do
        subject.status = lit
        matcher = truthy_or_falsy ? be_truthy : be_falsy
        expect(subject.send(m)).to(matcher)
      end
    end
  end

  describe "status queries" do
    include_examples "ok?", "OK", true 
    include_examples "ok?", "Passed", true 
    include_examples "ng?", "NG", true 
    include_examples "ng?", "Failed", true 
    include_examples "ng?", "未実施", false
    include_examples "ng?", "Not started", false
    include_examples "pending?", "保留", true
    include_examples "pending?", "Deferred", true
    include_examples "skip?", "対象外", true
    include_examples "skip?", "N/A", true
    include_examples "execute?", "OK", true
    include_examples "execute?", "NG", true
    include_examples "execute?", "Passed", true
    include_examples "execute?", "Failed", true
    include_examples "execute?", "未実施", false
    include_examples "execute?", "Not started", false

  end
end
