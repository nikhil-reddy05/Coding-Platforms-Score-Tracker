import Foundation

struct codeforcesRoot: Decodable {
    var rating: Int
}

struct interviewbitRoot: Decodable {
    var rank: Int
    var score: Int
    var streak: String
}

struct codechefRoot: Decodable {
    var contests: [contestsData]
}

struct contestsData: Decodable {
    var name: String
    var rating: Int
}

struct spojRoot: Decodable {
    var rank: Int
    var points: Float
}

