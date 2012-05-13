class Visitor < ActiveRecord::Base
  attr_accessible :address, :age, :contact, :contactperson, :date, :gender, :intime, :name, :outtime, :image
  validates :address, :presence => true
  validates :age, :presence => true, :length => { :within => 2..3 }, :numericality => { :greater_than => 15, :less_than_or_equal_to => 100 }
  validates :contact, :presence => true, :length => { :within => 10..13 }, :numericality => true
  validates :contactperson, :presence => true
  validates :gender, :presence => true, :inclusion => %w(male female Male Female), :message =>"Please enter correct gender male/female"
  validates :name, :presence => true 
  validates :image, :presence => true
  has_attached_file :image
 
end
