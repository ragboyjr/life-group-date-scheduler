class CreateGroupMembersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :groups, :members do |t|
      t.index [:group_id]
      t.index [:member_id, :group_id], unique: true
    end
  end
end
