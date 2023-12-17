// MARK: - Hexagram

public struct Hexagram: Identifiable, Equatable {
  public var id: String { chineseCharacter }
  public let symbol: String
  public let chineseCharacter: String
}

public struct Trigram: Identifiable, Equatable {
  public var id: String { chineseCharacter }
  public let symbol: String
  public let chineseCharacter: String
  public let xiang: String
  
  public static let qian = Trigram(symbol: "☰", chineseCharacter: "乾", xiang: "天")
  public static let xun = Trigram(symbol: "☴", chineseCharacter: "巽", xiang: "风")
  public static let kan = Trigram(symbol: "☵", chineseCharacter: "坎", xiang: "水")
  public static let gen = Trigram(symbol: "☶", chineseCharacter: "艮", xiang: "山")
  public static let kun = Trigram(symbol: "☷", chineseCharacter: "坤", xiang: "地")
  public static let zhen = Trigram(symbol: "☳", chineseCharacter: "震", xiang: "雷")
  public static let li = Trigram(symbol: "☲", chineseCharacter: "離", xiang: "火")
  public static let dui = Trigram(symbol: "☱", chineseCharacter: "兌", xiang: "澤")
}



public let xiantianBagua =  [
  Trigram.qian,
  .xun,
  .kan,
  .gen,
  .kun,
  .zhen,
  .li,
  .dui
]

public let houtianBagua =  [
  Trigram.li,
  .kun,
  .dui,
  .qian,
  .kan,
  .gen,
  .zhen,
  .xun
]

public let ShierPiguas = [
  Hexagram(symbol: "䷀", chineseCharacter: "乾"),
  Hexagram(symbol: "䷫", chineseCharacter: "姤"),
  Hexagram(symbol: "䷠", chineseCharacter: "遯"),
  Hexagram(symbol: "䷋", chineseCharacter: "否"),
  Hexagram(symbol: "䷓", chineseCharacter: "觀"),
  Hexagram(symbol: "䷖", chineseCharacter: "剝"),
  Hexagram(symbol: "䷁", chineseCharacter: "坤"),
  Hexagram(symbol: "䷗", chineseCharacter: "復"),
  Hexagram(symbol: "䷒", chineseCharacter: "臨"),
  Hexagram(symbol: "䷊", chineseCharacter: "泰"),
  Hexagram(symbol: "䷡", chineseCharacter: "大壯"),
  Hexagram(symbol: "䷪", chineseCharacter: "夬"),
]

public let hexagramSymbols: [Hexagram] = [
  Hexagram(symbol: "䷀", chineseCharacter: "乾"), Hexagram(symbol: "䷁", chineseCharacter: "坤"),
  Hexagram(symbol: "䷂", chineseCharacter: "屯"), Hexagram(symbol: "䷃", chineseCharacter: "蒙"),
  Hexagram(symbol: "䷄", chineseCharacter: "需"), Hexagram(symbol: "䷅", chineseCharacter: "訟"),
  Hexagram(symbol: "䷆", chineseCharacter: "師"), Hexagram(symbol: "䷇", chineseCharacter: "比"),
  Hexagram(symbol: "䷈", chineseCharacter: "小畜"), Hexagram(symbol: "䷉", chineseCharacter: "履"),
  Hexagram(symbol: "䷊", chineseCharacter: "泰"), Hexagram(symbol: "䷋", chineseCharacter: "否"),
  Hexagram(symbol: "䷌", chineseCharacter: "同人"), Hexagram(symbol: "䷍", chineseCharacter: "大有"),
  Hexagram(symbol: "䷎", chineseCharacter: "謙"), Hexagram(symbol: "䷏", chineseCharacter: "豫"),
  Hexagram(symbol: "䷐", chineseCharacter: "隨"), Hexagram(symbol: "䷑", chineseCharacter: "蠱"),
  Hexagram(symbol: "䷒", chineseCharacter: "臨"), Hexagram(symbol: "䷓", chineseCharacter: "觀"),
  Hexagram(symbol: "䷔", chineseCharacter: "噬嗑"), Hexagram(symbol: "䷕", chineseCharacter: "賁"),
  Hexagram(symbol: "䷖", chineseCharacter: "剝"), Hexagram(symbol: "䷗", chineseCharacter: "復"),
  Hexagram(symbol: "䷘", chineseCharacter: "無妄"), Hexagram(symbol: "䷙", chineseCharacter: "大畜"),
  Hexagram(symbol: "䷚", chineseCharacter: "頤"), Hexagram(symbol: "䷛", chineseCharacter: "大過"),
  Hexagram(symbol: "䷜", chineseCharacter: "坎"), Hexagram(symbol: "䷝", chineseCharacter: "離"),
  Hexagram(symbol: "䷞", chineseCharacter: "咸"), Hexagram(symbol: "䷟", chineseCharacter: "恆"),
  Hexagram(symbol: "䷠", chineseCharacter: "遯"), Hexagram(symbol: "䷡", chineseCharacter: "大壯"),
  Hexagram(symbol: "䷢", chineseCharacter: "晉"), Hexagram(symbol: "䷣", chineseCharacter: "明夷"),
  Hexagram(symbol: "䷤", chineseCharacter: "家人"), Hexagram(symbol: "䷥", chineseCharacter: "睽"),
  Hexagram(symbol: "䷦", chineseCharacter: "蹇"), Hexagram(symbol: "䷧", chineseCharacter: "解"),
  Hexagram(symbol: "䷨", chineseCharacter: "損"), Hexagram(symbol: "䷩", chineseCharacter: "益"),
  Hexagram(symbol: "䷪", chineseCharacter: "夬"), Hexagram(symbol: "䷫", chineseCharacter: "姤"),
  Hexagram(symbol: "䷬", chineseCharacter: "萃"), Hexagram(symbol: "䷭", chineseCharacter: "升"),
  Hexagram(symbol: "䷮", chineseCharacter: "困"), Hexagram(symbol: "䷯", chineseCharacter: "井"),
  Hexagram(symbol: "䷰", chineseCharacter: "革"), Hexagram(symbol: "䷱", chineseCharacter: "鼎"),
  Hexagram(symbol: "䷲", chineseCharacter: "震"), Hexagram(symbol: "䷳", chineseCharacter: "艮"),
  Hexagram(symbol: "䷴", chineseCharacter: "漸"), Hexagram(symbol: "䷵", chineseCharacter: "歸妹"),
  Hexagram(symbol: "䷶", chineseCharacter: "豐"), Hexagram(symbol: "䷷", chineseCharacter: "旅"),
  Hexagram(symbol: "䷸", chineseCharacter: "巽"), Hexagram(symbol: "䷹", chineseCharacter: "兌"),
  Hexagram(symbol: "䷺", chineseCharacter: "渙"), Hexagram(symbol: "䷻", chineseCharacter: "節"),
  Hexagram(symbol: "䷼", chineseCharacter: "中孚"), Hexagram(symbol: "䷽", chineseCharacter: "小過"),
  Hexagram(symbol: "䷾", chineseCharacter: "既濟"), Hexagram(symbol: "䷿", chineseCharacter: "未濟"),
]
