class Phone < ApplicationRecord
  belongs_to :person
  belongs_to :division
end
