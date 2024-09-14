class Attendee < ApplicationRecord
    after_create :send_event_reminder

    belongs_to :user
    belongs_to :event
  
    validates :user_id, presence: true
    validates :event_id, presence: true
    validates :user_id, uniqueness: { scope: :event_id, message: "has already registered for this event" }
    
    
  private

  def send_event_reminder
    if event.date.to_date == 2.days.from_now.to_date
      EventMailer.event_reminder(user, event).deliver_now
    end

end
  