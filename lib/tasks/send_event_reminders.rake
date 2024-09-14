namespace :events do
    desc 'Send event reminders for events happening in 2 days'
    task send_reminders: :environment do
      upcoming_events = Event.where(date: 2.days.from_now.to_date)
      upcoming_events.find_each do |event|
        users = event.attendees.map(&:user).uniq
        users.each do |user|
          EventMailer.event_reminder(user, event).deliver_now
        end
      end
    end
  end
  