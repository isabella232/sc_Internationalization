# Screencast - Internationalization

## Introduction

**Jessy**  
Hello, iOS developer friends!  Jessy here!

**Catie**  
Catie *here*!

**Jessy**  
In this screencast, we're are going to show you how to support multiple languages in your app.

**Catie**  
For that, there two main things that you need to take care of - Internationalization and Localization. 


**Jessy**  
Internationlization is the task of getting your app ready for supporting multiple languages. That's where you do things such as setting up Auto Layout so that your text will support strings of any length and extracting text strings from your app so that text is not hardcoded. Localization is the actual task of translating your app for a specific language or region.

In this screencast, we'll be covering only the Internationalization side of things, but if you want to learn about Localization, we have a seprate screencast on that topic. So let's dive in!

## Demo 1

For this screencast, we'll be using an app called *MyFriend*. It's a virtual friend app where you can carry out conversations with your very own virtual friend. The app as it stands is fine if you are an English speaker, but what about those people who speak other languages? Should they be deprived of their very own virtual friend just because they were born in a non-English speaking country? 

Internationalization to the rescue!

The first step in the interanationalization process is to get your app ready to support text of any length. If you use storyboards for your UI, then this is very easy. You just have to make sure that:

1. Your user interface elements use Auto Layout .
2. The UI elements do not have hardcoded heights or widths. 

If you do those two things, then your UI should automatically adjust to the text no matter how long (or short) the text happens to be.

> Show the storyboard in the project so that the users can see that UI elements do not have explcit heights. Demonstrate how the UI adjuts to the longer text by switching to the Assistant Editor, setting it to Preview mode and then selecting one of the pseudo language options from the menu at the bottom right corner (it should normally say English).

## Interlude

As you see, the UI for *MyFriend* already uses Auto Layout and so does not need any further work. But if your app does not use Auto Layout, your first step in the quest for internationalization would be to add Auto Layout support. We have a couple of video courses on this very subject if you are interested to learn more.

The next step is to go through your code to extract the text displayed to the user. 

## Demo 2

Currently, the text strings displayed in the app are mixed with the code. Some of the text is displayed as strings added in your storyboards and some of the text is present in the code itself as English strings.

> Show the values in the storyboard and in the code, especially the array of responses at the top of ViewController.swift

Having hardcoded strings is bad if you want to display text in different languages. You need a way to extract these strings so that you can translate the values for the various languages your app will support.

For the storyboard, this is simple enough to do. Xcode can be very helpful here. Just open your storyboard, switch to the **File inspector**, and then under the **Localization** section, check the box next to **English**. Make sure that the value next to English says **Localizable Strings**. This will ensure that Xcode extracts all string values used in the storyboard into a separate file so that you can translate the values depending on the language.

Would you like to see this file? Go to **Project navigator** and you should see that your storyboard now has a disclosure triangle. Expand it. Do you see how you now have **Main.storyboard (Base)** and  **Main.strings (English)**? The Main.strings (English) file contains the English translations for the text values used in the storyboard. You can edit this file to change the English language strings if you wanted to. Is that nifty, or what?

All new Xcode projects are generally pre-configured to support internationalization. So, your storyboards always are set for Base internationalization and will support the user's development language as the default language. In our case, the development language was English. For you, it might be something else.

## Interlude

Now that you've extracted the storyboard text, it's time to extract the strings used in code.

## Demo 3

To support multiple languages via code, all you need to do is pass the text values to be translated to the `NSLocalizedString` method with a helpful comment for the translator.

Sounds confusing? You'll understand how it works when you see it in action.

The `NSLocalizedString` method takes two parameters, the first is the string to be translated and the second is a comment about the string to be translated. You'll undersand the signficance of the comment a little later on.

For now, you can simply go through your text and replace the string values by hand like this.

> Show how to replace a string by enclosing it in a call to `NSLocalizedString`.

## Interlude

For a small project like *MyFriend*, the above change is simple enough. But what about when you have a 20 or 30 files (or worse, hundreds of files) in a large project where each file has thousands of lines of code? Do you really want to do all the changes by hand?

Fortunately, there's another way to handle this. Would you like to know how?

## Demo 4

Instead of scanning each source file for string values and modifying them individually, you can use Xcode's super-useful search and replace functionality to do the same thing.

Simply switch to the **Find navigator** and change the mode from Find to **Replace > Regular Expression**. 

In the search box type: **"(.+?)"** and press **return** to search.

You'll see a list of all the text strings in your code. You'll notice that you have a **Replace All** button and you might be tempted to replace all strings immediately. Even if you knew what to replace the found values with, don't do it … it's a trap!

Look at the found strings a bit more closely - especially the files. Do you notice that the Main.strings file with your translations for the storyboard is in there too? You certainly don't want that file modified, right?

Also, if you look closer, you'll notice that there are things like the table view cell identifiers in **ViewController.swift** (line 93 and 95) - you don't want those translated either. So going with the **Replace All** option is an all around bad idea.

However, you can still save a bunch of time by selectively replacing values. Just select the items that you really want to replace, type in the replace value into the appropriate box and use the **Replace** button.

But what do you use as the replacement value, you ask? How about something like:

> **NSLocalizedString("$1", comment: "Translate text: $1")**

That should get you where you need to be. Of course, do remember that your comments, the ones passed to `NSLocalizedString`, might not be very useful if you go for the search and replace option. But you can't have everything, right?

## Interlude

How does `NSLocalizedString` use the text values you pass to it to support multiple languages? To find the answer to that question, you have to first generate a list of localizable text strings. Would you like to learn how?

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

If you check the contents of the file, you'll notice that each string from your code is represented as a pair of values seprated by an equal (=) sign. Since the development language is English, both values are the same. If you were translating to another language, you would replace the text on the right of the equal sign with the translated text.

Remember not to change the text on the left since that string has to match what is in your code - the value passed to the `NSLocalizedString` method. You should change the value on the left of the equal sign only if you change it in your code as well. Otherwise, leave it alone.

And what about the comment parameter passed to `NSLocalizedString`? We said that the purpose of the comment will become clear later? See the comment above each string pair? That's the comment you passed in. It can be useful in giving instructions to the translater - for example, if you have a one word string like "fly" - the translator might not know whether you mean fly as in the insect or the action. The comments can be used to pass the translater information that will help them with their task.

## Conclusion 

That’s everything I/we would like to cover in this screencast regarding internationalization. Your project is now ready to be localized.

By now you should have a good idea of how to take any iOS project and set it up for supporting multiple languages. 

While this won't make you a suave international man (or woman) of mystery, it will certainly help you make an app that appeals to a lot more people since it will speak their language!

Do take a look at our other screencasts if you are interested in learning more about Internationlization or any other mobile development related topics.

Adios, Ciao, and see ya!