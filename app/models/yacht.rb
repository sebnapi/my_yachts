class Yacht < ActiveRecord::Base
  self.per_page = 4

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

  mount_uploader :picture, PictureUploader
end
