require_relative '../lib/cli.rb'

describe 'call' do
  before do
    @cli = Cli.new
  end

  it 'does not run system("clear")' do
    skip system("clear")
  end

  it 'displays menu' do
    expected =
      "Welcome to Tic Tac Toe!\n" +
      "Game Menu\n" +
      "1. Play Game\n" +
      "2. Game Instructions\n" +
      "3. Exit\n"
    expect { @cli.call }.to output(expected).to_stdout
  end
end
