# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Post.destroy_all

posts = Post.create ([
  {title: "Floral Romper", brand_name: "Nasty Gal", retailer: "http://www.nastygal.com/", price: "$54", size: "Medium", photo_url: "http://galmeetsglam.com/wp-content/uploads/2014/04/csj40.jpg", description: "I’ve had this floral romper on my wish list for a while and finally decided that for under $60, it was just too good to pass up. I was going to save it for an upcoming Cabo trip, but the beautiful 80 degree weather in Sonoma this past weekend was just perfect for it. From the sweet ruffled edges to floral print to the soft peach shade, it’s everything I look for in a spring outfit."},
  {title: "Boyfriend Jean", brand_name: "Joe's Jeans", retailer: "http://www.joesjeans.com/", price: "$175", size: "28", photo_url: "http://www.wendyslookbook.com/wp-content/uploads/2011/07/Boyfriend-Jeans-2-433x650.jpg", description: "I’ve slowly been building my wardrobe with classics, but one thing I have yet to invest in is a good boyfriend jean. Love them paired with heels and chic neutrals. How do you wear boyfriend jeans?"}
  ])
