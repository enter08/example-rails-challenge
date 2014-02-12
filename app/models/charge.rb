class Charge < ActiveRecord::Base
	belongs_to :customer
	validates :currency, presence: true
end
