require "spec_helper"
RSpec.describe Chibineko::RSpec::ExampleGroupExporter do
  it { expect(described_class).to be_a(Class) }
  subject { described_class.new(root,testcase) }
  let(:root) { double('root').as_null_object }
  let(:testcase) {
    testcase = double('testcase').as_null_object
    allow(testcase).to receive(:items) { [] }
    testcase
  }
  
  describe "#export is recureve " do
    it "create example group following groups" do
      parent = double("parent").as_null_object
      items = 3.times.map do |i|
        item = double("item#{i}")
        groups = Array.new(5,nil)
        groups[0..2] = 3.times.map {|j| "group_#{j}"}
        allow(item).to receive(:groups) { groups }
        item
      end
      
      expect(parent).to receive(:describe) do |desc, &block|
        expect(subject).to receive(:export)
        parent.instance_eval(&block)
      end
      
      expect{ subject.export(parent,items) }.not_to raise_error
    end
  end

  describe "#create_example" do
    it "make it / pending example when item is pending" do
      parent = double('parent').as_null_object
      item = double('item').as_null_object
      allow(item).to receive(:pending?) { true }
      allow(item).to receive(:item) { "item_name" }
      allow(item).to receive(:memo) { "item_memo" }
      
      allow(parent).to receive(:it) do |desc, &block|
        itc = double('it_context')
        expect(itc).to receive(:pending).with("item_memo")
        itc.instance_eval(&block)
      end
      
      expect { subject.create_example(parent,item) }.not_to raise_error
    end

    it "make it / be_ok example when item is neither pending and skip" do
      parent = double('parent').as_null_object
      item = double('item').as_null_object
      allow(item).to receive(:skip?) { false }
      allow(item).to receive(:pending?) { false }

      allow(parent).to receive(:it) do |desc, &block|
        itc = double('it_context')
        expect(itc).to receive(:expect) { parent }
        expect(itc).to receive(:be_ok) { parent }
        itc.instance_eval(&block)
      end
      expect { subject.create_example(parent,item) }.not_to raise_error
    end

    it "make xit / be_ok example when item is skip" do
      parent = double('parent').as_null_object
      item = double('item').as_null_object
      allow(item).to receive(:pending?) { false }
      allow(item).to receive(:skip?) { true }
      allow(parent).to receive(:xit) do |desc, &block|
        itc = double('it_context')
        expect(itc).to receive(:expect) { parent }
        expect(itc).to receive(:be_ok) { parent }
        itc.instance_eval(&block)
      end

      expect { subject.create_example(parent,item) }.not_to raise_error
    end
  end
end
