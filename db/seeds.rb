# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Message.destroy_all

10.times do
m = Message.new
m.status = <<eos
030101 Open 2016/Sep/26(Mon) 06:13:42
030102 Open 2016/Sep/26(Mon) 06:13:33
030103 Closed 2016/Sep/26(Mon) 06:13:50
eos
m.save
end
