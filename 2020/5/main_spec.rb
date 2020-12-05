require_relative './main.rb'

describe 'binary boarding passes' do
  it 'decodes binary boarding pass' do
    expect(decode('FBFBBFFRLR')).to eq [44, 5, 357]
    expect(decode('BFFFBBFRRR')).to eq [70, 7, 567]
    expect(decode('FFFBBBFRRR')).to eq [14, 7, 119]
    expect(decode('BBFFBBFRLL')).to eq [102, 4, 820]
  end

  it 'solves the puzzle' do
    expect(run).to eq [813, 612]
  end
end
