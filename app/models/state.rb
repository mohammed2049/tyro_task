class State < ApplicationRecord
  validates :os, :memory, :device, :storage, presence: true
  has_one :feedback
end
