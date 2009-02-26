class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true
  
  STATE_ABBREVIATIONS = {
    'AL' => 'ALABAMA',
    'AK' => 'ALASKA',
    'AS' => 'AMERICAN SAMOA',
    'AZ' => 'ARIZONA',
    'AR' => 'ARKANSAS',
    'CA' => 'CALIFORNIA',
    'CO' => 'COLORADO',
    'CT' => 'CONNECTICUT',
    'DE' => 'DELAWARE',
    'DC' => 'DISTRICT OF COLUMBIA',
    'FM' => 'FEDERATED STATES OF MICRONESIA',
    'FL' => 'FLORIDA',
    'GA' => 'GEORGIA',
    'GU' => 'GUAM',
    'HI' => 'HAWAII',
    'ID' => 'IDAHO',
    'IL' => 'ILLINOIS',
    'IN' => 'INDIANA',
    'IA' => 'IOWA',
    'KS' => 'KANSAS',
    'KY' => 'KENTUCKY',
    'LA' => 'LOUISIANA',
    'ME' => 'MAINE',
    'MH' => 'MARSHALL ISLANDS',
    'MD' => 'MARYLAND',
    'MA' => 'MASSACHUSETTS',
    'MI' => 'MICHIGAN',
    'MN' => 'MINNESOTA',
    'MS' => 'MISSISSIPPI',
    'MO' => 'MISSOURI',
    'MT' => 'MONTANA',
    'NE' => 'NEBRASKA',
    'NV' => 'NEVADA',
    'NH' => 'NEW HAMPSHIRE',
    'NJ' => 'NEW JERSEY',
    'NM' => 'NEW MEXICO',
    'NY' => 'NEW YORK',
    'NC' => 'NORTH CAROLINA',
    'ND' => 'NORTH DAKOTA',
    'MP' => 'NORTHERN MARIANA ISLANDS',
    'OH' => 'OHIO',
    'OK' => 'OKLAHOMA',
    'OR' => 'OREGON',
    'PW' => 'PALAU',
    'PA' => 'PENNSYLVANIA',
    'PR' => 'PUERTO RICO',
    'RI' => 'RHODE ISLAND',
    'SC' => 'SOUTH CAROLINA',
    'SD' => 'SOUTH DAKOTA',
    'TN' => 'TENNESSEE',
    'TX' => 'TEXAS',
    'UT' => 'UTAH',
    'VT' => 'VERMONT',
    'VI' => 'VIRGIN ISLANDS',
    'VA' => 'VIRGINIA',
    'WA' => 'WASHINGTON',
    'WV' => 'WEST VIRGINIA',
    'WI' => 'WISCONSIN',
    'WY' => 'WYOMING'
  }
  
  validates_presence_of :line1
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip
  validates_presence_of :addressable
  
  validates_format_of :zip,
    :with => %r{\d{5}(-\d{4})?},
    :message => "should be 12345 or 12345-1234"
end
