class Enquiry < ActiveRecord::Base
  #validations
  validates :name, :presence => true  
  #validates :company, :presence => true
  validates :email, :presence => true,
                    :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }#,
                    #:message => "is invalid"
  #validates :phone, :presence => false,
  #                  :numericality => true
  validates :text, :presence => true,
                   :length => { :minimum => 10 }#,
                   #:message => "is too short"

  #scopes
  scope :all_unread, where("read=?", false)#find_all_by_read(false)
  scope :all_read,   find_all_by_read(true)
  
  #callbacks
  before_create :on_before_save
  def on_before_save
    self.read = false
    #true to continue saving
    return true
  end
end
