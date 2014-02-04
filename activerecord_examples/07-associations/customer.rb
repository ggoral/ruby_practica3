class Customer < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  validates :name, presence: true

  before_validation :normalize_name, on: :create
 
  protected
    def normalize_name
      self.name = name.downcase.titleize
    end
end
