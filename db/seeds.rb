#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:email => "kuri@invomex.com", 
            :password => "invomex", 
            :password_confirmation => "invomex",
            :name => "Abraham",
            :last_name => "Kuri Vargas",
            :rol => "Admin")

User.create(:email => "danielgzz@invomex.com", 
            :password => "invomex", 
            :password_confirmation => "invomex",
            :name => "Daniel",
            :last_name => "Gonzalez Mtz",
            :rol => "Admin")

User.create(:email => "estrella.garza@invomex.com", 
            :password => "invomex", 
            :password_confirmation => "invomex",
            :name => "Estrella",
            :last_name => "Garza",
            :rol => "Employee")

BusinessUnit.create(:name => "Graphic Design")
BusinessUnit.create(:name => "Software")
BusinessUnit.create(:name => "Industrial Design")
BusinessUnit.create(:name => "Business Planning")
BusinessUnit.create(:name => "R&D")

DEPARTMENTS = ["Business Development","Legal","Finance","Marketing","Human Development",
               "Graphic Design", "Software", "Industrial Design", "Business Planning", 
               "Research and Development"]

DEPARTMENTS.each do |department|
  Department.create(:name => department)
end