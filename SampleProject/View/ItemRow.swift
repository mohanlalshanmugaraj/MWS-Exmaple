//
//  ItemRow.swift
//  SampleProject
//
//  Created by Ajaaypranav R K on 29/10/22.
//

import SwiftUI

struct ItemRow: View {
    
    @State var mws : MWSModel
    var body: some View {
        VStack {
            
            AsyncImage(
                url: URL(string: mws.image_link),
                content: { image in
                    image .resizable()
                        .frame(maxWidth:.infinity,alignment: .center)
                        .frame(height:350)
                },
                placeholder: {
                    ProgressView()
                }
            )
           // Image(systemName: "arrow.down.doc.fill")
               
            VStack (alignment:.leading,spacing: 10){
                Text(mws.name)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .lineLimit(1)
                Text(mws.brand)
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                Text("$\(mws.price)")
                    .font(.title2)
                    .font(.system(size: 16))
                HStack {
                    Text(mws.description)
                        .lineLimit(1)
                        .font(.system(size: 16))
                        .padding(.trailing,30)
                    Text("More")
                        .padding(5)
                        .foregroundColor(.white)
                        .background(.gray)
                        .cornerRadius(5)
                    
                }
               
            }
            .frame(maxWidth:.infinity,alignment: .center)
            .frame(width:250)
        }.padding([.leading,.trailing])
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(mws: MWSModel(id: 495, brand: "maybelline", name: "Maybelline Face Studio Master Hi-Light Light Booster Bronzer", price: 14.99, image_link: "https://d3t32hsnjxo7q6.cloudfront.net/i/991799d3e70b8856686979f8ff6dcfe0_ra,w158,h184_pa,w158,h184.png", description: "Maybelline Face Studio Master Hi-Light Light Boosting bronzer formula has an expert \nbalance of shade + shimmer illuminator for natural glow. Skin goes \nsoft-lit with zero glitz.\n\n\t\tFor Best Results: Brush over all shades in palette and gently sweep over \ncheekbones, brow bones, and temples, or anywhere light naturally touches\n the face.\n\n\t\t\n\t\n\n", rating: 5))
    }
}
