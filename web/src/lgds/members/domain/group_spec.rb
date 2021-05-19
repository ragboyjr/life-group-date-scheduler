RSpec.describe LGDS::Members::Domain::Group do
  def Domain() LGDS::Members::Domain end

  it 'can create from command' do
    command = Domain()::CreateGroup.new(name: 'Group 1')
    group = Domain()::Group.create(command)
    expect(group.name).to eq('Group 1')
  end
end