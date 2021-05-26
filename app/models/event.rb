class Event < ApplicationRecord
    has_and_belongs_to_many :hosts
    has_and_belongs_to_many :guests
    has_many :menus,  dependent: :destroy
    #has_one_attached :image

end
