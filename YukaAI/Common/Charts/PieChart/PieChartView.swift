//
//  PieChartView.swift
//  ChartView
//
//  Created by András Samu on 2019. 06. 12..
//  Copyright © 2019. András Samu. All rights reserved.
//

import SwiftUI

public struct PieChartView : View {
    var data: [Double]
    var title: String
    var legend: String?
    var style: [Color]
    var gradients: [RadialGradient]
    var formSize:CGSize
    var dropShadow: Bool
    var valueSpecifier:String
    
    @State private var showValue = false
    @State private var currentValue: Double = 0 {
        didSet{
            if(oldValue != self.currentValue && self.showValue) {
                HapticFeedback.playSelection()
            }
        }
    }
    
    public init(data: [Double], title: String, legend: String? = nil, style: [Color], gradients: [RadialGradient], form: CGSize? = ChartForm.medium, dropShadow: Bool? = true, valueSpecifier: String? = "%.1f"){
        self.data = data
        self.title = title
        self.legend = legend
        self.style = style
        self.gradients = gradients
        self.formSize = form!
        if self.formSize == ChartForm.large {
            self.formSize = ChartForm.extraLarge
        }
        self.dropShadow = dropShadow!
        self.valueSpecifier = valueSpecifier!
    }
    
    public var body: some View {
        ZStack{
            Rectangle()
                .fill(.white)
                .cornerRadius(20)
                .shadow(color: .black, radius: self.dropShadow ? 12 : 0)
            VStack(alignment: .leading) {
                HStack {
                    if(!showValue){
                        VStack(alignment: .leading) {
                            Text(self.title)
                                .font(.headline)
                                .foregroundColor(.black)
                                .bold()
                            Text("This Week")
                                .foregroundStyle(.secondary)
                        }
                    } else{
                        Text("\(self.currentValue, specifier: self.valueSpecifier)")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Image(systemName: "chart.pie.fill")
                        .imageScale(.large)
                        .foregroundColor(.gray)
                }
                .padding()
                
                HStack {
                    PieChartRow(data: data, backgroundColor: self.style, accentColor: gradients, showValue: $showValue, currentValue: $currentValue)
                        .foregroundColor(.cyan)
                        .padding(self.legend != nil ? 0 : 12)
                        .offset(y:self.legend != nil ? 0 : -10)
                    VStack(alignment: .leading) {
                        HStack {
                            Circle()
                                .fill(.lightRed)
                                .frame(width: 10, height: 10)
                            Text("Bad")
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 30)
                        Text("42")
                        HStack {
                            Circle()
                                .fill(K.yellowOrangeGradient)
                                .frame(width: 10, height: 10)
                            Text("Poor")
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 30)

                        Text("52")
                        HStack {
                            Circle()
                                .fill(K.greenCyanGradient)
                                .frame(width: 10, height: 10)
                            Text("Excellent")
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 30)
                        Text("69")
                    }
                    Spacer()
                }
                if(self.legend != nil) {
                    Text(self.legend!)
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                }
                
            }
        }
        .frame(width: 350, height: 350)
    }
}

#if DEBUG
struct PieChartView_Previews : PreviewProvider {
    
    static let gradients: [RadialGradient] = [
        K.peachPinkGradient,
        K.greenCyanGradient,
        K.yellowOrangeGradient,
    ]
    
    static var previews: some View {
        PieChartView(
            data:[56,78,53],
            title: "Title",
            legend: "Legend",
            style: [.white, .white, .white],
            gradients: gradients)
    }
}
#endif
