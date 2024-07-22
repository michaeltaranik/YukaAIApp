//
//  CustomButton.swift
//  YukaAI
//
//  Created by Michael Taranik on 19.07.2024.
//

import SwiftUI


class ProductViewModel: ObservableObject {
    
    @Published var animate = 0
    @Published var approved = true
    @Published var icon = ""
    @Published var text = "Show Image!"
    @Published var foreColor = Color(.darkGrey)
    @Published var backColor = Color(.lightGrey)
    
    
    func approveButton(approve: Bool) {
        self.icon = approve ? "checkmark.circle.fill" : "xmark.circle.fill"
        self.text = approve ? "Approved" : "Declined"
        self.foreColor = Color(approve ? .darkGreen : .darkRed)
        self.backColor = Color(approve ? .lightGreen : .lightRed)
        self.approved = !approve
        self.animate += 1
    }
    
    
}

struct ProductUIView: View {
    
    @StateObject private var vm = ProductViewModel()
    @StateObject private var dataManager = DataManager()
    
    
    var body: some View {
        HStack {
            Image(systemName: vm.icon)
            Text(vm.text)
        }
        .frame(width: 200, height: 100)
        .background(vm.backColor)
        .foregroundColor(vm.foreColor)
        .font(.system(size: 25, weight: .semibold))
        .cornerRadius(20)
        .shadow(radius: 10)
        .onTapGesture {
            vm.approveButton(approve: vm.approved)
            dataManager.fetchData(barcode: "7613269250685")
        }
        .symbolEffect(.pulse, value: vm.animate)
    }
    
    
}


#Preview {
    ProductUIView()
}
