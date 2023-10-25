//
//  AlertView.swift
//  SwiftUiCustomAlert
//
//  Created by Mustafa Hegy on 25/10/2023.
//

import SwiftUI

public struct AlertView: View {
    public let title: String
    public let description: String
    public let confirmAction: () -> Void
    public let cancelAction: () -> Void
    
    public init(title: String, description: String, confirmAction: @escaping () -> Void, cancelAction: @escaping () -> Void) {
        self.title = title
        self.description = description
        self.confirmAction = confirmAction
        self.cancelAction = cancelAction
    }
    
    @available(iOS 13.0.0, *)
    public var body: some View {
        VStack {
            Text(title)
                .font(.title)
            Text(description)
                .font(.body)
                .padding()
            
            HStack {
                Button("Cancel") {
                    cancelAction()
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                Button("Confirm") {
                    confirmAction()
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
    
}


//#Preview {
//    AlertView(title: "title", description: "description of the alert", confirmAction: <#() -> Void#>, cancelAction: <#() -> Void#>)
//}
