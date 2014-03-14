require 'csv'
require 'states'
require 'pry'

class ImportRecid
  # Import the Recid data
  def self.import
    # puts "root dir is #{"Rails.root"}"
    data = CSV.read("#{Rails.root}/data/ppus07st06.csv")

    data.each do |row|
      if row[1].present? && STATES.include?(row[1].strip)
        row.compact!
        puts "Row is #{row.inspect}"
        state_name = row[0].strip
        state_abbrev = STATES[row[0].strip]
        puts "State row is #{row.inspect}"
        State.create!(name: state_name, pop_at_risk: row[1].gsub(/,/,'').to_i, reincarcerated: row[2].gsub(/,/,'').to_i, percent: row[3].to_f, abbrev: state_abbrev)
      end
    end
  end

end