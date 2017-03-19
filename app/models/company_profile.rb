class CompanyProfile < ApplicationRecord
  validates :name, presence: true
  mount_uploader :logo, LogoUploader

  private
  def only_one_row
    raise "You can create only one row of this table" if Anything.count > 0
  end



  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end
  def there_can_only_be_one
    errors.add_to_base('There can only be one') if Whatever.count > 0
  end
  belongs_to :fiscal_year
end
