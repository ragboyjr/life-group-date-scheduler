require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect("lgds" => "LGDS")
loader.inflector.inflect("ui" => "UI")
loader.inflector.inflect("ar_member_repository" => "ARMemberRepository")
loader.inflector.inflect("ar_group_repository" => "ARGroupRepository")
loader.setup

# Life Group Date Schedule
module LGDS
end
