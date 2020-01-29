class Restaurant < ApplicationRecord
    #relation
    has_many :resto_specialities
    has_many :specialities, through: :resto_specialities
    has_many :dishes
    has_one_attached :logo  
    has_one_attached :picture

    validates :name, presence: true
    validates :location, presence: true
    validates :description, presence: true
    validates :phone_number, presence:true, format: { with: Regexp.new('\A3[2|3|4][0-9]{2}[0-9]{3}[0-9]{2}\z'), message:"Veuillez entrer un numero de telephone" }
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

    
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