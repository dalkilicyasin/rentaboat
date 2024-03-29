//
//  MainPAgeView.swift
//  rentaboat
//
//  Created by yasin on 14.03.2024.
//

import SwiftUI

struct MainPAgeView: View {
    @State private var gotoCustomerView: Bool = false
    @State private var currentIndex: Int = 0
    @State private var imageNameList: [String] = ["rent", "admin"]
    @State private var titleList: [String] = ["Customer", "Owner"]
    @GestureState private var  dragOffset: CGFloat = 0
    var body: some View {
        NavigationView {
            VStack{
                ZStack{
                    ForEach(0..<self.imageNameList.count, id: \.self){ index in
                        RentView(image: Image("\(imageNameList[index])"), title: "\(titleList[index])", action: {
                            if titleList[index].elementsEqual("Customer"){
                                self.gotoCustomerView.toggle()
                            }
                           
                        })
                        .frame(width: 300, height: 100)
                        .opacity(currentIndex == index ? 1.0 : 0.5)
                        .scaleEffect(currentIndex == index ? 1.2 : 0.8)
                        .offset(x: CGFloat(index - currentIndex) * 300 + dragOffset, y: 0)
                    }
                    NavigationLink(destination: CustomerMainPageView(viewModel: CustomerPageViewModel()), isActive: $gotoCustomerView) {
                        EmptyView()
                    }
                }.gesture(
                    DragGesture()
                        .onEnded({ value in
                            let treshhold: CGFloat = 50
                            if value.translation.width > treshhold {
                                withAnimation {
                                    currentIndex = max(0, currentIndex - 1)
                                }
                            }else if  value.translation.width < -treshhold {
                                withAnimation {
                                    currentIndex = min(2 - 1, currentIndex + 1)
                                }
                            }
                        })
                )
            }
        }
    }
}

#Preview {
    MainPAgeView()
}



