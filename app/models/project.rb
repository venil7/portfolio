class Project < ActiveRecord::Base
  default_scope order("updated_at desc")
  has_attached_file :image,
                    :styles => { :original => "300x200>>", :thumb => "95x95>", :admin => "40x40>" },
                    :url  => "/assets/images/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/images/:id/:style/:basename.:extension"

  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 2.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']

  validates :name, :presence => true, :length => {:within => 3..30}
  validates :short, :presence => true, :length => {:within => 3..100}
  validates :long, :presence => true, :length => {:within => 3..1000}
  validates :url, :presence => true, :format => { :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix }
  validates :company, :presence => true, :length => {:within => 3..30}
end
