//
//  ContentView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/19.
//

import SwiftUI

struct LoginView: View {
    @StateObject var kakaoAuthVM = KakakoAuthViewModel()
    
    let loginStatusInfo: (Bool) -> String = { isLoggedIn in
        return isLoggedIn ? "로그인 상태" : "로그아웃 상태"
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text(loginStatusInfo(kakaoAuthVM.isLoggedIn))
            Button {
                kakaoAuthVM.handleKakaoApi()
            } label: {
                Text("카카오 로그인")
            }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
