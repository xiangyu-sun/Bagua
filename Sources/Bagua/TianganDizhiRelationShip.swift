import ChineseAstrologyCalendar

extension Tiangan {
  
  public var heWuxing: Wuxing {
    switch self {
    case .jia:
        .earth
    case .yi:
        .metal
    case .bing:
        .water
    case .ding:
        .wood
    case .wu:
        .fire
    case .ji:
        .earth
    case .geng:
        .metal
    case .xin:
        .water
    case .ren:
        .wood
    case .kui:
        .fire
    }
  }
  
  /// 合 partner of the heavenly stem (甲↔己, 乙↔庚, 丙↔辛, 丁↔壬, 戊↔癸)
  public var hePartner: Tiangan {
    // Stems 1–5 pair with 6–10 by adding 5; stems 6–10 pair with 1–5 by subtracting 5
    let partnerRaw = rawValue <= 5 ? rawValue + 5 : rawValue - 5
    return Tiangan(rawValue: partnerRaw)!
  }
  
    /// 相冲 partner of the heavenly stem (甲↔庚, 乙↔辛, 丙↔壬, 丁↔癸; 戊、己无冲)
    public var chongPartner: Tiangan? {
        switch rawValue {
        case 1...4:
            return Tiangan(rawValue: rawValue + 6)
        case 7...10:
            return Tiangan(rawValue: rawValue - 6)
        default:
            return nil
        }
    }
}
