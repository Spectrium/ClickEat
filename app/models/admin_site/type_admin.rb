class AdminSite::TypeAdmin < ApplicationRecord
  has_many :admins, class_name: "admin"
end
