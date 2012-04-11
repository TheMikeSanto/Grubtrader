# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

roles = Role.create([{name: 'Administrator'}, {name: 'User'}])

organization_roles = OrganizationRole.create([{name: "Producer"}, {name: "Distributor"}])

organizations = Organization.create([{
																			name: "Food Bank", 
																			state: "NE", 
																			city: "Omaha", 
																			street: "123 FoodBank Drive", 
																			zip: "68121", 
																			email: "person@foodbank.com",
																			phone: 7654321,
																			role_id: 2
																		},
																		{
																			name: "Blackburn",
																			state: "NE",
																			city: "Omaha",
																			street: "456 Blackburn Ave",
																			zip: "68154",
																			email: "person@blackburn.com",
																			phone: 1234567,
																			role_id: 1
																		},
																		{
																			name: "Alternative Systems",
																			state: "NE",
																			city: "Omaha",
																			street: "789 AltySys Road",
																			zip: "68131",
																			email: "mike.j.santo@gmail.com",
																			phone: 5154191,
																			role_id: 2
																	}])

me = User.create(fname: "Mike", lname: "Santo", password: 'asdf1234', 
								password_confirmation: 'asdf1234', email: 'mike.j.santo@gmail.com',
								phone: 4025154191, role_id: 1, organization_id: 3)