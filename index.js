/**
 * @providesModule react-native-version-info
 */
import { NativeModules } from 'react-native';

const { RNVersionInfo } = NativeModules;

type VersionObject = {
  appVersion: ?string,
  buildVersion: ?string,
  bundleIdentifier: ?string
};

const VersionInfo: VersionObject = {
  appVersion: RNVersionInfo && RNVersionInfo.appVersion,
  buildVersion: RNVersionInfo && RNVersionInfo.buildVersion,
  bundleIdentifier: RNVersionInfo && RNVersionInfo.bundleIdentifier
};

export default VersionInfo;
