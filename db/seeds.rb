# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@gmail.com',
  password: 'adminpas',
)

Address.create!(
  end_user_id: 1,
  name: '平野健太朗',
  address: '東京都世田谷区',
  postal_code: '333333'
)

Genre.create!(
  [
    {
      name: 'ケーキ',
    },
    {
      name: 'シュークリーム',
    },
    {
      name: 'ショートケーキ',
    },
    {
      name: 'プリン',
    },
    {
      name: 'モンブラン',
    },
    {
      name: 'ロールケーキ',
    },
    {
      name: 'フルーツケーキ',
    },
    {
      name: 'スフレ',
    },
    {
      name: 'シフォンケーキ',
    },

  ]
)

Item.create!(
  [
    {
      name: 'いちごショートケーキ',
      explanation: 'おいしいいちごショートケーキです',
      price: '300',
      genre_id: 3,
      is_active: true,
      image: open("./app/assets/images/itigo_short.jpg")
    },
    {
      name: 'シュークリーム',
      explanation: 'おいしいシュークリームです',
      price: '300',
      genre_id: 2,
      is_active: true,
      image: open("./app/assets/images/shu-kuri-mu.jpg")
    },
    {
      name: 'ロールケーキ',
      explanation: 'おいしいロールケーキです',
      price: '400',
      genre_id: 6,
      is_active: true,
      image: open("./app/assets/images/ro-ruke-ki.jpg")
    },
    {
      name: 'モンブラン',
      explanation: 'おいしいモンブランです',
      price: '450',
      genre_id: 5,
      is_active: true,
      image: open("./app/assets/images/monburan.jpg")
    }
  ]
)



