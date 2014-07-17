# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  admin      :boolean
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
	has_many :tasks
	has_many :tasklings

end
