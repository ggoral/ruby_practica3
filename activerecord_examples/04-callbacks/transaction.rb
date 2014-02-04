class Transaction < ActiveRecord::Base
  validates :name, presence: true

  before_validation :normalize_name, on: :create
 
  protected
    def normalize_name
      #puts self.name
      self.name = name.downcase.titleize * 3
    end
end
