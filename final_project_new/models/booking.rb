class Booking < ActiveRecord::Base
  belongs_to :resource
  belongs_to :user

  before_validation :set_pending_status, on: :create

  validates :resource, :start, :end, presence: true
  validates :status, inclusion: ["pending", "approved"]

  #validates_format_of :user, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  protected
  def set_pending_status
    self.status = "pending"
  end
end