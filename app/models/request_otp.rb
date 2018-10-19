class RequestOtp 

  include ActiveModel::Model

  attr_accessor :email, :password
  validates_presence_of :password,:email
end
end
