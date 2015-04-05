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
	has_many :tasklings, dependent: :destroy 
	has_many :users, through: :tasklings
	validates_presence_of :name

	def print_status
		states = ["inactive", "active", "closed"]
		states[self.status]
	end

	def update_list
		self.list.users.each do |user|
			Taskling.create(user: user, task: self, status: 1)
		end
	end

	def taskling_for(user)
		Taskling.find_by(user: user, task: self)
	end

	def percent_complete
		(self.tasklings.where(status: 3).size.to_f / self.tasklings.size.to_f) * 100
	end

end
