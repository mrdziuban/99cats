# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.create([ { name: 'Sennacy', sex: 'f', color: 'green',
               birth_date: '2013-05-01' },
             { name: 'Breakfast', sex: 'm', color: 'orange',
               birth_date: '2011-08-24' } ])

CatRentalRequest.create([ { cat_id: 1, begin_date: '2013-08-01',
                            end_date: '2013-09-01'},
                          { cat_id: 2, begin_date: '2013-09-01',
                            end_date: '2013-10-01'} ])