class Product < ActiveRecord::Base
 has_attached_file :image, styles: { large:"600x300",  medium: "400x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
validates_attachment :image, presence: true, size: { in: 0..200.kilobytes }
      validates :title, presence: true,

                            length: { minimum: 5 }

        validates :content, presence: true,

                            length: { minimum: 10 }
end
