class Comment < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :state
  belongs_to :author, class_name: "User"
  delegate :project, to: :ticket

  validates :text, presence: true

  scope :persisted, -> { where.not(id: nil) }

  after_create :set_ticket_state

  private

    def set_ticket_state
      ticket.state = state
      ticket.save!
    end
end
