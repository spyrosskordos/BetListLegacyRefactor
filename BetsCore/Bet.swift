public struct Bet: Identifiable, Equatable {
    public let id: UUID
    public var name: String
    public var sellIn: Int
    public var quality: Int

    public init(id: UUID = UUID(), name: String, sellIn: Int, quality: Int) {
        self.id = id
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
    }
}
