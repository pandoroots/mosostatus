class Venue < ActiveRecord::Base
  attr_accessible :capacity, :count, :name, :notification


def percentfull
	temp = count.to_f/capacity.to_f * 100
	temp.to_i
end


end
