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
            :last_name => "Kuri Vargas")

BusinessUnit.create(:name => "Invomex")
BusinessUnit.create(:name => "Invosoft")
BusinessUnit.create(:name => "Invograph")
BusinessUnit.create(:name => "Invotech")
BusinessUnit.create(:name => "Invotrucks")