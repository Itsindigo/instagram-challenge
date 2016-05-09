class Photo < ActiveRecord::Base

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>", :square => "200x200>" }, :default_url => "/images/:style/missing.png",
                    :url =>':s3_domain_url', :path => '/:class/:attachment/:id_partition/:style/:filename',
                    :storage => :s3, :bucket => "rails-impostergram", :s3_credentials => {:access_key_id => ENV["AWS_KEY"], :secret_access_key => ENV["AWS_SECRET"]}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
