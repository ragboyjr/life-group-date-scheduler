RSpec.describe LGDS::Domain::ScheduledPair do
  Member = LGDS::Domain::Member
  it 'ensure pairs match regardless of order' do
    expect(
      described_class.pair(Member.new(name: 'A'), Member.new(name: 'B'))
    ).to eq(described_class.pair(Member.new(name: 'B'), Member.new(name: 'A')))
  end
end
