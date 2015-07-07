![Gilt Tech logo](https://raw.githubusercontent.com/gilt/Cleanroom/master/Assets/gilt-tech-logo.png)

# CleanroomAppSettings

CleanroomAppSettings provides a set of interfaces and implementations to abstract away code dependence on a singleton `NSUserDefaults` instance.

CleanroomAppSettings is part of [the Cleanroom Project](https://github.com/gilt/Cleanroom) from [Gilt Tech](http://tech.gilt.com).


### Swift 2.0 compatibility

The `master` branch of this project is Swift 2.0 compliant and therefore **requires Xcode 7 beta 2 or higher to compile**.


### License

CleanroomAppSettings is distributed under [the MIT license](/blob/master/LICENSE).

CleanroomAppSettings is provided for your use—free-of-charge—on an as-is basis. We make no guarantees, promises or apologies. *Caveat developer.*


### Adding CleanroomAppSettings to your project

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

You'll need to [integrate CleanroomAppSettings into your project](https://github.com/emaloney/CleanroomAppSettings/blob/master/INTEGRATION.md) in order to use [the API](https://rawgit.com/emaloney/CleanroomAppSettings/master/Documentation/index.html) it provides. You can choose:

- [Manual integration](https://github.com/emaloney/CleanroomAppSettings/blob/master/INTEGRATION.md#manual-integration), wherein you embed CleanroomAppSettings's Xcode project within your own, **_or_**
- [Using the Carthage dependency manager](https://github.com/emaloney/CleanroomAppSettings/blob/master/INTEGRATION.md#carthage-integration) to build a framework that you then embed in your application.
 
Once integrated, just add the following `import` statement to any Swift file where you want to use CleanroomAppSettings:

```swift
import CleanroomAppSettings
```

## Using CleanroomAppSettings

For detailed information on using CleanroomAppSettings, [API documentation](https://rawgit.com/emaloney/CleanroomAppSettings/master/Documentation/index.html) is available.


## About

The Cleanroom Project is an experiment in re-imagining Gilt's iOS codebase in a legacy-free incarnation that embraces the latest Apple technology.

We'll be tracking the most up-to-date releases of Swift, iOS and Xcode, and we'll be [open-sourcing major portions of our code](https://github.com/gilt/Cleanroom#open-source-by-default) as we go.


### Contributing

CleanroomAppSettings is in active development, and we welcome your contributions.

If you’d like to contribute to this or any other Cleanroom Project repo, please read [the contribution guidelines](https://github.com/gilt/Cleanroom#contributing-to-the-cleanroom-project).


### Acknowledgements

[API documentation for CleanroomAppSettings](https://rawgit.com/emaloney/CleanroomAppSettings/master/Documentation/index.html) is generated using [Realm](http://realm.io)'s [jazzy](https://github.com/realm/jazzy/) project, maintained by [JP Simard](https://github.com/jpsim) and [Samuel E. Giddins](https://github.com/segiddins).

