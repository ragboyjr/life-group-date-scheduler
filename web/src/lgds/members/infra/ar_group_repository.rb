module LGDS::Members
  module Infra
    class ARGroupRepository < Domain::MemberRepository

      def get(id)
        record_to_domain(Group.find_by!(id: id))
      end

      def find(id)
        group = Group.find_by(id: id)
        group ? record_to_domain(group) : nil
      end

      private

      # @param record [Group]
      def record_to_domain(record)
        Domain::Group.new(name: record.name, id: record.id)
      end
    end
  end
end