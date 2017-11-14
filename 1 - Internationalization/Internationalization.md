# Intro

➠1 - Internationalization

👯JESSY😺 Hello, iOS developer friends! Jessy here!  
👯CATIE🐸 Catie *here*!  
👯JESSY😺 In this screencast, we are going to show you how to support multiple languages in your app.  
👯CATIE🐸 For that, there are two main things that you need to take care of: Internationalization and Localization.


➠😺JESSY😺  
Internationalization is the task of getting your app *ready* for supporting multiple languages. One thing this will involve is setting up Auto Layout so that your text will support strings of any length. You'll also extract text strings from your app so that text is not hardcoded. 


➠🐸CATIE🐸
Localization is the task of translating your app for a specific language or region.

In this screencast, we'll be covering only the Internationalization side of things. We'll cover Localization in another screencast.

➠Jessy and I give many thanks to Fahim Farook for putting together the materials we'll be using in this, and *that*, screencast!

---
# Demo 1

## Run the App
**Jessy 😺**  
We'll be using an app called *MyFriend*, made by Fahim, in which you can carry out conversations with your very own virtual friend. The app, as it stands, is fine if you are an English speaker, but what about those who speak other languages? 

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
➠🐸CATIE🐸  
As you see, the UI for *MyFriend* already uses Auto Layout, and so, does not need any further work. But if your app does not use Auto Layout, your first step in the quest for internationalization would be to add Auto Layout support. We have a couple of video courses on Auto Layout if you need to learn about it.

The next step is to go through your code and get any user-facing text ready for localization. 

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
➠😺JESSY😺  
All new Xcode projects are preconfigured to support internationalization. So, your storyboards always are set for Base internationalization, supporting the user's development language as the default language. In our case, the development language was English. For you, it might be something else.

After you've extracted the storyboard text, it's time to work with the strings in your Swift code!

---
## Demo 3

**Catie 🐸**  
> Show how to replace a string by enclosing it in a call to `NSLocalizedString`.

To support multiple languages via code, you need to create `NSLocalizedString`s. Its simplest initializer takes two arguments. The first, called "key", is the string to be translated. The second is a comment about the key. We'll get to the significance of that shortly.

For now, to use these arguments to support multiple languages, we'll have to generate a list of localizable text strings.

---
# Interlude 3

➠😺JESSY😺  
Localizable strings are a list of text values used in your code that can be translated to other languages - which is similar to what you saw with the storyboard. Unfortunately,

---

## Demo 5

**Catie 🐸**  
Open Terminal and navigate to your project folder using the `cd` command. For this app, it's the folder named MyFriend.
> do that  
>  (You have to be within the MyFriend folder inside the root MyFriend folder for the project - in my case the path was - ~/Code/RayWenderlich/Videos/Projects/MyFriend/MyFriend)

Then use the `genstrings` command:

```
genstrings *.swift -o en.lproj
```

That generates a file named Localizable.strings within the en.lproj folder. We used "en" here because English is our development language. Otherwise, you'd use a different two-character language identifier for *your* development language.

**Jessy 😺**   
If you are not sure about what the two-character identifier should be, look inside the **MyFriends** sub-folder under the project root. 

> show that for us.

It should have a Base.lproj folder and another .lproj folder *after* you add support for your development language to the storyboard. That's the folder name you should pass to the `genstrings` command.

**Catie 🐸**  
> Use the **Add Files to "MyFriend"…** menu option to add the Localizable.strings file and then in the **File inspector** check the  **Base** option under the **Localization** section.

If you check the project in Xcode, you won't see the Localizable.strings file yet. You still need to add it to the project. After you do that, your project will be ready for localization in the future.

##Localizable.strings
**Jessy 😺**  
If you check the contents of the file, you'll notice that each string from your code is represented as a pair of values separated by an equals sign. Since the development language is English, both values are the same. If you were translating to another language, you would replace the text on the right of the equals sign with the translated text.

**Catie 🐸**  
The string on the left has to match what's in your code: it's the "key" you passed to an `NSLocalizedString` initializer. So, only change it here if it gets changed in your code as well. 

**Jessy 😺**  
And, if you didn't notice by now, the "comment" arguments, to go with your keys, are now featured above the string pairs.

---
# Conclusion 
➠🐸CATIE🐸  
Comments can be useful for giving instructions to whoever's acting as your translator. For example, if you have a homonym, like "fly" - the translator might not know whether you mean the insect or the act of flying. A comment can clear that up.


➠Together

👯JESSY😺 That’s everything we'll cover in this screencast, on internationalization. Your project is now ready to be localized.  
👯CATIE🐸 By now you should have a good idea of how to take any iOS project and set it up for supporting multiple languages.  
👯JESSY😺  While this won't make you a suave international man (or woman) of mystery, it will certainly help you make an app that appeals to a lot more people since it will speak their language!  
👯CATIE🐸 Adios!  
👯JESSY😺 Ciao!
