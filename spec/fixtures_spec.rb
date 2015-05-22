require "spec_helper"
RSpec.describe "fixtures" do
  subject do
    file = filename
    fixture = File.expand_path("../fixtures/#{file}",__FILE__)
    Chibineko::TestCase.load_from_file(fixture)
  end
  
  describe "Japanese csv" do
    let(:filename) {"testcase.1.csv"}
    it { expect(subject.items.find {|item| item.ok?}.status).to eq "OK" }
    it { expect(subject.items.find {|item| item.ng? && item.execute?}.status).to eq "NG" }
  end
  
  describe "English csv" do
    let(:filename) {"testcase.2.csv"}
    it { expect(subject.items.find {|item| item.ok?}.status).to eq "Passed" }
    it { expect(subject.items.find {|item| item.ng? && item.execute?}.status).to eq "Failed" }
  end
end
