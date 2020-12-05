def validate(validate_values)
  passports = []
  current_passport = nil
  valid_passports = 0

  required_field_names = %w(byr iyr eyr hgt hcl ecl pid)

  File.open('input.txt', 'r') do |f|
    f.each_line do |line|
      current_passport ||= ''

      if line.size == 1
        passports << current_passport
        current_passport = nil
      else
        current_passport += "#{line.chomp} "
      end
    end
  end

  passports << current_passport

  valid_years = []

  passports.each do |passport|
    fields = passport.split(' ').map { |field| field.split(':') }.to_h

    all_required_fields_present = (fields.keys.flatten & required_field_names).count == required_field_names.count

    all_values_valid =
      [
        fields['byr'].to_i.between?(1920, 2002),
        fields['iyr'].to_i.between?(2010, 2020),
        fields['eyr'].to_i.between?(2020, 2030),
        !fields['hgt'].nil? && (fields['hgt'].scan(/(\d{3})cm/).flatten[0].to_i.between?(150, 193) || fields['hgt'].scan(/(\d{2})in/).flatten[0].to_i.between?(59, 76)),
        fields['hcl'] =~ /^#[0-9a-f]{6}$/,
        fields['ecl'] =~ /^amb|blu|brn|gry|grn|hzl|oth$/,
        fields['pid'] =~ /^\d{9}$/,
      ].all?

    if fields['hcl'] =~ /#[0-9a-f]{6}/
      valid_years <<  fields['hcl']
    end

    if validate_values
      valid_passports += 1 if all_values_valid && all_required_fields_present
    else
      valid_passports += 1 if all_required_fields_present
    end
  end

  valid_passports
end

# Part 1
p validate false

# Part 2
p validate true
