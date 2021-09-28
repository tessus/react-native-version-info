# react-native-version-info

[![npm](https://img.shields.io/npm/v/react-native-version-info.svg?style=flat&colorB=CB3837)](https://www.npmjs.com/package/react-native-version-info)
![Build Status](https://github.com/tessus/react-native-version-info/actions/workflows/node.js.yml/badge.svg)

<!--
![Downloads per month](https://img.shields.io/npm/dm/react-native-version-info.svg?colorB=blue)
![Downloads total](https://img.shields.io/npm/dt/react-native-version-info.svg?colorB=blue)
-->

Returns `CFBundleShortVersionString`, `CFBundleVersion`, and `CFBundleIdentifier` on iOS. For Android, returns `versionName`, `versionCode`, and `applicationId`. For Windows, returns the `version` properties `major, minor, and build` numbers as the appVersion, the `revision` number as the buildVersion, and the `name` property as the bundleIdentifier.

|                  | Android         | iOS                          | Windows              | Example            |
| ---------------- | --------------- | ---------------------------- | -------------------- | ------------------ |
| appVersion       | `versionName`   | `CFBundleShortVersionString` | `Identity[version]`  | `1.0.2`            |
| buildVersion     | `versionCode`   | `CFBundleVersion`            | `Identity[revision]` | `42`               |
| bundleIdentifier | `applicationId` | `CFBundleIdentifier`         | `Identity[name]`     | `com.foo.bar.MyApp`|

## Installation

Using npm:

```shell
npm install react-native-version-info
```

or using yarn:

```shell
yarn add react-native-version-info
```

## Linking

### Automatic

```shell
react-native link react-native-version-info
```

**iOS:** If you are using pods in your project, don't forget to run `pod update`.

### Manual

#### Android

1. In your android/settings.gradle file, make the following additions:

	```java
	include ':react-native-version-info'
	project(':react-native-version-info').projectDir = new File(rootProject.projectDir, '../node_modules/react-native-version-info/android')
	```

2. In your android/app/build.gradle file, add the `:react-native-version-info` project as a compile-time dependency:

	```java
	...
	dependencies {
	    ...
	    implementation project(':react-native-version-info')
	}
	```

3. Update the MainApplication.java file to use `react-native-version-info` via the following changes:

	```java
	import cx.evermeet.versioninfo.RNVersionInfoPackage;

	public class MainApplication extends Application implements ReactApplication {

	    private final ReactNativeHost mReactNativeHost = new ReactNativeHost(this) {
	        ...
	        @Override
	        protected List<ReactPackage> getPackages() {
	            return Arrays.<ReactPackage>asList(
	                    new MainReactPackage(),
	                    new RNVersionInfoPackage(), // here
	            );
	        }
	    };
	    ...
	}
	```

#### iOS

In XCode, in the project navigator:

- Right click _Libraries_
- Add Files to _[your project's name]_
- Go to `node_modules/react-native-version-info/ios`
- Add the `.xcodeproj` file

In XCode, in the project navigator, select your project.

- Add the `libRNVersionInfo.a` (in subdir `Products`) from the _VersionInfo_ project to your project's _Build Phases ➜ Link Binary With Libraries_ (Note: the library file does not exist yet, thus it will show up as red.)
- Click the `.xcodeproj` file you added before in the project navigator and go the _Build Settings_ tab. Make sure _All_ is toggled on (instead of _Basic_). Look for _Header Search Paths_ and make sure it contains both `$(SRCROOT)/../react-native/React` and `$(SRCROOT)/../../React`

#### Windows

1. In your `windows/{app_name}/MainReactNativeHost` file add the `RNVersionInfo` package to the package list:

	```c#
	using cx.evermeet.versioninfo;
	...
	protected override List<IReactPackage> Packages => new List<IReactPackage>
	{
	    ...
	    new RNVersionInfoPackage(),
	};
	```

2. Add `RNVersionInfo` to your solution

3. Add `RNVersionInfo` to your ReactNative project's references

For a step by step guide visit:
https://github.com/Microsoft/react-native-windows/blob/master/docs/LinkingLibrariesWindows.md

## Changelog

A Changelog is included in the package, but also [available for viewing](https://github.com/tessus/react-native-version-info/blob/master/CHANGELOG.md) in the repo on GitHub.

## FAQ

### Why the jump from version `0.6.2` to `1.0.0`?

The package is considered stable. To follow the [semantic versioning](https://semver.org/) specification the version had to be set to `1.0.0`.

### Why does Automatic Linking not work for iOS?

It does. However, please be aware of the following (from the [react-native documentation](https://facebook.github.io/react-native/docs/linking-libraries-ios#automatic-linking)): *If your iOS project is using CocoaPods (contains Podfile) and linked library has podspec file, then react-native link will link library using Podfile.*
In such a case, don't forget to run `pod update`.

## Usage

```javascript
import VersionInfo from 'react-native-version-info';

console.log(VersionInfo.appVersion);
console.log(VersionInfo.buildVersion);
console.log(VersionInfo.bundleIdentifier);
```

## License

MIT
