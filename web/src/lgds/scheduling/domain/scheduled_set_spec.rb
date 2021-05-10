RSpec.describe LGDS::Scheduling::Domain::ScheduledSet do
  before do
    @factory = LGDSFactory.new
  end

  it 'ensures members within set are unique' do
    expect do
      described_class.new([
        @factory.pair(@factory.member(name: 'A'), @factory.member(name: 'B')),
        @factory.pair(@factory.member(name: 'B'), @factory.member(name: 'C')),
      ])
    end.to raise_error(RuntimeError, 'Members within set must be unique.')
  end
end
