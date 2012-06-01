class Archive < ActiveRecord::Base
  belongs_to :project
  
  mount_uploader :file, FileUploader
  
  def base_name
    File.basename(self.file_url)
  end
  
  def extension
    File.extname(self.base_name).reverse.chop.reverse
  end
end
