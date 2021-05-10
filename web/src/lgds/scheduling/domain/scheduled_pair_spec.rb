RSpec.describe LGDS::Scheduling::Domain::ScheduledPair do
  before do
    @factory = LGDSFactory.new
  end

  it 'ensure pairs match regardless of order' do
    expect(
      described_class.pair(@factory.member(name: 'A'), @factory.member(name: 'B'))
    ).to eq(described_class.pair(@factory.member(name: 'B'), @factory.member(name: 'A')))
  end

  it 'ensures pair is unique' do
    expect do
      described_class.pair(@factory.member(name: 'A'), @factory.member(name: 'A'))
    end.to raise_error(RuntimeError, 'Pair must not contain duplicates.')
  end
end
