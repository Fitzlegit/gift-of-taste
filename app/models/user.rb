#create class and inherit active records methods
class User < ActiveRecord::Base
has_many :recipes #establish relation with macro to recipes in database and genrate some sql methods
has_secure_password #macro for encrpyting password with bcrypt
end
