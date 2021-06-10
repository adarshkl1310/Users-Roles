class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :set_default_role
  has_many :home, dependent: :destroy
  belongs_to :role

  validates_presence_of :username, presence:{:message => "Name can't be blank"}
  validates_presence_of :city,presence:{:message => "City Name can't be blank"}
  validates_presence_of :gender, presence:{:message => "Gender type can't be blank"}
   
 private

 def set_default_role
 	self.update(role_id: Role.find_by(code: 'default').id)
 end	
 

end
