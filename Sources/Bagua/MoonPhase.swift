#if canImport(WeatherKit)
import WeatherKit
import ChineseAstrologyCalendar

@available(iOS 16.0, macOS 13.0, watchOS 9.0, *)
extension MoonPhase {
  /// Eight-trigram symbol associated with the phase, if any.
  public var gua: Trigram? {
    switch self {
    case .new:
      return .kun
    case .waxingCrescent:
      return .zhen
    case .firstQuarter:
      return .dui
    case .waxingGibbous:
      return nil
    case .full:
      return .qian
    case .waningGibbous:
      return nil
    case .lastQuarter:
      return .xun
    case .waningCrescent:
      return .gen
    }
  }
  
  public var gua64: HexagramSymbol? {
    switch self {
    case .new:
      return .坤
    case .waxingCrescent:
      return .臨
    case .firstQuarter:
      return .大壯
    case .waxingGibbous:
      return nil
    case .full:
      return .乾
    case .waningGibbous:
      return nil
    case .lastQuarter:
      return .遯
    case .waningCrescent:
      return .觀
    }
  }
}
#endif

extension ChineseMoonPhase {
  // MARK: Public

  public var gua: Trigram? {
    switch self {
    case .朔, .晦:
      return .kun
    case .蛾眉月:
      return .zhen
    case .上弦月:
      return .dui
    case .漸盈凸月:
      return nil
    case .望:
      return .qian
    case .漸虧凸月:
      return nil
    case .下弦月:
      return .xun
    case .殘月:
      return .gen
    }
  }
}
