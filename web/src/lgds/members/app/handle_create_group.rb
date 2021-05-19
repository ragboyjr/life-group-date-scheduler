module LGDS::Members
  module App
    class HandleCreateGroup
      # @param repo [Domain::GroupRepository]
      def initialize(repo)
        @repo = repo
      end

      # @param command [Domain::CreateGroup]
      def call(command)
        @repo.save(Domain::Group.create(command))
      end
    end
  end
end