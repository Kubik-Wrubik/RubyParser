# Підключення бібліотек для тестування
require_relative '../item'
require_relative '../logger_manager'

# Тест 1: Створення об'єкта Item з передачею параметрів
def test_item_initialization
  puts "\nТест 1: Створення об'єкта Item з передачею параметрів"
  
  item = RubyParser::Item.new(name: "Товар 1", price: 100) do |i|
    i.description = "Це опис товару 1"
    i.category = "Категорія 1"
  end

  puts "Очікуваний результат: Назва товару: Товар 1, ціна: 100, опис: Це опис товару 1"
  puts "Результат: #{item.to_s}"
  puts "Результат в хеш: #{item.to_h}"
  puts "Результат inspect: #{item.inspect}"
end

# Тест 2: Оновлення атрибутів через метод update
def test_item_update
  puts "\nТест 2: Оновлення атрибутів товару"

  item = RubyParser::Item.new(name: "Товар 2", price: 200)

  item.update do |i|
    i.name = "Оновлений товар 2"
    i.price = 250
  end

  puts "Очікуваний результат: Назва товару: Оновлений товар 2, ціна: 250"
  puts "Результат: #{item.to_s}"
end

# Тест 3: Створення об'єкта з фіктивними даними
def test_generate_fake
  puts "\nТест 3: Створення товару з фіктивними даними"

  item = RubyParser::Item.generate_fake
  puts "Результат: #{item.to_s}"
  puts "Результат inspect: #{item.inspect}"
end

# Тест 4: Порівняння об'єктів за ціною
def test_item_comparison
  puts "\nТест 4: Порівняння об'єктів Item"

  item1 = RubyParser::Item.new(name: "Товар 1", price: 150)
  item2 = RubyParser::Item.new(name: "Товар 2", price: 100)

  if item1 > item2
    puts "Товар 1 дорожчий за Товар 2"
  elsif item1 < item2
    puts "Товар 1 дешевший за Товар 2"
  else
    puts "Товари мають однакову ціну"
  end
end


# Тест 5: Створення об'єкта з значеннями за замовчуванням
def test_default_values
  puts "\nТест 5: Створення об'єкта з значеннями за замовчуванням"

  item = RubyParser::Item.new({})
  puts "Результат за замовчуванням: #{item.to_s}"
  puts "Результат в хеш за замовчуванням: #{item.to_h}"
end

# Тест 6: Виведення інформації через псевдонім info
def test_item_info
  puts "\nТест 6: Виведення інформації через псевдонім info"

  item = RubyParser::Item.new(name: "Товар 4", price: 500)
  puts "Результат через info: #{item.info}"
end

# Запуск всіх тестів
test_item_initialization
test_item_update
test_generate_fake
test_item_comparison
test_default_values
test_item_info
