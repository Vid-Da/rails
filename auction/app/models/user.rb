class User < ActiveRecord::Base
	has_many :products

	validates :name, :email, uniqueness: true
	validates :name, :email, presence: true


	def self.list_users(num)
		User.order('created_at DESC').limit(num)
	end
end
