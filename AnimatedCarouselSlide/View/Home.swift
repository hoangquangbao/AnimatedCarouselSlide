//
//  Home.swift
//  AnimatedCarouselSlide
//
//  Created by Quang Bao on 30/12/2021.
//

import SwiftUI

struct Home: View {
    
    //MARK: Current Index
    @State var currentIndex: Int = 0
    
    //Animation Properties
    @State var bgOffset: CGFloat = 0
    @State var textColor: Color = .white
    
    var body: some View {

        VStack{

            let isSmallDevice = getRect().height < 750
            
            Text(foods[currentIndex].itemTitle)
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 100, alignment: .top)
                .padding(.top)

            //MARK: Food Details With Image
            HStack(spacing: 15){
                
                VStack(alignment: .leading, spacing: 25){
                    
                    Label{
                        Text("1 Hour")
                    } icon: {
                        Image(systemName: "flame")
                            .frame(width: 30)
                    }
                    
                    Label{
                        Text("40")
                    } icon: {
                        Image(systemName: "bookmark")
                            .frame(width: 30)
                    }
                    
                    Label{
                        Text("Easy")
                    } icon: {
                        Image(systemName: "bolt")
                            .frame(width: 30)
                    }
                    
                    Label{
                        Text("Safety")
                    } icon: {
                        Image(systemName: "safari")
                            .frame(width: 30)
                    }
                    
                    Label{
                        Text("Healthy")
                    } icon: {
                        Image(systemName: "drop")
                            .frame(width: 30)
                    }

                }
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)

                //MARK: Food Image
                GeometryReader{proxy in
                    
                    let size = proxy.size
                    
                    Image(foods[currentIndex].itemImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                    //MARK: Circle Semi Border
                        .background(
                            
                            Circle()
                                .trim(from: 0.5, to: 1)
                                .stroke(
                                    
                                    LinearGradient(colors: [textColor,textColor.opacity(0.1),textColor.opacity(0.1)], startPoint: .top, endPoint: .bottom)
                                    ,lineWidth: 0.7
                                )
                                .padding(-15)
                                .rotationEffect(.init(degrees: -90))
                        )
//                        .frame(width: size.width, height: size.width * (isSmallDevice ? 1.5 : 1.8))
//                        .frame(maxHeight: .infinity, alignment: .center)
//                        .offset(x: 70)
                }
//                .frame(height: (getRect().width / 2) * (isSmallDevice ? 1.6 : 2))
                .frame(height: (getRect().width))

            }
            
            //MARK: Food Description
            Text("Buffalo Chicken Bites have the most tender, juicy meat, coated in Frank’s hot sauce and fried to perfection before dipping either in blue cheese or ranch. Adults and kids agree that this is a family favorite appetizer!")
                .font(.callout)
                .foregroundStyle(.secondary)
                .lineLimit(3)
                .lineSpacing(8)
                .padding(.vertical)
        }
        .padding()
        .foregroundColor(textColor)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            
            GeometryReader{ proxy in

                let height = proxy.size.height

                LazyVStack(spacing: 0){

                    ForEach(foods.indices, id: \.self){ index in

                        if index % 2 == 0{
                            Color("BG")
                                .frame(height: height)
                        } else {
                            Color.white
                                .frame(height: height)
                        }
                    }
                }
                .offset(y: bgOffset)
            }
                .ignoresSafeArea()
        )
        .gesture(
            
            DragGesture()
                .onEnded({ value in
                    
                    let translation = value.translation.height
                    
                    if translation < 0 && -translation > 50 && (currentIndex < (foods.count - 1)){
                        //MARK: Swiped Up
                        withAnimation(.easeInOut(duration: 0.6)){
                            bgOffset += -getRect().height
                        }
                        
                        //Changing Text Color After Some time
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                            
                            //Updating Index
                            currentIndex += 1
                            
                            withAnimation(.easeInOut){
                                //Automatic Change
                                textColor = (textColor == .black ? .white : .black)
                            }
                        }
                    }
                    
                    if translation > 0 && translation > 50 && currentIndex > 0{
                        //MARK: Swiped Down
                        withAnimation(.easeInOut(duration: 0.6)){
                            bgOffset += getRect().height
                        }
                        
                        //Changing Text Color After Some time
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                            
                            //Updating Index
                            currentIndex -= 1
                            
                            withAnimation(.easeInOut){
                                //Automatic Change
                                textColor = (textColor == .black ? .white : .black)
                            }
                        }
                    }
                })
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            //.previewDevice("iPhone 8")
            //.previewDevice("iPhone 12 Pro Max")
            //.previewDevice("iPhone 13 Pro Max")

    }
}

extension View{
    //MARK: Screen Size
    func getRect()->CGRect {
        return UIScreen.main.bounds
    }
}
