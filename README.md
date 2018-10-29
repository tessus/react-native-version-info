# react-native-version-info

[![npm](https://img.shields.io/npm/v/react-native-version-info.svg?style=flat&colorB=CB3837)](https://www.npmjs.com/package/react-native-version-info)
[![Build Status](https://travis-ci.org/tessus/react-native-version-info.svg?branch=master)](https://travis-ci.org/tessus/react-native-version-info)

<!--
<img src="https://img.shields.io/npm/dm/react-native-version-info.svg" />
<img src="https://img.shields.io/npm/dt/react-native-version-info.svg" />
-->

Returns `CFBundleShortVersionString`, `CFBundleVersion`, and `CFBundleIdentifier` on IOS. For Android, returns `versionName`, `versionCode`, and `applicationId`.

|                  | Android         | iOS                          | Example            |
| ---------------- | --------------- | ---------------------------- | ------------------ |
| appVersion       | `versionName`   | `CFBundleShortVersionString` | `1.0.2`            |
| buildVersion     | `versionCode`   | `CFBundleVersion`            | `42`               |
| bundleIdentifier | `applicationId` | `CFBundleIdentifier`         | `com.foo.bar.MyApp`|

## Installation

Using npm:

```shell
npm install react-native-version-info
```

or using yarn:

```shell
yarn add react-native-device-info
```

## Linking

### Automatic

```shell
react-native link react-native-version-info
```

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
	    compile project(':react-native-version-info')
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

## Usage

```javascript
import VersionInfo from 'react-native-version-info';

console.log(VersionInfo.appVersion);
console.log(VersionInfo.buildVersion);
console.log(VersionInfo.bundleIdentifier);
```

## License

MIT
