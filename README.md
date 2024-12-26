## AutoHotkey Keyboard Language Switcher

This repository contains an AutoHotkey script that automatically switches your keyboard language based on the active application. It is designed to streamline your workflow by ensuring that your keyboard layout is always set to the most appropriate language for the task at hand.

### Features

    Automatic Language Switching: The script automatically switches between languages (e.g., English and Persian) based on the active window's title.
    Easy to Customize: You can easily modify the script to work with other languages or applications.
    Seamless Experience: Switch languages without the need for manual input, saving you time and effort.

### Prerequisites

Before using this script, you need to have the following installed on your system:

    AutoHotkey v2.x: A powerful scripting language for automating tasks on Windows.
        Download AutoHotkey
    Keyboard Languages: This script works with any two languages you prefer. By default, it supports English and Persian.

### Installation

    Download AutoHotkey:
        Download and install AutoHotkey from here.

    Clone the Repository: Clone this repository to your local machine using Git:

    git clone https://github.com/ghorbani-mohammad/windows-auto-language-switcher/.git

    Run the Script:
        Open the cloned folder and find the keyboard_language_switcher.ahk file.
        Right-click the file and choose Run Script.
        The script will now be running in the background, automatically switching the language when you switch between applications.

### Customization

You can customize the script to support additional languages or applications by editing the LanguageSwitcher.ahk file.

    Changing the Languages: Modify the language codes for English and Persian in the script.
        For English, use "English".
        For Persian, use "Persian".
    Adding More Applications: The script checks the window title to determine the active application. You can add specific application names by modifying the WinGetTitle("A") condition.

### Example Usage

The script works as follows:

    If you are in an application where English is preferred (e.g., Notepad), it will automatically switch the keyboard layout to English.
    If you switch to an application that uses Persian (e.g., a Persian text editor), the script will automatically switch the keyboard layout to Persian.

### Troubleshooting

    Language Switch Not Working: Make sure that your system has the required keyboard layouts installed. You can add additional layouts in the Windows settings.
    Application Detection: If the script doesn't detect a certain application correctly, ensure that the window title is unique enough to distinguish between different programs.

### Contributing

Feel free to contribute to this project! If you find any bugs or have ideas for improvement, you can open an issue or submit a pull request.
License

This project is licensed under the MIT License - see the LICENSE file for details.
