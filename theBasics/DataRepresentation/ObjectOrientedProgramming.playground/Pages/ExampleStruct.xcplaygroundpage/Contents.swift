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

struct Owner{
    let ownerName: String
}

let song1 = Song(songName: "StarBoy", artists: ["The Weekend"], uploadedOn: Date(), estimatedTimeMs: 3000, songUrls: ["320":URL(fileURLWithPath: "/starBoy320.mp3"),"128": URL(fileURLWithPath: "/starBoy128.mp3")], explicit: true, AlbumArtUrl: URL(fileURLWithPath: "/albumArt.mp3"))

let song2 = Song(songName: "Night Changes", artists: ["One Direction", "Sony Music"], uploadedOn: Date(), estimatedTimeMs: 3000, songUrls: ["320":URL(fileURLWithPath: "/starBoy320.mp3"),"128": URL(fileURLWithPath: "/starBoy128.mp3")], explicit: false, AlbumArtUrl: URL(fileURLWithPath: "/albumArt.mp3"))


var album1 = Album(albumName: "Latest Songs", songs: [song1,song2], owner: Owner(ownerName: "SonyMusic"))

print("Album Name: \(album1.albumName)")
print("Total PlayBack Time: \(album1.totalPlaybackTimeMs ?? 0 )")
print("Owner Name: \(album1.owner.ownerName)")
print("Number of Songs : \(album1.songs.count)")
print("\n---- Songs -----\n")

for song in album1.songs{
    print("Song Name: \(song.songName)")
    print("Artists : \(song.artists)")
    print(song.explicit ? "Explicit" : "Not Explicit")
    print("Estimated Play Time (ms): \(song.estimatedTimeMs)")
    print()
}




