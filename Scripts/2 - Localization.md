# Localization
Translating your app for a specific language or region is known as Localization. Let's learn to localize an app that already has Internationalization support.

###
* **Instructor:** Jessy Catterwaul, Catie Catterwaul  
* **Materials Author:**  Fahim Farook 
* **Tech Editor:** N/A

### 
* **Language:** Swift 4  
* **Platform:** iOS 11
* **Editor:** Xcode 9

# Intro

➠2 - Localization

👯CATIE🐸 Hey, everybody! I'm Catie! With me here is Jessy!  
👯JESSY😺 In this screencast, we're going to show you how to how to add support for a second language in your app.  
👯CATIE🐸 We'll make the assumption that you've already internationalized your app, so that all appropriate text is ready be localized. We've got another screencast on that topic if you need to learn it.  
👯JESSY😺 We'll be using an app called *MyFriend*, made by Fahim Farook, in which you can carry out conversations with a virtual friend. Thanks to Fahim for putting together such delightful materials!

---
# Demo 1

**Catie 🐸**  
Our virtual friend Peter can already speak English, but now we'll give him the ability to speak Spanish too.

When adding support for a new language to your app, the first thing you need to do is add the new language to your Xcode project.

Select the project in the **Project navigator**…
> do that

…and select your project in the **Projects** list.
> do that

Then, click the plus button under the **Localizations** section, and choose a language
> do that (**Spanish (es)**)
> show dialog

A dialog will come up, allowing you to custom-tailor what files will be localized, and from what reference language. The defaults work fine for this project.

---
# Interlude 1
➠😺JESSY😺  
At this point, you'll have new localizable strings files for the new language you'll be supporting. However, Xcode does have the ability to automatically translate anything for you.

➠You still have the task of adding the necessary translations to your new files. Let's start with the storyboard.

---

# Demo 2

**Catie 🐸**  

In the Project navigator, expanding `Main.storyboard` will show the base file and any localized strings files you've created.
> do that

These files contain the strings that will be displayed in the storyboard's views.

> open both files (one as assistant)

To start off with, our new language's text is the same as whatever you used as a reference, in the previous dialog. It's up to you to perform an actual translation, in the new language's `Main.strings` file.

> close assistant

**Jessy 😺**  
> Change the strings as follows:
>
> 1. "My Friend Peter" -> "Mi Amigo Pedro" 
> 2. "Date" -> "Fecha"
> 3. "Hello, my name is Peter!" -> "¡Hola, me llamo Pedro!"
> 4. "Hi, Peter! How are you?" -> "¡Hola Pedro! ¿Cómo estás?"
> 5. "Over 1,000,000 conversations. What do you want to talk about today?" -> "Más de 1.000.000 de conversaciones. ¿Qué quieres hablar hoy?"
> 6. "Reply" -> "Respuesta"

All you need to do is change the text to the right of the equals sign. The text you replace is still in the comment above, for reference.

It's very important that you don't make any changes to the value on the left of the equal sign though.

##Main.storyboard

To see your translated strings in action, you'll need to open your storyboard, and a **Preview** Assistant editor.
> open them

In the lower-right, the name of the currently-previewed language is shown. And you click on it to change it!

---
# Interlude 2
➠🐸CATIE🐸  
With your storyboard working correctly, it's time to turn your attention to your code.

If you've finished the internationalization process, all the applicable text in your code will already have been extracted into a localizable strings file. The process you'll go through is the same as with the storyboard.

---

# Demo 3
## Localizable.strings (Spanish)
> have the translations done already:
> 1. " conversations. What do you want to talk about today?" -> " de conversaciones. ¿Qué quieres hablar hoy?"
> 2. "Hello, my name is Peter." -> "¡Hola, me llamo Pedro!" 
> 3. "Hello, Peter. Nice to meet you!" -> "Hola Pedro. ¡Encantada de conocerte!"
> 4. "How are you?" -> "¿Cómo estás?"
> 5. "I am good. And you?" -> "Soy bueno. ¿Y usted?"
> 6. "I'm doing well, thank you." -> "Lo estoy haciendo bien, gracias."
> 7. "OK" -> "Vale"
> 8. "Over " -> "Más de "
> 9. "Peter is tired" -> "Pedro está cansado"
> 10. "Restart for more conversation." -> "Reinicie para más conversación."
> 11. "See you tomorrow?" -> "¿Se veo mañana?"
> 12. "Sure!" -> "¡Claro!"

**Jessy 😺**  
Here's what the result of that looks like, for **MyFriend**, in Spanish.

> show the file for a moment

When you're done with that, you can run your app to see if it all works correctly. 

> build and run

Of course, we don't see the new language immediately. Instead, you'll have to change the language on your device so that you see your new translations. For that, go to the **Settings** app, then **General**, **Language & Region**, and finally, **iPhone Language**. 

> Go there and pick Español.
> Show the app running in Spanish while Catie talks

**Catie 🐸**  
Other than string translation, there *might not* be that much work to do, to add support for a second language. If you add internationalization support early on, as we did with *MyFriend*, localization can be a relatively easy process.

---
# Interlude 3
➠😺JESSY😺  
Now there's just one tiny, but important detail left. Even though we've changed the language of our device, the App's name is still in English, on the Home screen. To localize it, you have to add a special strings file which will let you override the settings in your **Info.plist**. 

---

# Demo 4
**Jessy 😺**  
When you make a new **New File…**, you can create the right type, by going down to the **Resource** section, and choosing **Strings file**. 
> name it  InfoPlist.strings

The name has to be `InfoPlist.strings`, and it needs to go in the **lproj** folder for the appropriate language.

The line you need assigns the localized app name to the "CFBundleDisplayName" key.

> Now switch to the new InfoPlist.strings file and add the following line to it:
> ```
> "CFBundleDisplayName" = "MiAmigo";
> ```

**Catie 🐸**  
Now build and run the app and then check your home screen.

> do that

When the device is set to Spanish, the app name is MiAmigo!

---
# Conclusion

➠Conclusion  
👯CATIE🐸 By now you should have a good idea of how to take an iOS project and set it up to support any number of languages.  
👯JESSY😺 From a development perspective, it's not very complicated to add Localization support, so you should strongly consider doing it. Your biggest challenge will be finding trustworthy translators.   
👯CATIE🐸  We wish you much success with that. And until time, Tschuss!  
👯JESSY😺 À la prochaine!
