# coding: utf-8
RSpec.describe Chibineko::TestItem do
  HEADERS = ["-","-","-","-","","",""]
  it { expect(described_class).to be_a(Class) }
  subject { described_class.new(row,"http://www.example.com",1) }
  let(:row) { CSV::Row.new(HEADERS,['group1','group2','group3',nil,"item","OK","memo"]) }

  its(:memo) { should eq "memo" }
  its(:item) { should eq "item" }
  its(:status) { should eq "OK" }
  its(:groups) { expect(subject.groups.size).to eq 5 }
  its(:groups) { expect(subject.groups).to eq ["group1","group2","group3", nil, nil] }
  
  describe "ok?" do
    before { subject.status = "OK"}
    it { expect(subject.ok?).to be_truthy }
  end
  describe "ng?" do
    before { subject.status = "NG"}
    it { expect(subject.ng?).to be_truthy }
  end
  describe "ng?" do
    before { subject.status = "未実施"}
    it { expect(subject.ng?).to be_truthy }
  end
  describe "pending?" do
    before { subject.status = "保留中"}
    it { expect(subject.pending?).to be_truthy }
  end
  describe "skip?" do
    before { subject.status = "対象外"}
    it { expect(subject.skip?).to be_truthy }
  end
  describe "execute?" do
    before { subject.status = "OK"}
    it { expect(subject.execute?).to be_truthy }
  end
  describe "execute?" do
    before { subject.status = "NG"}
    it { expect(subject.execute?).to be_truthy }
  end

end
