#!/usr/bin/env ruby
# frozen_string_literal: true

require 'date'
require 'json'
require 'securerandom'

# ANSI color codes for beautiful terminal output
class Colors
  RESET = "\033[0m"
  BOLD = "\033[1m"
  RED = "\033[31m"
  GREEN = "\033[32m"
  YELLOW = "\033[33m"
  BLUE = "\033[34m"
  MAGENTA = "\033[35m"
  CYAN = "\033[36m"
  WHITE = "\033[37m"

  def self.colorize(text, color)
    "#{color}#{text}#{RESET}"
  end
end

# ASCII Art Banner
def print_banner
  banner = <<~BANNER
    #{Colors::CYAN}#{Colors::BOLD}
    ╔══════════════════════════════════════════════════════════════╗
    ║                  🚀 RUBY DEMONSTRATION 🚀                   ║
    ║                                                              ║
    ║         Showcasing the elegance and power of Ruby           ║
    ╚══════════════════════════════════════════════════════════════╝
    #{Colors::RESET}
  BANNER
  puts banner
end

# Fibonacci sequence generator using Ruby's elegance
class FibonacciGenerator
  include Enumerable

  def initialize(limit = 10)
    @limit = limit
  end

  def each
    return enum_for(:each) unless block_given?

    a, b = 0, 1
    @limit.times do
      yield a
      a, b = b, a + b
    end
  end
end

# A class demonstrating Ruby's object-oriented features
class MagicalCreature
  attr_reader :name, :type, :power_level, :abilities

  def initialize(name, type, abilities = [])
    @name = name
    @type = type
    @power_level = rand(1..100)
    @abilities = abilities
    @created_at = Time.now
  end

  def introduce
    <<~INTRO
      #{Colors.colorize("🌟 #{@name}", Colors::MAGENTA)} the #{Colors.colorize(@type, Colors::YELLOW)}
      Power Level: #{Colors.colorize(@power_level.to_s, Colors::GREEN)}
      Abilities: #{@abilities.map { |ability| Colors.colorize(ability, Colors::CYAN) }.join(', ')}
      Born: #{@created_at.strftime('%Y-%m-%d at %H:%M:%S')}
    INTRO
  end

  def cast_spell(target = 'the darkness')
    spells = [
      '✨ casts Sparkling Shield',
      '🔥 unleashes Flame of Wisdom',
      '❄️ conjures Frost of Clarity',
      '⚡ summons Lightning of Inspiration',
      '🌿 grows Vines of Harmony',
    ]

    spell = spells.sample
    puts "#{Colors.colorize(@name, Colors::MAGENTA)} #{spell} against #{target}!"
  end
end

# Demonstration of Ruby blocks, procs, and lambdas
class FunctionalDemo
  def self.demonstrate_blocks
    puts Colors.colorize("\n📦 Block, Proc, and Lambda Demonstration:", Colors::BOLD)

    # Block example
    numbers = [1, 2, 3, 4, 5]
    squares = numbers.map { |n| n**2 }
    puts "Squares: #{squares.join(', ')}"

    # Proc example
    multiplier = proc { |x, factor| x * factor }
    puts "Using Proc - 5 * 3 = #{multiplier.call(5, 3)}"

    # Lambda example
    factorial =
      lambda do |n|
        return 1 if n <= 1
        n * factorial.call(n - 1)
      end

    puts "Factorial of 5: #{factorial.call(5)}"
  end
end

# Weather simulation using Ruby's expressive syntax
class WeatherSimulator
  WEATHER_TYPES = %w[sunny rainy cloudy stormy snowy foggy windy].freeze
  TEMPERATURES = (-10..35).freeze

  def self.generate_forecast(days = 7)
    puts Colors.colorize("\n🌤️  Weather Forecast:", Colors::BOLD)

    days.times do |day|
      weather = WEATHER_TYPES.sample
      temperature = TEMPERATURES.to_a.sample
      date = Date.today + day

      weather_emoji = {
        'sunny' => '☀️',
        'rainy' => '🌧️',
        'cloudy' => '☁️',
        'stormy' => '⛈️',
        'snowy' => '❄️',
        'foggy' => '🌫️',
        'windy' => '💨',
      }

      color = temperature > 20 ? Colors::RED : temperature > 10 ? Colors::YELLOW : Colors::BLUE

      puts "#{date.strftime('%A, %B %d')}: #{weather_emoji[weather]} #{weather.capitalize} " \
             "#{Colors.colorize("#{temperature}°C", color)}"
    end
  end
end

# Text art generator
class AsciiArtGenerator
  def self.create_pattern(width = 40, height = 10)
    puts Colors.colorize("\n🎨 Generated ASCII Pattern:", Colors::BOLD)

    height.times do |y|
      line = ''
      width.times do |x|
        # Create a mathematical pattern
        pattern_value = (Math.sin(x * 0.3) * Math.cos(y * 0.2) * 10).to_i
        char =
          case pattern_value
          when -10..-5
            Colors.colorize('█', Colors::BLUE)
          when -4..-1
            Colors.colorize('▓', Colors::CYAN)
          when 0..1
            Colors.colorize('▒', Colors::GREEN)
          when 2..4
            Colors.colorize('░', Colors::YELLOW)
          else
            Colors.colorize('·', Colors::RED)
          end
        line += char
      end
      puts line
    end
  end
end

# Ruby metaprogramming demonstration
class DynamicClassBuilder
  def self.create_robot_class
    robot_class =
      Class.new do
        attr_accessor :name, :model, :battery_level

        def initialize(name, model)
          @name = name
          @model = model
          @battery_level = 100
          @functions = []
        end

        def add_function(function_name)
          @functions << function_name

          # Dynamically define a method
          self
            .class
            .define_method(function_name) do
              if @battery_level > 10
                @battery_level -= 10
                "🤖 #{@name} executing #{function_name}... Battery: #{@battery_level}%"
              else
                "⚠️ #{@name} needs charging! Battery too low."
              end
            end
        end

        def status
          "Robot #{@name} (#{@model}) - Battery: #{@battery_level}% - Functions: #{@functions.join(', ')}"
        end
      end

    # Create a robot instance
    robot = robot_class.new('Ruby-Bot', 'RB-2025')
    robot.add_function(:scan_environment)
    robot.add_function(:collect_data)
    robot.add_function(:analyze_patterns)

    robot
  end
end

# Data processing with Ruby's enumerable methods
class DataProcessor
  def self.analyze_sample_data
    puts Colors.colorize("\n📊 Data Analysis Demonstration:", Colors::BOLD)

    # Generate sample data
    sales_data = Array.new(12) { rand(1000..5000) }
    months = %w[Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec]

    data_with_months = months.zip(sales_data).to_h

    puts 'Monthly Sales Data:'
    data_with_months.each do |month, sales|
      bar_length = (sales / 100).to_i
      bar = '█' * [bar_length, 50].min
      color = sales > 3500 ? Colors::GREEN : sales > 2500 ? Colors::YELLOW : Colors::RED
      puts "#{month}: #{Colors.colorize(bar, color)} $#{sales.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse}"
    end

    # Statistics
    total = sales_data.sum
    average = total / sales_data.length
    max_month = data_with_months.max_by { |_, sales| sales }
    min_month = data_with_months.min_by { |_, sales| sales }

    puts "\n📈 Statistics:"
    puts "Total Sales: $#{total.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse}"
    puts "Average: $#{average.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse}"
    puts "Best Month: #{Colors.colorize(max_month[0], Colors::GREEN)} ($#{max_month[1].to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse})"
    puts "Worst Month: #{Colors.colorize(min_month[0], Colors::RED)} ($#{min_month[1].to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse})"
  end
end

# Story generator using Ruby's string manipulation
class StoryGenerator
  CHARACTERS = ['brave knight', 'wise wizard', 'cunning thief', 'noble princess', 'ancient dragon']
  LOCATIONS = [
    'enchanted forest',
    'mystical castle',
    'hidden cave',
    'floating island',
    'underground city',
  ]
  OBJECTS = ['golden sword', 'magic crystal', 'ancient scroll', 'silver amulet', 'mysterious key']
  ACTIONS = ['discovered', 'fought against', 'befriended', 'outsmarted', 'rescued']

  def self.generate_adventure
    puts Colors.colorize("\n📚 Generated Adventure Story:", Colors::BOLD)

    character = CHARACTERS.sample
    location = LOCATIONS.sample
    object = OBJECTS.sample
    action = ACTIONS.sample
    antagonist = CHARACTERS.sample

    story = <<~STORY
      #{Colors.colorize("The Tale of the #{object.split.last.capitalize}", Colors::MAGENTA)}
      
      Once upon a time, a #{Colors.colorize(character, Colors::CYAN)} ventured into the #{Colors.colorize(location, Colors::GREEN)}.
      Deep within this mysterious place, they #{action} a #{Colors.colorize(antagonist, Colors::RED)} who guarded
      the legendary #{Colors.colorize(object, Colors::YELLOW)}.
      
      After an epic encounter, our hero emerged victorious and the #{object} now glows with
      #{Colors.colorize('magical power', Colors::MAGENTA)}, ready for the next adventure!
    STORY

    puts story
  end
end

# Main execution
def main
  print_banner

  # Display current time and system info
  puts Colors.colorize(
         "🕒 Current Time: #{Time.now.strftime('%A, %B %d, %Y at %I:%M:%S %p')}",
         Colors::BLUE,
       )
  puts Colors.colorize("💎 Ruby Version: #{RUBY_VERSION}", Colors::GREEN)
  puts Colors.colorize("🆔 Session ID: #{SecureRandom.uuid[0..7]}", Colors::YELLOW)

  # Fibonacci demonstration
  puts Colors.colorize("\n🔢 Fibonacci Sequence (first 15 numbers):", Colors::BOLD)
  fib = FibonacciGenerator.new(15)
  puts fib
         .map
         .with_index { |num, i|
           Colors.colorize(num.to_s, i.even? ? Colors::CYAN : Colors::MAGENTA)
         }
         .join(' → ')

  # Create magical creatures
  puts Colors.colorize("\n🧙‍♀️ Magical Creatures Assembly:", Colors::BOLD)
  creatures = [
    MagicalCreature.new('Sparkle', 'Unicorn', ['Healing Light', 'Rainbow Bridge', 'Purification']),
    MagicalCreature.new('Shadowmere', 'Dragon', ['Fire Breath', 'Flight', 'Telepathy']),
    MagicalCreature.new('Whisperwind', 'Phoenix', ['Rebirth', 'Flame Control', 'Prophecy']),
  ]

  creatures.each do |creature|
    puts creature.introduce
    creature.cast_spell('the ancient evil')
    puts
  end

  # Functional programming demo
  FunctionalDemo.demonstrate_blocks

  # Weather forecast
  WeatherSimulator.generate_forecast(5)

  # ASCII art
  AsciiArtGenerator.create_pattern(35, 8)

  # Dynamic robot creation
  puts Colors.colorize("\n🤖 Dynamic Robot Creation:", Colors::BOLD)
  robot = DynamicClassBuilder.create_robot_class
  puts robot.status
  puts robot.scan_environment
  puts robot.collect_data
  puts robot.analyze_patterns
  puts robot.status

  # Data analysis
  DataProcessor.analyze_sample_data

  # Story generation
  StoryGenerator.generate_adventure

  # Random Ruby fact
  ruby_facts = [
    'Ruby was created by Yukihiro Matsumoto (Matz) in 1995',
    "Ruby's philosophy: 'Make programmers happy'",
    'Everything in Ruby is an object, even numbers and nil',
    'Ruby supports multiple programming paradigms',
    'The Ruby community values kindness and collaboration',
  ]

  puts Colors.colorize("\n💡 Did you know?", Colors::BOLD)
  puts Colors.colorize(ruby_facts.sample, Colors::CYAN)

  # Closing message
  puts Colors.colorize("\n" + '=' * 60, Colors::MAGENTA)
  puts Colors.colorize('Thanks for exploring Ruby with us! 💎✨', Colors::BOLD)
  puts Colors.colorize('Ruby makes programming a joy! 🎉', Colors::GREEN)
  puts Colors.colorize('=' * 60, Colors::MAGENTA)
end

# Run the demonstration
main if __FILE__ == $PROGRAM_NAME
