//
//  MIAWPluginExample.swift
//  App
//
//  Created by Jeremy Wright on 2023-06-06.
//

import Foundation
import Capacitor
import SMIClientUI
import SMIClientCore

@objc(MIAWPluginExample)
public class MIAWPluginExample : CAPPlugin {
    private enum Constants {
        static let url = "Your-Server-Url"
        static let organizationId = "Your-Organization-Id"
        static let developerName = "Your-Developer-Name"
    }

    var config: UIConfiguration
    var vc: InterfaceViewController

    override public init(bridge: CAPBridgeProtocol, pluginId: String, pluginName: String) {
        let url = URL(string: Constants.url)!
        config = UIConfiguration(serviceAPI: url, organizationId: Constants.organizationId, developerName: Constants.developerName, conversationId: UUID())
        vc = InterfaceViewController(config)
        super.init(bridge: bridge, pluginId: pluginId, pluginName: pluginName)
    }

    @objc func startConversation(_ call: CAPPluginCall) {
        if #available(iOS 14, *) {
            DispatchQueue.main.async {
                super.bridge?.viewController?.navigationController?.pushViewController(self.vc, animated: true)
            }

        } else {
            call.reject("iOS version is too low")
        }
    }
}
