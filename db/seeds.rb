# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
# categories = Category.create([
# {name:"Túi xách mới", active:1},
# {name:"Áo xịn", active:1}]);
@order_statuses = OrderStatus.create([
  { name: "Chưa thanh toán", status: 1},
  { name: "Đã thanh toán", status: 1},
  { name: "Đã nhận", status: 1},
  { name: "Đã hủy", status: 1},

]);

@payments = Payment.create([
  { name: "Thanh toán khi nhận hang", status: 1},
  { name: "Momo", status: 1}

])