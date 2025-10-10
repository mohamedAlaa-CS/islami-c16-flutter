//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import shared_preferences_foundation

/// Registers the generated Flutter plugins with the provided plugin registry.
/// 
/// This function registers the plugin implementations that were generated for this macOS build — currently it registers `SharedPreferencesPlugin`.
/// - Parameter registry: The `FlutterPluginRegistry` used to obtain plugin registrars and perform registration.
func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  SharedPreferencesPlugin.register(with: registry.registrar(forPlugin: "SharedPreferencesPlugin"))
}