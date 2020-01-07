class User < ApplicationRecord
 #relation
has_one_attached :avatar
has_one :cart, dependent: :destroy

validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
validates :username, presence: true
validates :first_name, presence: true
validates :last_name, presence: true
validates :phone_number, presence: true, format: { with: Regexp.new('\A3[2|3|4][0-9]{2}[0-9]{3}[0-9]{2}\z'), message:"Veuillez entrer un numero de telephone" }
validates :password, presence: true, length: {minimum: 6}, on: :create
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def get_phone_number
    operator = self.phone_number[0..1]
    primary = self.phone_number[2..3]
    secondary = self.phone_number[4..6]
    third = self.phone_number[7..8]
    return "#{operator}-#{primary}-#{secondary}-#{third}"
  end

  def next
    self.class.where("id > ?", id).first
  end

  def previous
    self.class.where("id < ?", id).last
  end

end
