# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

projects = Project.create([
	{name: 'ISR'},
	{name: 'CPR'},
	{name: 'Архів ЦІК'},
	{name: 'Невідомий проект'}
])

requests = Request.create([
	{
		date: '09.12.2015',
		project: projects[0],
		is_approved: true
	},{
		date: '10.12.2015',
		project: projects[0],
		is_approved: true
	},{
		date: '11.12.2015',
		project: projects[1],
		is_approved: true
	},{
		date: '12.12.2015',
		project: projects[2],
		is_approved: false
	},{
		date: '12.12.2015',
		project: projects[3],
		is_approved: false
	},{
		date: '12.12.2015',
		project: projects[3],
		is_approved: false
	}
])
