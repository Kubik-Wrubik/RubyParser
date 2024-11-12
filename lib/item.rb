require_relative 'logger_manager'  # Підключаємо LoggerManager
require 'faker'

module RubyParser
  class Item
    include Comparable

    # Атрибути класу
    attr_accessor :name, :price, :description, :category, :image_path

    # Конструктор для ініціалізації об'єкта з можливістю передачі блоку
    def initialize(attributes = {})
      # Значення за замовчуванням
      @name = attributes.fetch(:name, 'Невідомий товар')
      @price = attributes.fetch(:price, 0.0)
      @description = attributes.fetch(:description, 'Опис не вказано')
      @category = attributes.fetch(:category, 'Невідома категорія')
      @image_path = attributes.fetch(:image_path, 'path/to/image.jpg')

      # Логуємо ініціалізацію
      RubyParser::LoggerManager.log_processed_file("Ініціалізація товару: #{@name}")

      # Якщо передано блок, налаштовуємо об'єкт
      yield(self) if block_given?
    end

    # Метод для формування рядка для виведення
    def to_s
      "Назва: #{@name}, Ціна: #{@price}, Опис: #{@description}, Категорія: #{@category}, Шлях до зображення: #{@image_path}"
    end

    # Метод для отримання об'єкта у вигляді хешу
    def to_h
      {
        name: @name,
        price: @price,
        description: @description,
        category: @category,
        image_path: @image_path
      }
    end

    # Метод для виведення зручного формату об'єкта
    def inspect
      "#<Item #{@name}, #{@price}, #{@category}>"
    end

    # Метод для оновлення об'єкта через блок
    def update
      yield(self) if block_given?
    end

    # Метод, псевдонім для to_s
    alias_method :info, :to_s

    # Статичний метод для генерації фіктивних даних
    def self.generate_fake
      name = Faker::Commerce.product_name
      price = Faker::Commerce.price
      description = Faker::Lorem.sentence
      category = Faker::Commerce.department
      image_path = Faker::LoremFlickr.image

      Item.new(
        name: name,
        price: price,
        description: description,
        category: category,
        image_path: image_path
      )
    end

    # Метод порівняння для Comparable
    def <=>(other)
      # Порівнюємо ціни товарів
      return nil unless other.is_a?(Item)
      @price <=> other.price
    end
  end
end
