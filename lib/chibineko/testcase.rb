module Chibineko
  class TestCase
    def initialize(id_or_url)
    end
    def retrieve!
    end
    def export_example_group(group)
      group.it { expect(nil).to be_nil }
    end
  end
end
