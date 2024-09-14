class User < ApplicationRecord
    # Include Devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable, :trackable
  
    # Validations
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :user_type, inclusion: { in: ['admin', 'regular'] }

    has_many :attendees
    has_many :events, through: :attendees
  
    def admin?
      self.admin
    end
  end
  