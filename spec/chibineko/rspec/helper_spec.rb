require 'spec_helper'

RSpec.describe Chibineko::RSpec::Helper do
  it { expect(described_class).to be_a(Module) }
  describe "class of module included" do
    extend Chibineko::RSpec::Helper
    include_chibineko(nil)
    subject { RSpec.current_example.example_group }
    it { expect(subject).to be_a(Class) }
    it { expect(subject).to be_a(described_class) }
    it { expect(subject).to respond_to(:include_chibineko) }
  end
end
