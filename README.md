# asteroid-virtualkeyboard
Qt virtual onscreen keyboard for use with AsteroidOS

This is an alternative keyboard style that can be used on a watch.  Uncreatively, the style is called "watch" as compared with the two builtin styles which are "default" and "retro".  The two basic ways to invoke it are to either include code in your QML file to set this style:

```
    Component.onCompleted: {
        VirtualKeyboardSettings.styleName = "watch"
    }
```
Or one can export an environment variable:
```
export QT_VIRTUALKEYBOARD_STYLE=watch
```
