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
  	@recent_events << OpenStruct.new(type: 'enter', user: user_id, cage: cage.id, time: now)
  	return _error(BikeCage::Error::User::NotAUser, cage, user_id) unless users.map{|u| u.id}.include? user_id
  	return _error(BikeCage::Error::User::InsufficientFunds, cage, user_id) unless users.find{|u| u.id == user_id}.funds > _funds_limit
  	cage.user_entered(user_id)	
  	users.find{|u| u.id == user_id}.start_charge(cage, now)
  	OpenStruct.new(success?: true)
  end

  def _funds_limit
  	10 # 10 cents
  	# could make it fancy- depend on time of day and cage
  end

  def _error error_type, cage, user_id
  	now = Time.now
  	event = OpenStruct.new(user: user_id, cage: cage.id, type: error_type, time: now)
  	@recent_events << event
  	OpenStruct.new(success?: false, errors: [error_type])
  end
end
