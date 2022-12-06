import UIKit
import Flutter
import GoogleMaps
import KakaoSDKCommon

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      // Google Map Service
      GMSServices.provideAPIKey(Storage().googleMapApiKey)
      // Kakao Login API
      KakaoSDK.initSDK(appKey:Storage().kakaoLoginApiKey)
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
