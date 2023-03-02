import Foundation

struct Song {
    let songName: String
    let artists: [String]
    var album: Album?
    let uploadedOn: Date
    let estimatedTimeMs: Int
    let songUrls: [String: URL]
    let explicit: Bool
    let AlbumArtUrl: URL
}

struct Album {
    let albumName: String
    let songs: [Song]
    let owner : Owner
    lazy var totalPlaybackTimeMs : Int? = {
        songs.map{$0.estimatedTimeMs}.reduce(0, +)
    }()
}
class User{
    var name: String
    
    init(name: String){
        self.name = name
    }
}

class Owner : User {
    override init(name: String){
        super.init(name: name)
    }
}

let song1 = Song(songName: "StarBoy", artists: ["The Weekend"], uploadedOn: Date(), estimatedTimeMs: 3000, songUrls: ["320":URL(fileURLWithPath: "/starBoy320.mp3"),"128": URL(fileURLWithPath: "/starBoy128.mp3")], explicit: true, AlbumArtUrl: URL(fileURLWithPath: "/albumArt.mp3"))

let song2 = Song(songName: "Night Changes", artists: ["One Direction", "Sony Music"], uploadedOn: Date(), estimatedTimeMs: 3000, songUrls: ["320":URL(fileURLWithPath: "/starBoy320.mp3"),"128": URL(fileURLWithPath: "/starBoy128.mp3")], explicit: true, AlbumArtUrl: URL(fileURLWithPath: "/albumArt.mp3"))


var album1 = Album(albumName: "Latest Songs", songs: [song1,song2], owner: Owner(name: "SonyMusic"))

album1.totalPlaybackTimeMs


