class Archive < ActiveRecord::Base
  has_attachment   :thumbnails => { :thumb => '100x100>' }
  validates_as_attachment
end
