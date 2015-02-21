class CagesManager
	require 'ostruct'
  attr_reader :cages, :users, :recent_events

  def initialize args
  	@cages = args[:cages]
  	@users = args[:users]
  	@recent_events = []
  end

  def enter cage, user_id
  	now = Time.now
  	@recent_events << OpenStruct.new(type: 'enter', user: user.id, cage: cage.id, time: now)
  	return _error(BikeCage::Error::User::NotAUser) unless users.map{|u| u.id}.include? user_id
  	return _error(BikeCage::Error::User::InsufficientFunds) unless users.find{|u| u.id == user_id}.funds > _funds_limit
  	cage.user_entered(user)	
  	user.start_charge(cage, now)
  end

  def _funds_limit
  	10 # 10 cents
  	# could make it fancy- depend on time of day and cage
  end

  def _error error_type
  	now = Time.now
  	event = OpenStruct.new(user: user.id, cage: cage.id, type: error_type, time: now)
  	@recent_events << event
  	error_type
  end
end
