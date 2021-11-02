# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Post.count.zero?
  23.times do |i|
    post =
      Post.create(
        title: Faker::Lorem.sentence,
        summary: Faker::Lorem.paragraph,
        body:
          'Lorem ipsum dolor sit amet. Est accusamus praesentium quo error asperiores ut ipsum deserunt in perspiciatis voluptas. Et voluptas maiores et deserunt odit id accusantium porro est molestiae inventore qui iste itaque quo odio quasi qui similique quia. A incidunt atque quo nostrum maiores At numquam aut quam voluptatem hic consequatur voluptatem aut provident fuga non maiores reprehenderit. Sed magni nesciunt ut consequatur quasi rem voluptatem nostrum aut voluptatem quibusdam est officiis! Et tempora delectus qui doloribus voluptatem aut pariatur eius et animi repellat qui nobis quasi et commodi iste. Aut quos fugiat est atque temporibus in esse quas sit aspernatur minima est veritatis voluptate id impedit laudantium! Et provident suscipit eos possimus ratione voluptas suscipit. Et perspiciatis iste eum voluptatem cupiditate aut voluptatem unde aut suscipit voluptatem sed impedit nihil. Qui velit atque vel omnis nostrum aut molestiae omnis. Et temporibus architecto sed praesentium maiores et ipsa harum At vero placeat a voluptatem iste ab fugit velit a eaque sunt. Ut quas quis qui vitae iusto non galisum odio. Vel tempore voluptas ab laboriosam dolor sed sapiente enim ut dolore odit. Est rerum eaque est architecto nobis non dicta recusandae sed dignissimos quod hic nobis voluptatem cum inventore iste. 33 quaerat officia sit expedita praesentium sed sunt eligendi et autem facere a nobis assumenda. At natus nihil eos quibusdam nostrum ut veritatis doloremque ea autem placeat ut vitae dolorum et dolores error. Et voluptas officia quo voluptatem repellat quo rerum omnis eos reprehenderit aliquam. Et blanditiis voluptatem et nulla ipsum ut exercitationem repudiandae. Ut enim minima est enim ratione et autem repudiandae? Qui sunt amet nam autem voluptatem id quia blanditiis et ullam odit. Sed veniam optio qui maiores quae ut ipsum tenetur in veritatis blanditiis. Qui necessitatibus natus et quod quidem eos distinctio earum aut blanditiis facere sit ullam iure aut optio eaque. Eum voluptatum officiis et alias beatae ut necessitatibus dignissimos et accusantium provident eum mollitia repellat. Vel illum voluptas id soluta dolores est officia exercitationem hic nisi officiis eum architecto fugiat aut sunt quae. '
      )

    post.update_attribute(:created_at, i.days.ago)

    image_url = Faker::LoremFlickr.image
    downloaded_file = URI.open(image_url)
    post.image.attach(io: downloaded_file, filename: "image#{i}.png")
  end
end
