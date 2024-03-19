## Introduction

- This project is created to discuss the string catalog usage in a Swift package and an app target.
- An app using this package is created inside DiscussStringCatalogAppUsingPackage. You can use it for reproduction of the problem.
- Xcode Version 15.3 (15E204a)
- macOS 14.4 (23E214)

## Scenario One: The Swift package has a string catalog and the app target does not

- The target in the Package.swift file has `resources: [.process("Resources")]`. This Resources folder has a string catalog.
- The string catalog is correctly populated by the compiler
- The German translations are added to the catalog
- One of the Text views is using Bundle.module to see if it works 
    - `Text("this text has a German translation in the catalog", bundle: .module)`
- The scheme run options is changed to German
- On the UI I see English text
- Xcode shows the following warning

```console
ERROR: this text has a German translation in the catalog 
not found in table Localizable of bundle CFBundle 0x6000024f5a40 
<~/Library/Developer/Xcode/DerivedData/DiscussStringCatalogAppUsingPackage-djgqsvpidusfvabiivpoothnzbus/Build/Products/Debug/DiscussStringCatalogAppUsingPackage.app/Contents/Resources/DiscussionStringCatalogPackage_DiscussionStringCatalogPackage.bundle> 
(not loaded)
```

- I open the contents of the `DiscussionStringCatalogPackage_DiscussionStringCatalogPackage.bundle` in Finder, I can see the following structure

```
- Contents
    - Resources
        - de.lproj
            - Localizable.strings
```

- The Localizable.strings file has the German translations:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Hello, world!</key>
    <string>Hallo, Welt!</string>
    <key>This is a text originally written in English</key>
    <string>Dieser Text wurde ursprünglich auf Englisch verfasst.</string>
    <key>this text has a German translation in the catalog</key>
    <string>dieser Text hat eine deutsche Übersetzung im Katalog</string>
</dict>
</plist>
```

- For the text that doesn't have bounded medial ex cot shows this warning

```console
ERROR: Hello, world! 
not found in table Localizable of bundle CFBundle 0x600002c5c000 
</Users/atacan/Library/Developer/Xcode/DerivedData/DiscussStringCatalogAppUsingPackage-djgqsvpidusfvabiivpoothnzbus/Build/Products/Debug/DiscussStringCatalogAppUsingPackage.app> 
(executable, loaded)
```

- The difference is that it looks at the app bundle instead of the package bundle as above, which is fine.

## Scenario Two: The Swift package and the app have a string catalog

- The same result as Scenario One

## Screenshots

