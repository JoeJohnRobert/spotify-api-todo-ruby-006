require 'json'
require 'open-uri'

class SpotifyChart

  attr_reader :base_url

  def initialize
    @base_url = "http://charts.spotify.com/api/charts/"
  end

  def get_url(preference, region)
    # return a string that is the base url + / + preference + / + region + / + latest
    "http://charts.spotify.com/api/charts/#{preference}/#{region}/latest"

  end

  def get_json(url)
    JSON.load(open(url))

    # load json given a url here
    # refer to the references if you have questions about this
  end

  def fetch_track_album_artist(music_hash)
    track = ""
    i = 0
    music_hash["tracks"].each_with_index { |track, i| }

    "'#{music_hash["tracks"][i]["track_name"]}' by #{music_hash["tracks"][i]["artist_name"]} from the album #{music_hash["tracks"][i]["album_name"]}"
    # example music_hash:
    # {  
    #   "tracks" => [  
    #     {  
    #       "date"         =>"2014-09-14",
    #       "track_name"   =>"All About That Bass",
    #       "artist_name"  =>"Meghan Trainor",
    #       "album_name"   =>"Title"
    #     },
    #     {  
    #       "date"         =>"2014-09-14",
    #       "track_name"   =>"Break Free",
    #       "artist_name"  =>"Ariana Grande",
    #       "album_name"   =>"Break Free"
    #     }
    #   ]
    # }

    # given a hash, like the one above, this method should return a string like:
    # '<track name>' by <artist name> from the <album name>
  
    # the track name, artist name, and album name should be the first track in the
    # tracks array
  end


  def most_streamed(region)
    most_streamed = get_url("most_streamed", region)
    # call on get_url here, where preference is the string 'most_streamed',
    # and set it equal to a variable
    track_hash = get_json(most_streamed)

    fetch_track_album_artist(track_hash)
    # call on get_json here, using the string that get_url returns
    
    # finally, call on fetch_track_album_artist using the 
    # hash that get_json returns
    # most_streamed returns America's most streamed track title, artist, and album
  end

  def most_shared(region)
    most_shared = get_url("most_shared", region) 
    # call on get_url here, where preference is the string 'most_shared',
    # and set it equal to a variable
    track_hash = get_json(most_shared)
    # call on get_json here, using the string that get_url returns
    fetch_track_album_artist(track_hash)
    # finally, call on fetch_track_album_artist using the 
    # hash that get_json returns
  end

end
