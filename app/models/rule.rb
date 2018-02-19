class Rule < ApplicationRecord
  belongs_to :badge, optional: true
end
