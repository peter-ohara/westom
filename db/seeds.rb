# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'

brokers = []

# 8.times { brokers.push FactoryBot.create :user }

me = User.create(first_name: 'Peter',
                 last_name: 'Adu',
                 email: 'ohara.invent@gmail.com',
                 password: 'password')
# brokers.push me
#
#
# start_of_year = Date.new(2019, 1, 1)
# middle_of_year = Date.new(2019, 6, 30)
# FactoryBot.create(:milestone,
#                   title: 'Revenue milestone for 1st half of 2019',
#                   start_date: start_of_year,
#                   due_date: middle_of_year,
#                   target_type: :revenue,
#                   target: 6_000_000,
#                   status: :active,
#                   users: brokers[5..8])
#
# FactoryBot.create(:milestone,
#                   title: 'Deals milestone for 1st half of 2019',
#                   start_date: start_of_year,
#                   due_date: middle_of_year,
#                   target_type: :deals,
#                   target: 20,
#                   status: :active,
#                   users: brokers[5..8])
#
#
# brokers[5..8].map do |broker|
#   deal = FactoryBot.create :deal,
#                            broker: broker,
#                            stage: :closed,
#                            date_of_closing: Faker::Date.between(start_of_year,
#                                                                 middle_of_year)
#
#   3.times do
#     FactoryBot.create :activity, deal: deal, broker: broker
#   end
#
#   rand(0..10).times do
#     FactoryBot.create :deal, broker: broker
#   end
# end

contact = Contact.create! first_name: 'ABOAGYE AGENT'
Property.create! owner: contact, description: '0.241 ACRE OF LAND', location: 'RINGWAY ESTATE OSU', purpose: 'commercial', property_type: 'building', listing_type: 'for_sale', price_currency: 'USD', price_cents: '650_000'

contact = Contact.create! first_name: 'AKUA LUCY'
Property.create! owner: contact, description: '0.20 ACRES WITH A STRUCTURE', location: 'SPINTEX', purpose: 'residential', property_type: 'land', price_currency: 'USD', price_cents: '150_000'
Property.create! owner: contact, description: '0.20 ACRES WITH A STRUCTURE', location: 'SPINTEX', purpose: 'residential', property_type: 'building', price_currency: 'USD', price_cents: '150_000'

contact = Contact.create! first_name: 'ALHAJI', mobile: '0244861527'
Property.create! owner: contact, description: '0.54 ACRES', location: 'CANTONMENTS', purpose: 'commercial', property_type: 'land', listing_type: 'for_sale', price_currency: 'USD', price_cents: '1300000', negotiable: true
Property.create! owner: contact, description: '0.54 ACRES', location: 'CANTONMENT', purpose: 'residential', property_type: 'land', price_currency: 'USD', price_cents: '1300000', negotiable: true

contact = Contact.create! first_name: 'ALHAJI TOAFEEK', mobile: '0244861527'
Property.create! owner: contact, description: '0.75 ACRE', location: 'ROMAN RIDGE', purpose: 'commercial', property_type: 'land', listing_type: 'for_sale', price_currency: 'USD', price_cents: '2000000', negotiable: true
Property.create! owner: contact, description: '1.5 ACRES OF LAND', location: 'RIDGE BEHIND FIDELITY TOWERS', purpose: 'commercial', property_type: 'land', listing_type: 'for_sale', price_currency: 'USD', price_cents: '3500000', negotiable: true
Property.create! owner: contact, description: '0.75 ACRE', location: 'ROMAN RIDGE', purpose: 'residential', property_type: 'land', price_currency: 'USD', price_cents: '2000000', negotiable: true

contact = Contact.create! first_name: 'ALLEN LANDLORD', mobile: '0271018668'
Property.create! owner: contact, description: '0.768 ACRES', location: 'NORTH RIDGE', purpose: 'commercial', property_type: 'land', listing_type: 'for_sale', price_currency: 'USD', price_cents: '2500000'
Property.create! owner: contact, description: '0.54 ACRES', location: 'AIRPORT residential', purpose: 'commercial', property_type: 'land', listing_type: 'for_sale', price_currency: 'USD', price_cents: '1500000'
Property.create! owner: contact, description: '0.768 ACRES', location: 'NORTH RIDGE', purpose: 'residential_or_commercial', property_type: 'land', price_currency: 'USD', price_cents: '2500000'
Property.create! owner: contact, description: '0.54 ACRES', location: 'AIRPORT residential', purpose: 'residential', property_type: 'land', price_currency: 'USD', price_cents: '1500000'

contact = Contact.create! first_name: 'AMOAH AGENT', mobile: '0548382558'
Property.create! owner: contact, description: '4 ACRES WHICH HAS A FILLING STATION,RESTAURANT AND A PHARMACY', location: 'OYIBI NEAR THE VALLEY VIEW UNIVERSITY', purpose: 'commercial', property_type: 'building', listing_type: 'for_sale', price_currency: 'USD', price_cents: '3000000'

contact = Contact.create! first_name: 'CHUKU/SIS EUNICE', mobile: '0233502040'
Property.create! owner: contact, description: '3 BEDROOM HOUSE WITH AN OUTHOUSE', location: 'EAST LEGON', purpose: 'residential', property_type: 'house', listing_type: 'for_sale', price_currency: 'USD', price_cents: '350_000'

contact = Contact.create! first_name: 'DEDE POTURPHY', mobile: '0556881966'
Property.create! owner: contact, description: 'STRUCTURE', location: 'ASYLUM DOWN', property_type: 'building', price_currency: 'USD'

contact = Contact.create! first_name: 'ERIC SARPONG', mobile: '0245881130'
Property.create! owner: contact, description: '8 BEDROOMS SELF COMPOUND', location: 'DOME', purpose: 'residential', property_type: 'house', listing_type: 'for_sale', price_currency: 'USD', price_cents: '180_000'
Property.create! owner: contact, description: 'WAREHOUSE WITH OFFICE SPACE', location: 'POKUASE/SAPEIMAN', purpose: 'commercial', property_type: 'warehouse', listing_type: 'for_sale', price_currency: 'USD', price_cents: '150_000'

contact = Contact.create! first_name: 'FAIRVIEW KWAKU DUA', mobile: '0244738730'
Property.create! owner: contact, description: '3,4 BEDROOM APARTMENTS', location: 'NORTH RIDGE', purpose: 'residential', property_type: 'apartment', listing_type: 'for_rent_or_lease', price_currency: 'USD', price_cents: '2_954'
Property.create! owner: contact, description: '3&4 BEDROOM APARTMENT', location: 'NORTH RIDGE', purpose: 'residential', property_type: 'apartment', listing_type: 'for_sale', price_currency: 'USD', price_cents: '600_000'
Property.create! owner: contact, description: '5 BEDROOM HOUSE WITH OUTERHOUSE', location: 'NTHC AJIRIGANOR', purpose: 'residential', property_type: 'house', listing_type: 'for_sale', price_currency: 'USD', price_cents: '550_000'
Property.create! owner: contact, description: '3&4 BEDROOM APARTMENT', location: 'NORTH RIDGE', purpose: 'residential', property_type: 'apartment', price_currency: 'USD', price_cents: '600_000'

contact = Contact.create! first_name: 'FRANCIS MENSAH'
Property.create! owner: contact, description: '6 BEDROOM HOUSE WITH A DINING AREA,STUDY,KITCHEN,WITH A ONE BEDROOM OUTHOUSE', location: 'AJIRIGANOR CLOSE TO THE ZOOMLION OFFICE', purpose: 'residential', property_type: 'house', listing_type: 'for_sale', price_currency: 'USD', price_cents: '550_000', status: 'VALUED'

contact = Contact.create! first_name: 'GEORGE NARH'
Property.create! owner: contact, description: '100 PLOTS OF LAND', location: 'MOTORWAY EXTENSION TEMA COMM.25', purpose: 'commercial', property_type: 'land', listing_type: 'for_sale', price_currency: 'USD', price_cents: '6_000_000', status: 'VALUED'
Property.create! owner: contact, description: '100 PLOTS OF LAND', location: 'MOTORWAY EXTENSION TEMA COMM.25', property_type: 'land', price_currency: 'USD', price_cents: '6_000_000'

contact = Contact.create! first_name: 'GODFRED', mobile: '0242185490'
Property.create! owner: contact, description: '266 ACRES OF LAND', location: 'PRAMPRAM ROAD', purpose: 'commercial', property_type: 'land', listing_type: 'for_sale', price_currency: 'GHS', price_cents: '230_000'
Property.create! owner: contact, description: '266 ACRES OF LAND', location: 'PRAMPRAM ROAD', purpose: 'residential', property_type: 'land', price_currency: 'GHS', price_cents: '230_000'

contact = Contact.create! first_name: 'GOLDKEY PROPERTIES', mobile: '0556587089'
Property.create! owner: contact, description: '3 BEDROOM APARTMENT WITH SERVANTS QUARTERS', location: 'CANTONMENT', purpose: 'residential', property_type: 'apartment', price_currency: 'USD', price_cents: '495_000'

contact = Contact.create! first_name: 'IGL MR.AHIAKU'
Property.create! owner: contact, description: '1.66 ACRES OF LAND', location: 'CANTONMENTS', purpose: 'commercial', property_type: 'land', listing_type: 'for_sale', price_currency: 'USD', price_cents: '5300000'

contact = Contact.create! first_name: 'IMPERIAL HOMES'
Property.create! owner: contact, description: '3 BEDROOM APARTMENT', location: 'AIRPORT', purpose: 'residential', property_type: 'apartment', price_currency: 'USD', price_cents: '350_000'

contact = Contact.create! first_name: 'INTELLECT GROUP/ERIC', mobile: '0556009668'
Property.create! owner: contact, description: '4-5 BEDROOMS HOUSE SELF COMPOUND', location: 'EAST LEGON HILLS', purpose: 'residential', property_type: 'house', listing_type: 'for_sale', price_currency: 'USD', price_cents: '180_000'

contact = Contact.create! first_name: 'KAY OSU-MANTSE', mobile: '0244168287'
Property.create! owner: contact, description: '1.114 ACRES OF LAND', location: 'AIRPORT residential', purpose: 'commercial', property_type: 'land', listing_type: 'for_sale', price_currency: 'USD'
Property.create! owner: contact, description: '1.114 ACRES OF LAND', location: 'AIRPORT residential', purpose: 'residential', property_type: 'land', price_currency: 'USD', price_cents: '2500000', negotiable: true

contact = Contact.create! first_name: 'KEEGAN WANG/WAYLEAD', mobile: '0241821546'
Property.create! owner: contact, description: 'TOWNHOUSES 4 BEDROOMS', location: 'SAKUMONO SPINTEX', purpose: 'residential', property_type: 'town_house', listing_type: 'for_sale', price_currency: 'USD', price_cents: '495_000'
Property.create! owner: contact, description: 'TOWNHOUSES 4 BEDROOMS', location: 'SAKUMONO SPINTEX', purpose: 'residential', property_type: 'town_house', price_currency: 'USD', price_cents: '495_000'

contact = Contact.create! first_name: 'LAWYER ASOMANI', mobile: '0245430456'
Property.create! owner: contact, description: 'SEMI DETACHED 18 BEDROOM HOUSE UN-SUITE', location: 'SAKUMONO-LASHIBI', purpose: 'residential', property_type: 'house', listing_type: 'for_sale', price_currency: 'USD', price_cents: '900_000'
Property.create! owner: contact, description: '3 BEDROOM SELF COMPOUND ON 0.11 ACRES', location: 'MANET GARDENS EAST AIRPORT', purpose: 'residential', property_type: 'house', listing_type: 'for_sale', price_currency: 'USD', price_cents: '150_000'
Property.create! owner: contact, description: '5 BEDROOM HOUSE UNCOMPLETED ON 0.39 ACRES', location: 'EAST LEGON-OGBOJO', purpose: 'residential', property_type: 'house', listing_type: 'for_sale', price_currency: 'USD', price_cents: '400_000'

contact = Contact.create! first_name: 'LAWYER MENSON', mobile: '0244230049'
Property.create! owner: contact, description: '3 BEDROOM APARTMENTS', location: 'KOKOMLEMLE', purpose: 'residential', property_type: 'apartment', listing_type: 'for_rent_or_lease', price_currency: 'USD', price_cents: '1000'

contact = Contact.create! first_name: 'MAAPA', mobile: '0245395177'
Property.create! owner: contact, description: '0.21 ACRES WITH A STRUCTURE FAMILY PROPERTY', location: 'ADABRAKA', purpose: 'residential', property_type: 'building', price_currency: 'USD', price_cents: '550_000'

contact = Contact.create! first_name: 'MANFRED AKRONG', mobile: '0553089000'
Property.create! owner: contact, description: '505 ACRES LAND', location: 'EAST LEGON HILLS-MOTORWAY ACCRA COMM.23/24', purpose: 'residential', property_type: 'land', price_currency: 'USD', price_cents: '25_000'

contact = Contact.create! first_name: 'MARGARETE', mobile: '0547163764'
Property.create! owner: contact, description: '0.23 ACRE LAND(CORNER PLOT)', location: 'DZORWULU ,BEHIND MAHAMA’S RESIDENCE', purpose: 'commercial', property_type: 'building', listing_type: 'for_sale', price_currency: 'USD', price_cents: '600_000', status: 'VALUED'
Property.create! owner: contact, description: '0.23 ACRE LAND(CORNER PLOT)', location: 'DZORWULU ,BEHIND MAHAMA’S RESIDENCE', purpose: 'residential', property_type: 'land', price_currency: 'USD', price_cents: '600_000', status: 'VALUED'
Property.create! owner: contact, description: '0.23 ACRE LAND(CORNER PLOT)', location: 'DZORWULU ,BEHIND MAHAMA’S RESIDENCE', purpose: 'residential', property_type: 'building', price_currency: 'USD', price_cents: '600_000'

contact = Contact.create! first_name: 'MR. PEPERA'
Property.create! owner: contact, description: 'PHC WAREHOUSE PLOT NO.38 ON 1.874 ACRES', location: 'SOUTH INDUSTRIAL AREA OFF THE GRAPHIC ROAD NEAR TOYOTA BODY', purpose: 'commercial', property_type: 'warehouse', listing_type: 'for_sale', price_currency: 'GHS', price_cents: '9200000', negotiable: true, status: 'VALUED'
Property.create! owner: contact, description: 'PHC WAREHOUSE PLOT NO.27 ON 2.22 ACRES', location: 'SOUTH INDUSTRIAL AREA OFF THE GRAPHIC ROAD NEAR TOYOTA BODY', purpose: 'commercial', property_type: 'warehouse', listing_type: 'for_sale', price_currency: 'GHS', price_cents: '10_000_000', status: 'VALUED'

contact = Contact.create! first_name: 'MR.ANNOR/MR.KORANTENG', mobile: '00015083318700/0277310898'
Property.create! owner: contact, description: '13 BEDROOM HOUSE ON 0.44 ACRE (7 BEDROOM MAIN +6 BED BQ)+BOREHOLE WATER CAN BE DONE IN A WEEK', location: 'ADAMOROBE', purpose: 'residential', property_type: 'house', listing_type: 'for_sale', price_currency: 'GHS', price_cents: '1_200_000', status: 'VALUED'

contact = Contact.create! first_name: 'MR.JAMES', mobile: '0245657599'
Property.create! owner: contact, description: '1.04 ACRES OF LAND', location: 'AKOSOMBO WATER FRONT', purpose: 'commercial', property_type: 'land', listing_type: 'for_sale', price_currency: 'USD', price_cents: '500_000'
Property.create! owner: contact, description: '1.04 ACRES OF LAND', location: 'AKOSOMBO WATER FRONT', purpose: 'residential', property_type: 'land', price_currency: 'USD', price_cents: '500_000'

contact = Contact.create! first_name: 'MR.NTIAMOAH GILLIGOLD'
Property.create! owner: contact, description: '5 BEDROOM HOUSE WITH OUTERHOUSE', location: 'NTHC AJIRIGANOR', purpose: 'residential', property_type: 'house', listing_type: 'for_sale', price_currency: 'USD', price_cents: '550_000'

contact = Contact.create! first_name: 'MRS.DANIELS', mobile: '0244728451'
Property.create! owner: contact, description: '3 STOREY HOTEL WITH RESTAURANT,DISCOTEQUE SITTING ON 0.81 ACRES OF LAND', location: 'CAPECOAST', purpose: 'commercial', property_type: 'building', listing_type: 'for_sale', price_currency: 'USD', price_cents: '1000000', status: 'VALUED'

contact = Contact.create! first_name: 'MRS.OPUNI', mobile: '0541824992'
Property.create! owner: contact, description: 'FREEHOLD PROPERTY', location: 'NUNGUA', purpose: 'residential', property_type: 'house', listing_type: 'for_sale'

contact = Contact.create! first_name: 'NANA ADJEI'
Property.create! owner: contact, description: 'BUILDING FOR OFFICE PREFERABLY A BANK', location: 'SPINTEX BEFORE UT BANK', purpose: 'commercial', property_type: 'building', listing_type: 'for_sale', price_currency: 'USD', price_cents: '2500000', negotiable: true

contact = Contact.create! first_name: 'SILVERCROSS ESTATE'
Property.create! owner: contact, description: '3 BEDRROOMS', location: 'NUNGUA', purpose: 'residential', property_type: 'apartment', price_currency: 'USD'

contact = Contact.create! first_name: 'VINCENT/BLOW MONEY', mobile: '0246942290'
Property.create! owner: contact, description: '5 BEDROOM SELF COMPOUND HOUSE', location: 'WEST TRASACCO', purpose: 'residential', property_type: 'house', listing_type: 'for_sale', price_currency: 'USD', price_cents: '150_000'
Property.create! owner: contact, description: '1.47 ACRES OF LAND', location: 'TRASACCO WEST', purpose: 'residential', property_type: 'land', price_currency: 'USD', price_cents: '40_000'

contact = Contact.create! first_name: 'VISTA DEL MARE/KEEGAN WANG', mobile: '0241821546'
Property.create! owner: contact, description: 'TOWNHOUSES 4 BEDROOMS', location: 'EAST AIRPORT', purpose: 'residential', property_type: 'town_house', listing_type: 'for_sale', price_currency: 'USD', price_cents: '500_000'
Property.create! owner: contact, description: 'TOWNHOUSES 4 BEDROOMS', location: 'EAST AIRPORT', purpose: 'residential', property_type: 'town_house', price_currency: 'USD', price_cents: '500_000'

contact = Contact.create! first_name: 'WHITEWALL/ISHMAEL', mobile: '0507010866'
Property.create! owner: contact, description: '2,3,4 BEDROOM APARTMENTS', location: 'EAST LEGON HILLS', purpose: 'residential', property_type: 'apartment', price_currency: 'USD'

contact = Contact.create! first_name: 'FAIRLOPP EMMA', mobile: '0246473600'
Property.create! owner: contact, description: 'FAIRLOPP PROPERTY(WAREHOUSE WITH OFFICE COMPLEX)\nWORKSHOP 1800SQM\nOFFICE 500SQM\nUNCOMPLETED WORKSHOP 1080SQM\nBOREHOLE ON 2.6 ACRES\n*INTERNET AND *TELEmobile CA0BLE\n*ARMOURED WIRING IN CASE OF FIRE OUTBREAK', location: 'TEMA DAWENYA', purpose: 'commercial', property_type: 'warehouse', listing_type: 'for_sale', price_currency: 'USD', price_cents: '6000000', negotiable: true