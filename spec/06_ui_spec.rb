require 'spec_helper'

describe 'UI' do

	context '#splash' do
		it 'starts the game with an ASCII splash' do
			ui = UI.new
			output = capture_puts { ui.splash }

			expect(output).to include('-------------------------------------------------------------')
			expect(output).to include("\n")
			expect(output).to include("\n")
			expect(output).to include("888   d8b        888                   888                   ")

		end
	end

	


end