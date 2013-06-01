class Venue < ActiveRecord::Base
  attr_accessible :capacity, :count, :name, :notification
end
