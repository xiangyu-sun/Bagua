import ChineseAstrologyCalendar
import Testing
@testable import Bagua

@Suite struct TrigramTests {

  @Test func yinYangFollowsFamilyClassification() {
    let yang: [Trigram] = [.qian, .zhen, .kan, .gen]
    let yin: [Trigram] = [.kun, .xun, .li, .dui]
    #expect(yang.allSatisfy { $0.isYang })
    #expect(yin.allSatisfy { $0.isYin })
  }

  @Test func arrangementsContainEachTrigramOnce() {
    #expect(Set(xiantianBagua).count == 8)
    #expect(Set(houtianBagua).count == 8)
    #expect(Set(xiantianBagua) == Set(houtianBagua))
  }

  @Test func wuxing() {
    #expect(Trigram.qian.wuxing == .metal)
    #expect(Trigram.dui.wuxing == .metal)
    #expect(Trigram.zhen.wuxing == .wood)
    #expect(Trigram.xun.wuxing == .wood)
    #expect(Trigram.kan.wuxing == .water)
    #expect(Trigram.li.wuxing == .fire)
    #expect(Trigram.kun.wuxing == .earth)
    #expect(Trigram.gen.wuxing == .earth)
  }

  @Test func xiangIsTraditionalChinese() {
    #expect(Trigram.xun.xiang == "風")
    #expect(Trigram.dui.xiang == "澤")
  }

  @Test func localized() {
    #expect(Trigram.li.localizedName(in: .zhHant) == "離")
    #expect(Trigram.li.localizedName(in: .zhHans) == "离")
    #expect(Trigram.li.localizedName(in: .en) == "Lí")
    #expect(Trigram.xun.localizedXiang(in: .zhHans) == "风")
    #expect(Trigram.dui.localizedXiang(in: .en) == "Lake")
    for trigram in xiantianBagua {
      #expect(trigram.localizedName(in: .en) != trigram.chineseCharacter)
      #expect(trigram.localizedXiang(in: .en) != trigram.xiang)
    }
  }
}

@Suite struct HexagramTests {

  @Test func kingWenNumbering() {
    #expect(HexagramSymbol.乾.number == 1)
    #expect(HexagramSymbol.噬嗑.number == 21)
    #expect(HexagramSymbol.未濟.number == 64)
    #expect(HexagramSymbol.allCases.map { $0.number } == Array(1...64))
  }

  @Test func symbolEnumMatchesHexagramList() {
    #expect(hexagramSymbols.count == 64)
    for (hexagram, symbol) in zip(hexagramSymbols, HexagramSymbol.allCases) {
      #expect(hexagram.symbol == symbol.rawValue)
      #expect(hexagram.chineseCharacter == String(describing: symbol))
      #expect(hexagram.hexagramSymbol == symbol)
    }
  }

  @Test func localized() {
    #expect(HexagramSymbol.既濟.localizedName(in: .zhHant) == "既濟")
    #expect(HexagramSymbol.既濟.localizedName(in: .zhHans) == "既济")
    #expect(HexagramSymbol.既濟.localizedName(in: .en) == "After Completion")
    #expect(HexagramSymbol.噬嗑.pinyin == "Shì Kè")
    #expect(Hexagram(symbol: "䷀", chineseCharacter: "乾").localizedName(in: .en) == "The Creative")
  }

  @Test func everyHexagramHasAllNames() {
    for symbol in HexagramSymbol.allCases {
      for language in DisplayLanguage.allCases {
        #expect(!symbol.localizedName(in: language).isEmpty)
      }
      #expect(!symbol.pinyin.isEmpty)
    }
  }

  @Test func shierPiguaAreInSequence() {
    #expect(ShierPiguas.count == 12)
    #expect(ShierPiguas.allSatisfy { $0.hexagramSymbol != nil })
  }
}

@Suite struct TianganRelationshipTests {

  @Test func hePartnerIsInvolution() {
    for stem in Tiangan.allCases {
      #expect(stem.hePartner.hePartner == stem)
      #expect(stem.heWuxing == stem.hePartner.heWuxing)
    }
  }

  @Test func chong() {
    #expect(Tiangan.jia.chongPartner == .geng)
    #expect(Tiangan.wu.chongPartner == nil)
    #expect(Tiangan.ji.chongPartner == nil)
  }
}
