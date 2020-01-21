#create recipe class and inherit activerecords methods
class Recipe < ActiveRecord::Base
  belongs_to :user #macro to build sql methods and establish relation in database
end
