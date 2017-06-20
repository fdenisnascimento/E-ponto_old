// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
  typealias Image = UIImage
#elseif os(OSX)
  import AppKit.NSImage
  typealias Image = NSImage
#endif

// swiftlint:disable file_length
// swiftlint:disable line_length

// swiftlint:disable type_body_length
enum Asset: String {
  case bgCadastro6 = "bg_cadastro_6"
  case bgSobre = "bg_sobre"
  case fechar = "fechar"
  case iconAlertasBig = "icon_alertas_big"
  case iconAlertas = "icon_alertas"
  case iconAlmoco = "icon_almoco"
  case iconAlmoco2 = "icon_almoco2"
  case iconCheck = "icon_check"
  case iconConfig = "icon_config"
  case iconFim = "icon_fim"
  case iconIniciar = "icon_iniciar"
  case iconMenu = "icon_menu"
  case iconMeuPonto = "icon_meu_ponto"
  case iconSobre = "icon_sobre"
  case iconTarefasBig = "icon_tarefas_big"
  case iconTarefas = "icon_tarefas"
  case iconTarefas2 = "icon_tarefas2"
  case logoCadastro = "logo_cadastro"
  case logoSobre = "logo_sobre"
  case setaNav = "seta_nav"

  var image: Image {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    let image = Image(named: rawValue, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    let image = bundle.image(forResource: rawValue)
    #elseif os(watchOS)
    let image = Image(named: rawValue)
    #endif
    guard let result = image else { fatalError("Unable to load image \(rawValue).") }
    return result
  }
}
// swiftlint:enable type_body_length

extension Image {
  convenience init!(asset: Asset) {
    #if os(iOS) || os(tvOS)
    let bundle = Bundle(for: BundleToken.self)
    self.init(named: asset.rawValue, in: bundle, compatibleWith: nil)
    #elseif os(OSX) || os(watchOS)
    self.init(named: asset.rawValue)
    #endif
  }
}

private final class BundleToken {}
