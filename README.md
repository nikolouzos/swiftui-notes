
# SwiftUI Notes - A note-taking application

_A fun note-taking application built with SwiftUI and Firebase Firestore_

[![Build Status](https://app.bitrise.io/app/b7628e99a194aec0/status.svg?token=e3x-ClVKJ1Q6ulnsjLG70A)](https://app.bitrise.io/app/b7628e99a194aec0)

## Contents
* [Summary](#-summary)
* [How to build and run this app](#-how-to-build-and-run-this-app)
* [Tools used](#-tools-used)
* [CocoaPods dependencies](#-cocoapods-dependencies)

## Summary
This is a simple note-taking application that supports user accounts. Each user has their personal notes. They can add or edit any of their notes. Notes can be archived when their purpose has been fulfilled. You can see your archived notes and re-activate them. Notes can be edited by multiple users. You can invite a user to edit a note by entering their phone number. They will receive a notification with the option to accept or reject the invite.

### The notes
The notes can contain text or checklists. You can combine those two formats

## The challenge
Apart from this being a SwiftUI learning experience, I want to challenge myself to enforce 

## How to build and run this app

To run this app you will need MacOS 10.14+ (Mojave) and Xcode 11. To use the live preview feature of SwiftUI, you will need MacOS 10.15+ (Catalina). ~~Also, I am currently not uploading the `GoogleService-Info.plist` file, which is needed to configure the Firebase SDK, but you can download a demo file from [here ]()(Link not working yet).~~ 

Edit: I elected to add `GoogleService-Info.plist` to the project in the end. The file is not really protected, so there's no reason to not include it. The correct way to protect your project is to write correct rules and test them thoroughly.

### Steps to run the application

1. Clone the project.
2. Open a `Terminal` and navigate to the project directory.
3. Run `pod install` from the `Terminal`. (If you haven't installed Coocoapods you can get it from [here](https://cocoapods.org/)).
4. Pray Xcode doesn't explode.
5. Run the application.

## <a name="section2"></a> Tools used

The [SwiftUI](https://developer.apple.com/documentation/swiftui) framework was used to code this application. The [MVC (Model-View-Controller)](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller) architecture is followed _loosely_. To ensure the best coding practices and formatted are enforced, [SwiftLint](https://github.com/realm/SwiftLint) was used. For logging, I used [SwiftyBeaver](https://github.com/SwiftyBeaver/SwiftyBeaver). Also, [BitriseCI](https://bitrise.io) was used to run automated tests. The application was written using Xcode 11 beta 6, on MacOS Catalina (10.15) beta.

_Note: this application will ONLY work on iOS 13.0+, which is currently in beta_

## <a name="section3"></a> CocoaPods dependencies

| Library | Link |
| ------- | ---- |
| Firebase | [Link](https://github.com/firebase/firebase-ios-sdk)|
| SwiftyBeaver | [Link](https://github.com/SwiftyBeaver/SwiftyBeaver)|
| Crashlytics | [Link](https://fabric.io/kits/ios/crashlytics)|
| SwiftLint | [Link](https://github.com/realm/SwiftLint)|

_This list was last updated on 21st August 2019._
