user = User.find_or_create_by(email: "admin@gmail.com") do |u|
  u.role = 0
  u.password = "password123"
  u.password_confirmation = "password123"
end

books = [
  { title: "Solo Leveling", description: "Wage War", user_id: user.id },
  { title: "Solo Leveling: Origin", description: "Wage War", user_id: user.id }
]

books.each { |book| Book.find_or_create_by(book) }