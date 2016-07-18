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
		request: requests[0],
		payer: 'ООО ИСЄЄР',
		payer_account: '2600012345',
		payer_mfo: '305299',
		recipient: 'ООО Рога и копіта',
		detail: 'За рога и за копіта согл. сч 3434 от 11.11.11 в тч НДС 45.00',
		recipient_account: '2600434012345',
		recipient_bank: 'Банк михайловский',
		recipient_mfo: '456454',
		recipient_egrpou: '65498721',
		sum: 10,
	},
	{
		request: requests[0],
		payer: 'ООО ИСЄЄР2',
		payer_account: '260001233451',
		payer_mfo: '305299',
		recipient: 'ООО Рога и копіта',
		detail: 'За рога и за копіта согл. hfgh fgh df  сч 3434 от 11.11.11 в тч НДС 45.00',
		recipient_account: '2600434012345',
		recipient_bank: 'Банк михайловский',
		recipient_mfo: '456454',
		recipient_egrpou: '65498721',
		sum: 60,
	},
	{
		request: requests[1],
		payer: 'ООО ИСЄЄР3',
		payer_account: '260001234532',
		payer_mfo: '305299',
		recipient: 'ООО Рога и копіта',
		detail: 'За рога и за копіта согл. yrtytr rt yy r rty  ytyty сч 3434 от 11.11.11 в тч НДС 45.00',
		recipient_account: '2600434012345',
		recipient_bank: 'Банк михайловский',
		recipient_mfo: '456454',
		recipient_egrpou: '65498721',
		sum: 80,
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
