//
//  CustomerMainPage.swift
//  rentaboat
//
//  Created by yasin on 18.03.2024.
//

import SwiftUI

struct CustomerMainPageView: View {
    @State private var currentDate = Date.now
    @ObservedObject var viewModel: CustomerPageViewModel
    @State var presentedAsModal: Bool = false
    @State var presentedAsModalTown: Bool = false
    @State var selectedCity: String = "Please Select City"
    @State var selectedTown: String = "Please Select Town"
    @State var navigateListView: Bool = false
    
    init(viewModel: CustomerPageViewModel){
        self.viewModel = viewModel
    }
    
    var body: some View {
    
            ZStack {
                VStack {
                    Text("\(viewModel.selectedCity)")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 40)
                        .padding(10)
                        .foregroundColor(.black)
                        .background(.white)
                        .cornerRadius(5)
                        .onTapGesture {
                            self.presentedAsModal.toggle()
                        }.sheet(isPresented: $presentedAsModal, content: {
                            ListView(cityList: viewModel.cityList, selectedCity: $selectedCity) {
                                self.viewModel.selectedCity = selectedCity
                                self.viewModel.getTownList(selectedCity)
                            }
                        })
                      
                    Text("\(viewModel.selectedTown)")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 40)
                        .padding(10)
                        .foregroundColor(.black)
                        .background(.white)
                        .cornerRadius(5)
                        .onTapGesture {
                        self.presentedAsModalTown.toggle()
                    }.sheet(isPresented: $presentedAsModalTown, content: {
                        if selectedCity.isEmpty {
                            EmptyView()
                        }else {
                            ListView(cityList: self.viewModel.townList, selectedCity: $selectedCity) {
                                self.viewModel.selectedTown = selectedCity
                            }
                        }
                    })
                        HStack {
                            DatePicker("Select Tour Date", selection: $currentDate, in:Date.now..., displayedComponents: .date)
                                .background(.clear)
                                .foregroundColor(.black)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .cornerRadius(10)
                                .padding(10)
                        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                            .frame(height: 60)
                            .background(.windowBackground)
                            .cornerRadius(5)
                    Button {
                        guard viewModel.selectedTown != "Select Town" else {return}
                        self.navigateListView.toggle()
                    } label: {
                        Text("Search Tour")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                                .frame(height: 60)
                                .background(.blue)
                                .cornerRadius(5)
                                .font(.headline)
                    }
                    
                    NavigationLink(destination: TourListView(viewModel: TourListVieModel()), isActive: $navigateListView) {
                        EmptyView()
                    }

                }.frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.clear)
                .padding(20)
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(.white)
                .background(
                    Image("fethiye")
                        .resizable()
                        .ignoresSafeArea()
                ).onAppear{
                    self.viewModel.getCityList()
                }
           
    }
}

#Preview {
    CustomerMainPageView(viewModel: CustomerPageViewModel())
}
