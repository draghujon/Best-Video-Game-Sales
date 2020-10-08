class Region < ApplicationRecord
  has_many :region_sales, dependent: :destroy
end
