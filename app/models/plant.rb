class Plant < ApplicationRecord
    belongs_to :garden

    validates :species, presence: true
end
