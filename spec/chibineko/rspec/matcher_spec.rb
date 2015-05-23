require 'spec_helper'
require 'securerandom'
RSpec.describe :be_ok do
  subject { be_ok }

  let(:passed) do
    item = double('passed')
    allow(item).to receive(:ok?) { true }
    item
  end

  let(:failed) do
    item = double('failed')
    item_desc = SecureRandom.uuid
    allow(item).to receive(:ok?) { false }
    allow(item).to receive(:execute?) { true }
    allow(item).to receive(:item) { item_desc }
    item
  end
  
  let(:not_started) do
    item = double('not_started')
    item_desc = SecureRandom.uuid
    allow(item).to receive(:ok?) {false}
    allow(item).to receive(:execute?) {false}
    allow(item).to receive(:item) { item_desc }
    item
  end
  
  its(:description) { should eq "should be passed." }
  describe "match" do
    it { expect(subject.matches?(passed)).to be_truthy }
    it { expect(subject.matches?(failed)).to be_falsy }
    it { expect(subject.matches?(not_started)).to be_falsy }
  end

  it "failure_message include testitem.item" do
    subject.matches?(not_started)
    expect(subject.failure_message).to include(not_started.item)
  end

end
