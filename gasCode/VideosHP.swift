import SwiftUI

struct VideosHP: View {
    var body: some View {
        ZStack{
            Color("backgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    VStack {
                        Text("Learn")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.leading, -70.0)
                            .offset(y: -50)
                        
                        Text("Introduce Tutorial")
                            .font(.title2)
                            .fontWeight(.light)
                            .padding(.leading, 20.0)
                            .offset(y: -43)
                    }
                    Spacer()
                    Image("Profile")
                        .padding()
                        .offset(y: -43)
                }
                Image("VideoThumbnail_1")
                    .cornerRadius(20)
                    .frame(width: 363, height:213)
                    .offset(y:-33)
                Text("New")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .offset(y:-23)
                Image("BINUSTVBanner")
                    .cornerRadius(20)
                    .frame(width: 361, height:237)
                    .offset(y: -11)
            }
//            Image(systemName: "video")
//                .foregroundColor(Color.white)
//                .font(.system(size: 100.0))
        }
    }
}

struct VideosHP_Previews: PreviewProvider {
    static var previews: some View {
        VideosHP()
    }
}
