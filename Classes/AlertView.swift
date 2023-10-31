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
            Color.black
                .opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                RoundedRectangle(cornerRadius: 12) // Rounded background
                    .fill(Color.white)
                    .frame(width: UIScreen.main.bounds.width - 60, height: UIScreen.main.bounds.width - 60)
                    .overlay(
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
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                
                                Button(confirmButtonLabel) {
                                    confirmAction()
                                }
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                            }
                        }
                    )
                    .shadow(radius: 5) // Shadow
                Spacer()
            }
            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
        }
    }
}
