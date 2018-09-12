describe 'database' do 
	def run_script(commands)
		raw_output=nil
		IO.popen("./bdb","r+") do |pipe|
			commands.each do |command|
				pipe.puts command 
			end

			pipe.close_write

			#read entire output

			raw_output = pipe.gets(nil)
		end
		raw_output.split("\n")
	end

	it 'inserts and retrieves a row' do
		result = run_script([
			"insert 1 test test@com.com",
			"select",
			".exit",
		])
		expect(result).to match_array([
			"bdb >> Executed.",
			"bdb >> (1, test, test@com.com)",
			"Executed.",
			"bdb >>",
		])
	end

	it 'prints error message when table is full' do
		script = (1..1401).map do |i|
			"insert #{i} user#{i} person#{i}@example.com"
		end
	script << ".exit"
	result = run_script(script)
	expect(result[-2]).to eq('bdb >> Error Table full.')
end

end