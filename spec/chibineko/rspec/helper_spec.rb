require 'spec_helper'

RSpec.describe Chibineko::RSpec::Helper do
  it { expect(described_class).to be_a(Module) }
  it { expect(described_class).to be_public_method_defined(:include_chibineko) }
  describe "#include_chibineko" do
    let(:testcase_url) {"http://example.com/t/TESTCASE_ID"}
    subject do
      klass = Class.new
      klass.extend described_class
      klass
    end

    it "#include_chibineko" do
      testcase = double('testcase')
      exporter = double('exporter')      

      expect(Chibineko::TestCase).to receive(:retrieve).with(testcase_url) { testcase }
      expect(Chibineko::RSpec::ExampleGroupExporter)
        .to(receive(:new).with(subject, testcase) { exporter })

      expect(exporter).to receive(:export).with(no_args)
      
      expect { subject.include_chibineko(testcase_url) }.not_to raise_error
    end
    
  end
end
