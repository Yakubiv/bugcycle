namespace :database do
  task import_data: :environment do
    User.create(name: 'Admin', email: 'pierre@michaux.com', password: 'progenitor')
    User.create(name: 'Test', email: 'test@example.com', password: 'password')
    bike_params.each do |params|
      Bicycle.create(params)
    end
  end

  private

  def bike_params
    [{ name: 'Canondale',
      image: "https://cdn.shopify.com/s/files/1/0232/3305/products/state_bicycle_co_matte_red_wyldcat_fixie_1_large.jpg?v=1484345284",
      description: Faker::Lorem.sentence(10, true, 15),
      category: Category.first,
      user: User.first },
    { name: 'Epic',
      image: "http://alexbicycles.com/images/library/zoom/cervelo-r2-105-211656-15.jpg",
      description: Faker::Lorem.sentence(10, true, 15),
      category: Category.second,
      user: User.first },
    { name: 'Giant',
      image: "http://centurycycles.com/merchant/91/images/site/giant_defy_composite_3_compact_12_z.jpg",
      description: Faker::Lorem.sentence(10, true, 15),
      category: Category.third,
      user: User.second },
    { name: 'Trek',
      image: "https://cdn.shopify.com/s/files/1/0232/3305/products/state_bicycle_fixie_fixed_gear_ashton_4_large.jpg?v=1473721341",
      description: Faker::Lorem.sentence(10, true, 15),
      category: Category.fourth,
      user: User.second },
    { name: 'Ardis',
      image: "https://cdn.shopify.com/s/files/1/0371/2945/products/2015_creme_caferacer_man_solo_all_black_flat.jpg?v=1441095966",
      description: Faker::Lorem.sentence(10, true, 15),
      category: Category.fifth,
      user: User.second }]
  end
end
