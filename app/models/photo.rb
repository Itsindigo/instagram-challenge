class Photo < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png",
                    :storage => :s3, :bucket => "rails-impostergram", :s3_credentials => {:access_key_id => ENV["AWS_KEY"], :secret_access_key => ENV["AWS_SECRET"]}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
