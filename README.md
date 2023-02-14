This package help with network connectivity and configure themselves accordingly. It can distinguish between cellular vs WiFi connection.

## Features

- Check network connectivity.
- Customize the offline widget.
- Disable Interaction option while device is offline.

## Getting started

you need to import the package into your project and wrap the widget with ConnectivityWrapper widget.

## Usage

TODO: You can find the code snippet in to `/example` folder project.

```dart
ConnectivityWrapper(
        disableInteraction: true,
        offlineWidgetTextAlign: TextAlign.center,
        offlineWidgetColor: Colors.amber,
        offlineWidgetMessageStyle:
            const TextStyle(color: Colors.black54, fontSize: 18),
        containerAlignment: Alignment.topCenter,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              print('Pressed');
            },
            child: const Text('submit'),
          ),
        ),
      ),
```

