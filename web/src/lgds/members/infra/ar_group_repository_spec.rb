require 'rails_helper'

RSpec.describe LGDS::Members::Infra::ARGroupRepository do
  def Infra() LGDS::Members::Infra end

  def given_a_group(name:)
    Group.create(name: name)
  end


  context 'getting groups' do
    it 'throws when group does not exist' do
      repo = Infra()::ARGroupRepository.new
      expect do
        repo.get(1)
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  context 'finding groups' do
    it 'returns nil when group does not exist' do
      repo = Infra()::ARGroupRepository.new
      expect(repo.find(1)).to be_nil
    end

    it 'returns the group by id' do
      given_a_group(name: 'Group 1')

      repo = Infra()::ARGroupRepository.new
      group = repo.find(1)

      expect(group.name).to eq('Group 1')
      expect(group.id).to eq(1)
    end
  end
end
