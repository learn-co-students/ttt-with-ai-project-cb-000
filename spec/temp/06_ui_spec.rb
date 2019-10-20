require 'spec_helper'

describe 'UI' do

	context 'with #greeting' do
		it 'starts the game with an ASCII splash' do
			ui = UI.new
			output = capture_puts { ui.greeting }

			expect(output).to include('-------------------------------------------------------------')
			expect(output).to include("\n")
			expect(output).to include("\n")
			expect(output).to include("888   d8b        888                   888                   ")

		end
	end

	# describe '#get_input' do
	# 	it 'receives valid user input' do
	# 		ui = UI.new
	# 		allow($stdout).to receive(:puts)

			

	# 	end

	# end

	


end