# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     AuthStarter.Repo.insert!(%AuthStarter.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias AuthStarter.Accounts
alias AuthStarter.Posts

Accounts.create_user(%{username: "admin_user", first_name: "John", last_name: "Doe", email: "some@gmail.coms", role: "admin"})
Accounts.create_user(%{username: "test_user", first_name: "Random", last_name: "Dude", email: "test@gmail.coms"})

for _ <- 1..10 do
Posts.create_post(%{
    title: Faker.Lorem.sentence,
    body: Faker.Lorem.paragraph,
    user_id: [1,2] |> Enum.take_random(1) |> hd}
  )
end
