# == Schema Information
#
# Table name: completed_tasks
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  task_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class CompletedTaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
