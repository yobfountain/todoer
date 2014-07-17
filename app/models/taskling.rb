# == Schema Information
#
# Table name: tasklings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  task_id    :integer
#  completed  :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Taskling < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  validates_presence_of :user_id, :task_id
end
