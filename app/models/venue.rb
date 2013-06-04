class Venue < ActiveRecord::Base
  attr_accessible :capacity, :count, :name, :notification
  validates_presence_of :name, :capacity, :count, :notifiction => true
  validates_length_of :notification,:minimum => 1, :maximum => 140, :too_short => 'Way to short, yo', :too_long => 'Wayyy to long'


def percentfull
	temp = count.to_f/capacity.to_f * 100
	temp.to_i
end


end
