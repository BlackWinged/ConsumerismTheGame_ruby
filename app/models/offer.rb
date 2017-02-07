class Offer < ApplicationRecord
  belongs_to :source, :class_name => 'user'
  belongs_to :target, :class_name => 'user'
  has_many :items
end
