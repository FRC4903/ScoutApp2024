# Scouting App for 2024 FRC CRESCENDO

The **Scouting App** is a mobile application built using Flutter for Android. It is a tool for collecting and managing scouting data during FRC matches. The app is organized into five pages, each corresponding to a different stage of the game: Pre-Match, Autonomous, Teleop, Endgame, and Post-Match.

## Features

- **QR Code Generation**: The app dynamically generates QR codes containing relevant match data.
- **Page Navigation**:
    - Swipe between pages to record data for different match phases.
    - Each page captures specific metrics related to the corresponding game stage.

## Dependencies

Make sure you have the following dependencies installed:

- **desktop_window**: Allows for window management and resizing.
- **flutter**: The core Flutter framework.
- **flutter_phoenix**: Provides hot-reloading capabilities for Flutter apps.
- **qr_flutter**: Enables QR code generation.
- **flutter_launcher_icons**: Customizes app icons for different platforms.
- **cupertino_icons**: Provides Cupertino-style icons for iOS.

## Installation

1. Ensure you have Flutter set up on your development environment.
2. Clone this repository to your local machine.
3. Install the required dependencies using Flutter:

    ```bash
    flutter pub get
    ```

## Usage

1. Run the app on an Android emulator or physical device.
2. Navigate through the different pages (Pre-Match, Autonomous, Teleop, Endgame, Post-Match) to input relevant data.
3. The QR code will be dynamically generated on the last page.
4. Scan the QR code to transfer the data to your scouting database or repository.

## Authors

Made by Mathew, Gurdit, Divyam, Ali

## TO DO
- [ ] Learn how to code
- [x] Figure out how to switch through multiple slides
- [x] Work on text input and printing out info
- [x] Understand the data sending process
- [x] Figure out how a QR Code is formed and displayedSoft 
- [x] Add all the buttons/GUI elements (checkboxes, text input, etc)
- [x] Format and design everything
- [x] Finish all the pages
- [x] Make it look real nice
- [x] Make more TODOs

