class EventMailer < ApplicationMailer
    default from: 'sangeetadhiman2003@.com'
  
    def event_reminder(user, event)
      @user = user
      @event = event
      mail(to: @user.email, subject: "Reminder: #{@event.title} is coming up!")
    end
  end
  