class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String #login with email or phone number..
  field :phone, type: String
  
  embeds_one :location  # For now, just one location per user
  embeds_one :extended_profile, validate: false # Optional

  before_save { self.email = email.downcase }
  validates_presence_of :name, :location #, and one login method:
  										 # either email or phone
end