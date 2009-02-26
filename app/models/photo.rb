class Photo < ActiveRecord::Base
  belongs_to :photographed, :polymorphic => true
 
  has_attachment :content_type => :image, 
                 :storage => :file_system, 
                 :max_size => 500.kilobytes,
                 :resize_to => '320x200>',
                 :thumbnails => { :thumb => '150x150>' }

  validates_as_attachment
end