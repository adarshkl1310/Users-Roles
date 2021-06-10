class Home < ApplicationRecord

belongs_to :user

has_attached_file :image, styles: { medium: "300x300>", thumb: "240x87>" }, default_url: "/images/:style/missing.png"

validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/	
validates_presence_of :photo_name, presence:{:message => "Photo Name can't be blank"}
validates_presence_of :image, presence:{:message => "Image can't be blank"}
end
