# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  status     :integer
#

class Task < ActiveRecord::Base
	belongs_to :user
	belongs_to :list
	has_many :tasklings
	has_many :users, through: :tasklings
	validates_presence_of :name

	def print_status
		states = ["inactive", "active", "closed"]
		states[self.status]
	end

end
