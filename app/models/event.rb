class Event < ApplicationRecord
    validates :title, presence: true
    validates :date, presence: true
    validates :location, presence: true
    validates :description, length: { maximum: 500 }
  
    has_many :attendees, dependent: :destroy
    has_many :users, through: :attendees
  
    def upcoming?
      date > Time.now
    end
  
    def today?
      date.to_date == Date.today
    end
  
    def send_reminder
      EventMailer.event_reminder(self).deliver_now
    end
  end
  