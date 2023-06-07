//
//  WeatherView.swift
//  HavaDurumu
//
//  Created by Göktug Yeşil on 25.05.2023.
//

import SwiftUI

struct WeatherView: View {
    
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack (alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("Bugün , \(Date().formatted(.dateTime .month() . day() .minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack (spacing: 20) {
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike
                            .roundDouble() + "°")
                        .font(.system(size:100))
                        .fontWeight(.bold)
                        .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    Image("city")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350)
                    
                    Spacer()
                    
                }.frame(maxWidth: .infinity)
                
            }.padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            VStack {
                Spacer()
                
                VStack (alignment: .leading, spacing: 20) {
                    
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)
                    
                    HStack{
                        WeatherRow(logo: "thermometer", name: "En yüksek sıcaklık", value: (weather.main.tempMin.roundDouble() + "°"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "wind", name: "Rüzgar hızı", value: (weather.wind.speed.roundDouble() + " m/s"))
                    }
                    
                    HStack{
                        
                        WeatherRow(logo: "thermometer", name: "Maksimum sıcaklık", value: (weather.main.tempMax.roundDouble() + "°"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "humidity", name: "Nem Oranı", value: (weather.main.humidity.roundDouble() + " %"))
                    }
                        
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.bottom, 20)
                    .foregroundColor(Color(hue: 0.522, saturation: 0.993, brightness: 0.408))
                    .background(.white)
                    .cornerRadius(20, corners: [.topLeft,.topRight])
            }
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.522, saturation: 0.993, brightness: 0.408))
        .preferredColorScheme(.dark)
        
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
