import ChineseAstrologyCalendar
import Foundation

// MARK: - Trigram + LocalizedNaming

/// Chinese names use the trigram's character (乾, 離 / 离). English and Spanish
/// use Hanyu Pinyin, since the trigram names have no settled translation; the
/// translated image ("Heaven" / "Cielo", "Fire" / "Fuego") is available from
/// ``Trigram/localizedXiang(in:)``.
extension Trigram: LocalizedNaming {
  public func localizedName(in language: DisplayLanguage) -> String {
    lookup(Self.names, language) ?? chineseCharacter
  }

  /// The trigram's natural image (象): 天, 地, 雷, 風 …, "Heaven", "Earth", "Thunder", "Wind" …
  /// or "Cielo", "Tierra", "Trueno", "Viento" ….
  public func localizedXiang(in language: DisplayLanguage) -> String {
    lookup(Self.images, language) ?? xiang
  }

  /// Looks up this trigram in `table`. Languages without their own entry
  /// (Russian, …) use English.
  private func lookup(_ table: [String: [DisplayLanguage: String]], _ language: DisplayLanguage) -> String? {
    guard let entry = table[chineseCharacter] else { return nil }
    return entry[language] ?? entry[.en]
  }

  private static let names: [String: [DisplayLanguage: String]] = [
    "乾": [.zhHant: "乾", .zhHans: "乾", .en: "Qián", .es: "Qián"],
    "坤": [.zhHant: "坤", .zhHans: "坤", .en: "Kūn", .es: "Kūn"],
    "震": [.zhHant: "震", .zhHans: "震", .en: "Zhèn", .es: "Zhèn"],
    "巽": [.zhHant: "巽", .zhHans: "巽", .en: "Xùn", .es: "Xùn"],
    "坎": [.zhHant: "坎", .zhHans: "坎", .en: "Kǎn", .es: "Kǎn"],
    "離": [.zhHant: "離", .zhHans: "离", .en: "Lí", .es: "Lí"],
    "艮": [.zhHant: "艮", .zhHans: "艮", .en: "Gèn", .es: "Gèn"],
    "兌": [.zhHant: "兌", .zhHans: "兑", .en: "Duì", .es: "Duì"],
  ]

  private static let images: [String: [DisplayLanguage: String]] = [
    "乾": [.zhHant: "天", .zhHans: "天", .en: "Heaven", .es: "Cielo"],
    "坤": [.zhHant: "地", .zhHans: "地", .en: "Earth", .es: "Tierra"],
    "震": [.zhHant: "雷", .zhHans: "雷", .en: "Thunder", .es: "Trueno"],
    "巽": [.zhHant: "風", .zhHans: "风", .en: "Wind", .es: "Viento"],
    "坎": [.zhHant: "水", .zhHans: "水", .en: "Water", .es: "Agua"],
    "離": [.zhHant: "火", .zhHans: "火", .en: "Fire", .es: "Fuego"],
    "艮": [.zhHant: "山", .zhHans: "山", .en: "Mountain", .es: "Montaña"],
    "兌": [.zhHant: "澤", .zhHans: "泽", .en: "Lake", .es: "Lago"],
  ]
}

// MARK: - HexagramSymbol + LocalizedNaming

extension HexagramSymbol: LocalizedNaming {

  /// The hexagram's position in the King Wen sequence (1 = 乾 … 64 = 未濟).
  public var number: Int {
    // The Unicode block U+4DC0–U+4DFF follows the King Wen sequence.
    Int(rawValue.unicodeScalars.first!.value) - 0x4DC0 + 1
  }

  /// The hexagram's name in Hanyu Pinyin, e.g. "Qián", "Shì Kè".
  public var pinyin: String {
    Self.pinyinNames[number - 1]
  }

  /// Chinese names are the hexagram's character(s). English uses the common
  /// Wilhelm–Baynes titles ("The Creative", "Biting Through") and Spanish the
  /// titles of D. J. Vogelmann's translation of Wilhelm ("Lo Creativo",
  /// "La Mordedura Tajante"). Other languages use the English titles.
  public func localizedName(in language: DisplayLanguage) -> String {
    switch language {
    case .zhHant: return String(describing: self)
    case .zhHans: return Self.simplifiedNames[number - 1]
    case .es: return Self.spanishNames[number - 1]
    default: return Self.englishNames[number - 1]
    }
  }

  private static let simplifiedNames = [
    "乾", "坤", "屯", "蒙", "需", "讼", "师", "比",
    "小畜", "履", "泰", "否", "同人", "大有", "谦", "豫",
    "随", "蛊", "临", "观", "噬嗑", "贲", "剥", "复",
    "无妄", "大畜", "颐", "大过", "坎", "离", "咸", "恒",
    "遁", "大壮", "晋", "明夷", "家人", "睽", "蹇", "解",
    "损", "益", "夬", "姤", "萃", "升", "困", "井",
    "革", "鼎", "震", "艮", "渐", "归妹", "丰", "旅",
    "巽", "兑", "涣", "节", "中孚", "小过", "既济", "未济",
  ]

  private static let pinyinNames = [
    "Qián", "Kūn", "Zhūn", "Méng", "Xū", "Sòng", "Shī", "Bǐ",
    "Xiǎo Chù", "Lǚ", "Tài", "Pǐ", "Tóng Rén", "Dà Yǒu", "Qiān", "Yù",
    "Suí", "Gǔ", "Lín", "Guān", "Shì Kè", "Bì", "Bō", "Fù",
    "Wú Wàng", "Dà Chù", "Yí", "Dà Guò", "Kǎn", "Lí", "Xián", "Héng",
    "Dùn", "Dà Zhuàng", "Jìn", "Míng Yí", "Jiā Rén", "Kuí", "Jiǎn", "Xiè",
    "Sǔn", "Yì", "Guài", "Gòu", "Cuì", "Shēng", "Kùn", "Jǐng",
    "Gé", "Dǐng", "Zhèn", "Gèn", "Jiàn", "Guī Mèi", "Fēng", "Lǚ",
    "Xùn", "Duì", "Huàn", "Jié", "Zhōng Fú", "Xiǎo Guò", "Jì Jì", "Wèi Jì",
  ]

  private static let englishNames = [
    "The Creative", "The Receptive", "Difficulty at the Beginning", "Youthful Folly",
    "Waiting", "Conflict", "The Army", "Holding Together",
    "The Taming Power of the Small", "Treading", "Peace", "Standstill",
    "Fellowship with Men", "Possession in Great Measure", "Modesty", "Enthusiasm",
    "Following", "Work on What Has Been Spoiled", "Approach", "Contemplation",
    "Biting Through", "Grace", "Splitting Apart", "Return",
    "Innocence", "The Taming Power of the Great", "The Corners of the Mouth", "Preponderance of the Great",
    "The Abysmal", "The Clinging", "Influence", "Duration",
    "Retreat", "The Power of the Great", "Progress", "Darkening of the Light",
    "The Family", "Opposition", "Obstruction", "Deliverance",
    "Decrease", "Increase", "Break-through", "Coming to Meet",
    "Gathering Together", "Pushing Upward", "Oppression", "The Well",
    "Revolution", "The Caldron", "The Arousing", "Keeping Still",
    "Development", "The Marrying Maiden", "Abundance", "The Wanderer",
    "The Gentle", "The Joyous", "Dispersion", "Limitation",
    "Inner Truth", "Preponderance of the Small", "After Completion", "Before Completion",
  ]

  private static let spanishNames = [
    "Lo Creativo", "Lo Receptivo", "La Dificultad Inicial", "La Necedad Juvenil",
    "La Espera", "El Conflicto", "El Ejército", "La Solidaridad",
    "La Fuerza Domesticadora de lo Pequeño", "El Porte", "La Paz", "El Estancamiento",
    "Comunidad con los Hombres", "La Posesión de lo Grande", "La Modestia", "El Entusiasmo",
    "El Seguimiento", "El Trabajo en lo Echado a Perder", "El Acercamiento", "La Contemplación",
    "La Mordedura Tajante", "La Gracia", "La Desintegración", "El Retorno",
    "La Inocencia", "La Fuerza Domesticadora de lo Grande", "Las Comisuras de la Boca", "La Preponderancia de lo Grande",
    "Lo Abismal", "Lo Adherente", "El Influjo", "La Duración",
    "La Retirada", "El Poder de lo Grande", "El Progreso", "El Oscurecimiento de la Luz",
    "El Clan", "El Antagonismo", "El Impedimento", "La Liberación",
    "La Merma", "El Aumento", "El Desbordamiento", "El Ir al Encuentro",
    "La Reunión", "La Subida", "La Desazón", "El Pozo de Agua",
    "La Revolución", "El Caldero", "Lo Suscitativo", "El Aquietamiento",
    "La Evolución", "La Muchacha que se Casa", "La Plenitud", "El Andariego",
    "Lo Suave", "Lo Sereno", "La Disolución", "La Restricción",
    "La Verdad Interior", "La Preponderancia de lo Pequeño", "Después de la Consumación", "Antes de la Consumación",
  ]
}

// MARK: - Hexagram + LocalizedNaming

extension Hexagram: LocalizedNaming {
  /// The matching ``HexagramSymbol``, looked up by Unicode symbol.
  public var hexagramSymbol: HexagramSymbol? {
    HexagramSymbol.allCases.first { $0.rawValue == symbol }
  }

  public func localizedName(in language: DisplayLanguage) -> String {
    hexagramSymbol?.localizedName(in: language) ?? chineseCharacter
  }
}
