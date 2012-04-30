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
            :last_name => "Kuri Vargas")

User.create(:email => "daniel@invomex.com", 
            :password => "invomex", 
            :password_confirmation => "invomex",
            :name => "Daniel",
            :last_name => "Gonzalez Mtz")

BusinessUnit.create(:name => "Diseño gráfico")
BusinessUnit.create(:name => "Software")
BusinessUnit.create(:name => "Diseño Industrial")
BusinessUnit.create(:name => "Planeación de negocios")
BusinessUnit.create(:name => "Investigación y desarrollo")