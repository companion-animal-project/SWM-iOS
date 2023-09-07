//
//  DdungjaApp.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/19.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import Swinject

@main
struct DdungjaApp: App {
    
    private let injector: Injector
    private let viewResolver: ViewResolver
    @ObservedObject private var coordinator: Coordinator
    @State private var showLaunchView = true
    
    init() {
        injector = DependencyInjector(container: Container())
        viewResolver = ViewResolver(injector: injector)
        coordinator = Coordinator(.login, injector)
        injector.assemble([DomainAssembly(),
                           DataAssembly(),
                           PresentationAssembly(coordinator: coordinator)
                          ])
    
        let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_API_LOGIN_KEY"] ?? ""
    
        // Kakao SDK 초기화
        KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
        
        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = UIColor(Color.main)
    }
    
    var body: some Scene {
        WindowGroup {
            // onOpenURL()을 사용해 커스텀 URL 스킴 처리
//            LoginView().onOpenURL(perform: { url in
//                print("url is here: \(url)")
//                if (AuthApi.isKakaoTalkLoginUrl(url)) {
//                    AuthController.handleOpenUrl(url: url)
//                }
//            })
//            NavigationStack {
//                UserProfileView(viewModel: injector.resolve(UserProfileViewModel.self))
//                LoginView()
//                    .navigationBarHidden(true)
//            }
            ZStack {
                NavigationStack(path: $coordinator.path) {
                    coordinator.initScene()
                        .navigationDestination(for: Page.self) { page in
                            coordinator.make(page)
                        }
                }
                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2)
            }
//            viewResolver.resolveView(LoginView.self)
//            DdungjaTabView(coordinator: Coordinator.instance, viewResolver: viewResolver)
//            NavigationView {
//                List {
//                    NavigationLink("프로필", destination: UserProfileView(viewModel: injector.resolve(UserProfileViewModel.self)))
//                        .toolbarRole(.editor)
//                }
//            }
        }
    }
}
