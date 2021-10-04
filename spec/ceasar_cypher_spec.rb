require '../ceasar_cypher.rb'

describe 'cypher' do
	it 'returns encrypted string' do
		expect(cypher('aaa', 1)).to eql('bbb')
	end
	it 'starts again from the alphabet after z' do
		expect(cypher('zzz', 1)).to eql('aaa')
	end
	it 'returns encrypted capital letter' do
		expect(cypher('ZZZ', 1)).to eql('AAA')
	end 
	it 'returns numbers unencrypted' do
		expect(cypher('abc123', 25)).to eql('zab123')
	end
	it 'returns module of 26 if second arg > 26' do
		expect(cypher('abc123', 27)).to eql('bcd123')
	end
end
