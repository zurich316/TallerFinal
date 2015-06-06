class BandInformation < ActiveRecord::Base
  belongs_to :user
  belongs_to :band
  validates :steps, :lat,:long,:calories , presence: true
end
