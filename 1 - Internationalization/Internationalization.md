# Intro
---
# Demo 1

## Run the App
**Jessy 😺**  
We'll be using an app called *MyFriend*, in which you can carry out conversations with your very own virtual friend. The app, as it stands, is fine if you are an English speaker, but what about those who speak other languages? 

**Catie 🐸**  
Of course they should **not** be deprived of their very own virtual friend just because they were born in a non-English speaking country!

Internationalization to the rescue!

## Storyboard
> Show the storyboard in the project so that the users can see that UI elements do not have explicit heights. Demonstrate how the UI adjusts to the longer text by switching to the Assistant Editor, setting it to Preview mode and then selecting one of the pseudo language options from the menu at the bottom right corner (it should normally say English).

**Jessy 😺**  
The first step in the Internationalization process is to get your app ready to support text of any length. If you use storyboards for your UI, then this is very easy. You just have to make sure that:

1. Your user interface elements use Auto Layout.
2. The UI elements do not have hardcoded heights or widths. 

**Catie 🐸**  
If you do those two things, then your UI should automatically adjust to the text no matter how long (or short) the text happens to be.

---
# Interlude 1
---
# Demo 2
## Storyboard & ViewController.swift
> Show the values in the storyboard and in the code, especially the array of responses at the top of ViewController.swift

**Jessy 😺**  
Some of the text are in the storyboard, and some is mixed with the Swift code. In this app, all of it's in English.

**Catie 🐸**  
Having hardcoded strings is bad if you want to display text in different languages. You need a way to extract these strings so that you can translate the values for the various languages your app will support.

## Storyboard
For a storyboard, this is simple enough to do. Xcode can be very helpful here. Just open it, switch to the **File inspector**, and then under the **Localization** section, check the box next to **English**. Make sure that the value next to English says **Localizable Strings**. 

This will ensure that Xcode extracts all string values used in the storyboard into a separate file so that you can translate the values depending on the language.

**Jessy 😺**   
After doing that, if you go to the **Project navigator**, you should see that your storyboard will have a disclosure triangle. Expand that. 

You should see **Main.storyboard (Base)** and  **Main.strings (English)**.

## Main.strings (English)
The Main.strings (English) file contains the English translations for the text values used in the storyboard. You can edit this file to change the English language strings if you want to!

---
# Interlude 2
---
## Demo 3

**Catie 🐸**  
> Show how to replace a string by enclosing it in a call to `NSLocalizedString`.

To support multiple languages via code, you need to create `NSLocalizedString`s. Its simplest initializer takes two arguments. The first, called "key", is the string to be translated. The second is a comment about the key. We'll get to the significance of that shortly.

For now, to use these arguments to support multiple languages, we'll have to generate a list of localizable text strings.

---
# Interlude 3
---



## Demo 5

Localizable text strings are a list of text values used in your code that can be translated to other languages - similar to how it worked for the storyboard. Unfortunately, there is no way to generate this list from within the Xcode GUI. You have to use the command line for this.

> Open Terminal and navigate to your project folder using the `cd` command. (You have to be within the MyFriend folder inside the root MyFriend folder for the project - in my case the path was - ~/Code/RayWenderlich/Videos/Projects/MyFriend/MyFriend)

Then type the following at the command prompt:

```none
genstrings *.swift -o en.lproj
```

This generates a file named Localizable.strings within the en.lproj folder. We used en.lproj here because English is our development language. You'd have to change the name according to the two-character language identifier for your development language.

If you are not sure about what the two-character identifier should be, look inside the **MyFriends** sub-folder under the project root. It should have a Base.lproj folder and another .lproj folder *after* you add support for your development language to the storyboard. That's the folder name you should pass to the `genstrings` command.

If you check the project in Xcode, you won't see the Localizable.strings file yet. You need to add it to the project now.

> Use the **Add Files to "MyFriend"…** menu option to add the Localizable.strings file and then in the **File inspector** check the  **Base** option under the **Localization** section.

Now the file is in your project and is ready for localization in the future.

If you check the contents of the file, you'll notice that each string from your code is represented as a pair of values separated by an equal (=) sign. Since the development language is English, both values are the same. If you were translating to another language, you would replace the text on the right of the equal sign with the translated text.

Remember not to change the text on the left since that string has to match what is in your code - the value passed to the `NSLocalizedString` method. You should change the value on the left of the equal sign only if you change it in your code as well. Otherwise, leave it alone.

And what about the comment parameter passed to `NSLocalizedString`? We said that the purpose of the comment will become clear later? See the comment above each string pair? That's the comment you passed in. It can be useful in giving instructions to the translator - for example, if you have a one word string like "fly" - the translator might not know whether you mean fly as in the insect or the action. The comments can be used to pass the translator information that will help them with their task.

---
# Conclusion 