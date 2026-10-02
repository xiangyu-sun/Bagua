# Bagua

The eight trigrams (八卦) and sixty-four hexagrams (六十四卦) of the I Ching, built on
[ChineseAstrologyCalendar](https://github.com/xiangyu-sun/ChineseAstrologyCalendar).

- `Trigram`: symbol, character, image (象), yin/yang, Five Element, and the
  先天 (`xiantianBagua`) and 後天 (`houtianBagua`) arrangements
- `HexagramSymbol` / `Hexagram`: all 64 hexagrams in King Wen order, with `number`,
  `pinyin`, and the twelve sovereign hexagrams (`ShierPiguas`)
- Moon phase to trigram/hexagram mapping (`ChineseMoonPhase.gua`, WeatherKit `MoonPhase.gua64`)
- Heavenly-stem combinations and clashes (`Tiangan.hePartner`, `heWuxing`, `chongPartner`)

## Installation

```swift
.package(url: "https://github.com/xiangyu-sun/Bagua.git", from: "1.1.0")
```

## Localization

Trigrams and hexagrams adopt ChineseAstrologyCalendar's `LocalizedNaming`, so they render
in Traditional Chinese, Simplified Chinese or English with the same call as the rest of
the calendar. Other languages (Russian, Spanish) use the English names:

```swift
Trigram.li.localizedName(in: .zhHans)            // "离"
Trigram.dui.localizedXiang(in: .en)              // "Lake"
HexagramSymbol.既濟.localizedName(in: .en)        // "After Completion"
HexagramSymbol.既濟.pinyin                        // "Jì Jì"
```

## References

- https://en.wikibooks.org/wiki/I_Ching/The_64_Hexagrams
- https://zh.wikipedia.org/zh-hans/八卦
- https://en.wikipedia.org/wiki/Bagua
