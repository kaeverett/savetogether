class Organization < ActiveRecord::Base
  has_one :address, :as => :addressable
  has_many :groups
  has_many :pledges
  has_one :photo, :as => :photographed
  
  before_validation :format_values

  validates_presence_of :name

  validates_http_url :web_site_url, :allow_blank => true
  validates_format_of :name,
    :with => /^[A-Z a-z 0-9 \-\']*\z/,
    :message => "Name can have only letters, numbers, hyphen, and dash"
  validates_length_of :name, :in => 0..255
  validates_length_of :phone, :is => 10,
    :message => "Phone number must be 10-digits",
    :allow_blank => true
  
  def to_label
    "#{name}"
  end
  
  def to_s
    "#{name}"
  end
  
  private
  def format_values
    if (self != nil && self.phone != nil)
      self.phone = self.phone.gsub(/\D/, '')
    end
  end
end
