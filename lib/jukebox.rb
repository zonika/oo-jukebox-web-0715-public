class Jukebox
  attr_accessor :songs
  def initialize(songs)
    @songs=songs
  end
  def call
    response=gets.chomp
    case response.downcase
    when "help"
      help
    when "list"
      list
    when "play"
      play
    else
      r=response.split(" ")
      play(r[1])
    end
  end
  def help
    puts "Type help to see this menu\n
    Type list to see the list of songs\n
    Type play to play a song\n
    Type exit to exit jukebox"
  end
  def list
    @songs.each_with_index do |song,index|
      puts "#{index+1}. #{song}"
    end
  end
  def play(song=nil)
    if song == nil
      puts "What would you like to play?"
      song=gets.chomp
      if song.to_i > 0
        puts "Now Playing: #{@songs[song.to_i-1]}"
      else
        puts "Now Playing: #{song}"
      end
    else
      if song.to_i > 0
        puts "Now Playing: #{@songs[song.to_i-1]}"
      else
        ss=@songs.find {|s|
          s.include? song}
        puts "Now Playing: #{ss}"
      end
    end
  end
end
# songs=[
#   "Phoenix - 1901",
#   "Tokyo Police Club - Wait Up",
#   "Sufjan Stevens - Too Much",
#   "The Naked and the Famous - Young Blood",
#   "(Far From) Home - Tiga",
#   "The Cults - Abducted",
#   "Phoenix - Consolation Prizes",
#   "Harry Chapman - Cats in the Cradle",
#   "Amos Lee - Keep It Loose, Keep It Tight"
# ]
# jb=Jukebox.new(songs)
# jb.play("Phoenix")
