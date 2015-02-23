class Cage
	def initialize
		@users_inside = []
	end

	def id
		1
	end

	def user_entered user_id
		@users_inside << user_id
	end
end