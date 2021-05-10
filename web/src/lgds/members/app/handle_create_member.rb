module LGDS::Members
  module App
    class HandleCreateMember
      # @param repo [Domain::MemberRepository]
      def initialize(repo)
        @repo = repo
      end

      # @param command [Domain::CreateMember]
      def call(command)
        @repo.save(Domain::Member.create(command))
      end
    end
  end
end