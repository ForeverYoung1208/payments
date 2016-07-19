class APayment < ActiveRecord::Base
  belongs_to :request
  default_scope { where( is_deleted: false ) }

end
