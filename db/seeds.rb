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

a_payment = APayment.create([
	{
		sum: 10,
		request: requests[0]
	},
	{
		sum: 60,
		request: requests[0]
	},
	{
		sum: 80,
		request: requests[1]
	}
])

b_account = BAccount.create([
	{
    number: "1.1.",
    name: "Рассчетно - кассовое обслуживание"
	},
	{
    number: "2.4.",
    name: "Инфорамционно - консультационные услуги"
	}
])

b_payment = BPayment.create([
	{
    b_account: b_account[0],
    sum_allowed: 500,
    sum_rest: 100,
		sum: 20,
    recipient: "ООО ДЦ приднепровье",
    detail: "За консультационныеобслуживание счета в ЦБ согл.. сч. №34 от 14.12.14 без НДС",
    note: "какие - то услуги",
		request: requests[0]
	},
	{
    b_account: b_account[1],
    sum_allowed: 500,
    sum_rest: 200,
		sum: 50,
    recipient: "ЧП Сидоров",
    detail: "За информационные услуги согл. сч. 4545 от 11.11.2011 без НДС",
    note: "какие - то услуги",
		request: requests[0]
	},

	{
    b_account: b_account[1],
    sum_allowed: 500,	
    sum_rest: 150,
		sum: 80,
    recipient: "ЧП Иванов ",
    detail: "За консультационные услуги согл. сч. 4545 от 11.11.2011 без НДС",
    note: "какие - то услуги",
		request: requests[1]
	}
])
