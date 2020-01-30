class User < ApplicationRecord
 #relation
has_one_attached :avatar
belongs_to :subscription
has_one :cart, dependent: :destroy
acts_as_voter

validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
#  validates :username, presence: true
#  validates :first_name, presence: true
#  validates :last_name, presence: true
#  validates :phone_number, presence: true, format: { with: Regexp.new('\A3[2|3|4][0-9]{2}[0-9]{3}[0-9]{2}\z'), message:"Veuillez entrer un numero de telephone" }
validates :password, presence: true, length: {minimum: 6}, on: :create
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook] #, :confirmable
   

  def get_phone_number
    operator = self.phone_number[0..1]
    primary = self.phone_number[2..3]
    secondary = self.phone_number[4..6]
    third = self.phone_number[7..8]
    return "#{operator}-#{primary}-#{secondary}-#{third}"
  end

   #mailer
   after_create :welcome_send

   def welcome_send
     UserMailer.welcome_email(self).deliver_now
   end
   #omniauth Facebook
   def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
  def next
    self.class.where("id > ?", id).first
  end

  def previous
    self.class.where("id < ?", id).last
  end

end
