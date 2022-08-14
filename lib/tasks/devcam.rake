namespace :devcam do
  desc "TODO"

  def generate_random_bricks(property, max_brick_ammount)
    (1..rand(5...max_brick_ammount)).each do
      b = property.bricks.new
      if rand(1..2) == 1
        b.on_sale = true
        b.price = rand(1..1000)
      end
      b.save
    end
  end

  # not very dry my dude, not very dry, uncle bob would cry :(
  task build_demo: :environment do
    r = Realty.create({address: 'Test rd. 123', img: 'https://images-na.ssl-images-amazon.com/images/I/61BHbnmoGDL.jpg'})
    r_2 = Realty.create({address: 'Tranquility lane 3', img: 'https://www.publicdomainpictures.net/pictures/260000/nahled/florida-home.jpg'})
    r_3 = Realty.create({address: 'Rainbow av. 456', img: 'https://i.pinimg.com/originals/db/b2/ce/dbb2ce8f090defc5cc5be9b5ffbe93fa.png'})

    generate_random_bricks(r, 10)
    generate_random_bricks(r_2, 200)
    generate_random_bricks(r_3, 500)

    bob = User.create(name: 'bob')
    bob.build_shopping_cart.save
    ana = User.create(name: 'ana')
    ana.build_shopping_cart.save

  end

end
