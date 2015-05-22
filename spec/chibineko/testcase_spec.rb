require "spec_helper"
RSpec.describe Chibineko::TestCase do
  it { expect(described_class).to be_a(Class) }
  it { expect(described_class).to respond_to(:retrieve) }
  it { expect(described_class).to respond_to(:load_from_file) }
  let(:testcase_url){ "https://chibineko.jp/t/_op4xxVZqT-8KMd4S6FTgw" }
  let(:testcase_path){ File.expand_path("../../fixtures/testcase.1.csv",__FILE__) }

  describe ".retrieve" do
    subject { described_class.retrieve(testcase_url) }
    it { expect(subject).to be_a(described_class) }
    it { expect(subject.items.size).to eq 11 }
    it { expect(subject.source).to eq testcase_url }
    it { expect(subject.items.sample.source).to eq testcase_url }
  end

  describe ".load_from_local" do
    subject { described_class.load_from_file(testcase_path) }
    it { expect(subject).to be_a(described_class) }
    it { expect(subject.items.size).to eq 11 }
    it { expect(subject.source).to eq testcase_path }
    it { expect(subject.items.sample.source).to eq testcase_path }
  end

  describe ".new" do
    subject do
      data = File.read(testcase_path, encoding: "UTF-8")
      described_class.new(data, testcase_path)
    end
    
    it { expect(subject).to be_a(described_class) }
    it { expect(subject.items.size).to eq 11 }
    it { expect(subject.source).to eq testcase_path }
    it { expect(subject.items.sample.source).to eq testcase_path }
  end
end
