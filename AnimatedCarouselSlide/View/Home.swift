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
    
    var body: some View {

        VStack{

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
                }
            }
        }
        .padding()
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BG"))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension View{
    //MARK: Screen Size
    func getRect()->CGRect {
        return UIScreen.main.bounds
    }
}
