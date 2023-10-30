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
    public let confirmButtonLabel: String
    public let cancelButtonLabel: String
    public let confirmAction: () -> Void
    public let cancelAction: () -> Void
    
    public init(title: String, description: String, confirmButtonLabel: String, cancelButtonLabel: String, confirmAction: @escaping () -> Void, cancelAction: @escaping () -> Void) {
        self.title = title
        self.description = description
        self.confirmButtonLabel = confirmButtonLabel
        self.cancelButtonLabel = cancelButtonLabel
        self.confirmAction = confirmAction
        self.cancelAction = cancelAction
    }
    
    @available(iOS 13.0.0, *)
    public var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10) // Rounded background
                .fill(Color.white)
                .shadow(radius: 5)
            VStack {
                Text(title)
                    .font(.title)
                Text(description)
                    .font(.body)
                    .padding()
                
                HStack {
                    Button(cancelButtonLabel) {
                        cancelAction()
                    }
                    .frame(height: 40)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    
                    Button(confirmButtonLabel) {
                        confirmAction()
                    }
                    .frame(height: 40)
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
    
}


//#Preview {
//    AlertView(title: "title", description: "description of the alert", confirmAction: <#() -> Void#>, cancelAction: <#() -> Void#>)
//}
