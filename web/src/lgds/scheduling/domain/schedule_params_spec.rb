RSpec.describe LGDS::Scheduling::Domain::ScheduleParams do
  it 'can be created' do
    params = described_class.new(start_date: Date.new(2021, 05, 01))
    expect(params).to be_instance_of(LGDS::Scheduling::Domain::ScheduleParams)
  end
end
