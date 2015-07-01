#Dream session config and methods
class DreamSession < ActiveRecord::Base
  belongs_to :user
  belongs_to :band
  
end
