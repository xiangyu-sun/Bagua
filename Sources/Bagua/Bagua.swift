//
//  Bagua.swift
//
//  Created by Xiangyu Sun on 19/1/23.
//  Revised on [Date] for improved documentation and additional computed properties.
//
//  This file defines data types and collections related to the Bagua, the eight trigrams
//  used in Chinese metaphysics, divination (the I Ching), and Feng Shui. Each trigram
//  (八卦) represents fundamental natural elements and qualities. The two primary arrangements
//  of the trigrams – the 先天 (xiantian, “Pre-Heaven” or “Primordial”) and 后天 (houtian,
//  “Post-Heaven” or “Acquired”) Bagua – serve different purposes in traditional thought.
//  In addition, the 64 hexagrams (卦) of the I Ching are provided in two collections: one
//  representing a select subset (十二批卦, “ShierPiguas”) and one representing the complete
//  set in a traditional order.
//

import Foundation

// MARK: - Hexagram

/// A Hexagram represents one of the 64 symbols used in the I Ching, each of which is composed
/// of two trigrams. In this simple model, a hexagram is defined by its Unicode symbol and its
/// associated Chinese character.
public struct Hexagram: Identifiable, Equatable {
  /// The identifier is the Chinese character.
  public var id: String { chineseCharacter }
  /// The Unicode symbol representing the hexagram.
  public let symbol: String
  /// The Chinese character (name) of the hexagram.
  public let chineseCharacter: String
}

// MARK: - Trigram

/// A Trigram is one of the eight fundamental symbols (八卦) that represent natural phenomena.
/// Each trigram is associated with a symbol, a Chinese character, and an attribute (xiang)
/// that indicates its elemental image (e.g. "天" for heaven, "地" for earth).
public struct Trigram: Identifiable, Equatable {
  /// The identifier is the Chinese character.
  public var id: String { chineseCharacter }
  /// The Unicode symbol representing the trigram.
  public let symbol: String
  /// The Chinese character (name) of the trigram.
  public let chineseCharacter: String
  /// The “xiang” or image associated with the trigram – its elemental attribute.
  public let xiang: String
  
  // Static instances for the eight trigrams.
  public static let qian = Trigram(symbol: "☰", chineseCharacter: "乾", xiang: "天")
  public static let xun  = Trigram(symbol: "☴", chineseCharacter: "巽", xiang: "风")
  public static let kan  = Trigram(symbol: "☵", chineseCharacter: "坎", xiang: "水")
  public static let gen  = Trigram(symbol: "☶", chineseCharacter: "艮", xiang: "山")
  public static let kun  = Trigram(symbol: "☷", chineseCharacter: "坤", xiang: "地")
  public static let zhen = Trigram(symbol: "☳", chineseCharacter: "震", xiang: "雷")
  public static let li   = Trigram(symbol: "☲", chineseCharacter: "離", xiang: "火")
  public static let dui  = Trigram(symbol: "☱", chineseCharacter: "兌", xiang: "澤")
}

// MARK: - Trigram Computed Properties

extension Trigram {
  /// Returns `true` if the trigram is traditionally considered a Yang (active) trigram.
  /// In traditional classification:
  ///   - Yang trigrams: 乾 (qian), 巽 (xun), 震 (zhen), 離 (li)
  ///   - Yin trigrams: 坤 (kun), 艮 (gen), 坎 (kan), 兌 (dui)
  public var isYang: Bool {
    // Compare the Chinese character to known Yang symbols.
    return chineseCharacter == "乾" ||
           chineseCharacter == "巽" ||
           chineseCharacter == "震" ||
           chineseCharacter == "離"
  }
  
  /// Returns `true` if the trigram is traditionally considered a Yin (passive) trigram.
  public var isYin: Bool {
    return !isYang
  }
  
  /// Returns a brief description combining the symbol, the Chinese character, and the elemental image.
  public var description: String {
    return "\(symbol) (\(chineseCharacter)) – \(xiang)"
  }
}

// MARK: - Bagua Arrays

/// The xiantian (先天) Bagua is the arrangement of trigrams representing the primordial
/// or pre-heaven order. This arrangement is often used in Taoist cosmology and Feng Shui.
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

/// The houtian (后天) Bagua is the arrangement of trigrams representing the post-heaven,
/// practical order used in human affairs and applied Feng Shui.
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

/// ShierPiguas (十二批卦) is a select collection of 12 hexagrams that may be used in certain
/// divination systems or as part of cyclical interpretations of the I Ching.
public let ShierPiguas = [
  Hexagram(symbol: "䷊", chineseCharacter: "泰"),
  Hexagram(symbol: "䷡", chineseCharacter: "大壯"),
  Hexagram(symbol: "䷪", chineseCharacter: "夬"),
  Hexagram(symbol: "䷀", chineseCharacter: "乾"),
  Hexagram(symbol: "䷫", chineseCharacter: "姤"),
  Hexagram(symbol: "䷠", chineseCharacter: "遯"),
  Hexagram(symbol: "䷋", chineseCharacter: "否"),
  Hexagram(symbol: "䷓", chineseCharacter: "觀"),
  Hexagram(symbol: "䷖", chineseCharacter: "剝"),
  Hexagram(symbol: "䷁", chineseCharacter: "坤"),
  Hexagram(symbol: "䷗", chineseCharacter: "復"),
  Hexagram(symbol: "䷒", chineseCharacter: "臨")
]

/// The hexagramSymbols array contains all 64 hexagrams of the I Ching arranged in a
/// traditional order. Each hexagram is represented by its Unicode symbol and Chinese name.
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
