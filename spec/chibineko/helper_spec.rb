require 'spec_helper'
RSpec.describe Chibineko::RSpec::Helper do
  it { expect(described_class).to be_a(Module) }
  it { expect(described_class).to respond_to(:includes_chibineko) }
end
