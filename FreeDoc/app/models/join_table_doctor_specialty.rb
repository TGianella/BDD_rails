class JoinTableDoctorSpecialty < ApplicationRecord
  belongs_to :doctor
  belongs_to :specialty

  def self.dedupe
    grouped = all.group_by { |entry| [entry.doctor, entry.specialty] }
    grouped.values.each do |duplicates|
      first_one = duplicates.shift
      duplicates.each { |double| double.destroy }
    end
  end
end
