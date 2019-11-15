class Article < ActiveRecord::Base
 validates :title, presence: true, length: {minimum:3,maximum:50} #makes title compulsory
 validates :description, presence: true, length: {minimum:10,maximum:300}
end    

#getters & setters are provided by
#model allows adding validation/ constraints at model layer