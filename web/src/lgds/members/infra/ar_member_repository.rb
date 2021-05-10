module LGDS::Members
  module Infra
    class ARMemberRepository < Domain::MemberRepository
      def get(id)
        record_to_domain(Member.find_by!(id: id))
      end

      def find(id)
        record = Member.find_by(id: id)
        record ? record_to_domain(record) : nil
      end

      def save(member)
        if member.id
          Member.update(member.id, name: member.name)
        else
          member.instance_variable_set(:@id, Member.create!(name: member.name).id)
        end
      end

      private

      # @param record [Member]
      def record_to_domain(record)
        Domain::Member.new(name: record.name, id: record.id)
      end
    end
  end
end