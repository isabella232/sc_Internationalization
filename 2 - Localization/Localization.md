# Intro
---
# Demo 1

**Catie 🐸**  
Your virtual friend can already speak English, but now you'll givem him/her the ability to speak in Spanish too.


When adding support for a new language to your app, the first thing you need to do is to add the new language to your Xcode project.

> Select the root folder for the project in the **Project navigator**, select your project under the **Project** section in the middle pane in Xcode and then click the plus (**+**) button under the **Localizations** section.
>
> Select **Spanish (es)** from the dropdown menu. This should open up a dialog showing existing language items to be localized. Ensure that all items are checked.

## Interlude

You have just added support for another language, Spanish, to your project. This creates new localizable strings files for the new language to your project. However, obviously enough, Xcode will not automatically translate anything for you.

So you still have the task of adding the necessary Spanish translations to the new file. Let's start with an easy one - the storyboard.

## Demo 2

> In the Project navigator, expand the Main.storyboard item to show the base file and the two localized version for English and Spanish.

As you'll see, the storyboard contains strings files for English and Spanish. These files contain the strings that will be displayed in the views displayed via the storyboard.

If you open the English file and the Spanish file and compare them, you'll notice that they both contain the same text and that it is in English. This is because the Spanish file is just a copy of the original English file. The English file was copied over when you added the new Spanish language support at the project level.

It's up to you to translate the English strings to Spanish in the Main.strings (Spanish) file. All you need to do is change the text to the right of the equal sign to the equivalent Spanish text. Do not make any changes to the value on the left of the equal sign though. This is very important.

> Change the strings as follows:
>
> 1. "My Friend Peter" -> "Mi Amigo Pedro" 
> 2. "Date" -> "Fecha"
> 3. "Hello, my name is Peter!" -> "¡Hola, me llamo Pedro!"
> 4. "Hi, Peter! How are you?" -> "¡Hola Pedro! ¿Cómo estás?"
> 5. "Over 1,000,000 conversations. What do you want to talk about today?" -> "Más de 1.000.000 de conversaciones. ¿Qué quieres hablar hoy?"
> 6. "Reply" -> "Respuesta"

## Interlude

You've changed all the storyboard strings to Spanish but if you check out the storyboard in Interface Builder, the strings still display in English there. Wouldn't it be great if you could just see the Spanish strings in action on the storyboard?

## Demo 3

> Open **Main.storyboard**, switch to the **Assistant editor**, and select **Preview** for the Assistant editor.
>
> Click the word **English** in the bottom right corner of the Assistatnt editor and change it to **Spanish** from the dropdown menu.

With the Assistant editor's preview feature, you can check how the strings for each of your supported langauges displays in your app without even having to run the app!

## Interlude

Now that you have your UI working correctly for Spanish, it's time to turn your attention to your code.

The storyboard is not the only place where you might have text strings that need to be translated to Spanish. It is possible that your code has some text strings too. 

## Demo 4

If you had followed proper Internationalization techniques, all the text strings in your code should already have been extracted into a separate localizable strings file at this point. So, all you need to do is find the localizable strings file for Spanish and translate the extracted text into Spanish.

> Expand the **Localizable.strings** file in the **Project navigator** and show the three versions of the file - Base, English, and Spanish.

The process is the same as with the storyboard - take the English words and phrases to the left of the equal sign and translate them to Spanish. Simple, right?

> Change the strings as follows:
>
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

Remember, you only change the values to the right of the equal sign. And if you do that, that's all you need to do at this point in order to add support for Spanish to your code! Simple enough, or what?

Run your app to see if it all works correctly. Of course, you'll have to first change the language on your device to Spanish so that you see your new Spanish translations instead of the English.

> Show how to change language from the **Settings** app using **General** - **Language & Region** - **iPhone Language**. You will find Spanish under **Español** and not Spanish :)

## Interlude

That was quite easy, wasn't it? Other than for the translation of strings, it looks as if you don't have to do a lot of work to add support for a second language.

But do remember, things were this easy only because you had added Internationalization support to your app in the first place. Otherwise, you would have had to do a lot more work in order to add Spanish support.

There's just one tiny thing left thought. Take a look at your home screen with Spanish set as the iPhone language. Do you notice anything?

Yes, your app name still shows up as *MyFriend*. Wouldn't it be better to have that show up in Spanish too?

## Demo 5

To localize the app name you have to add a special strings file which will let you override the settings in your **Info.plist** file. 

> Select **New File…** and then select **iOS** - **Resource** - **Strings file**. Name it InfoPlist.strings and save it under the **es.lproj** folder.
>
> Now switch to the new InfoPlist.strings file and add the following line to it:
>
> ```
> "CFBundleDisplayName" = "MiAmigo";
> ```

Now build and run the app and then check your home screen to see how the app name displays. Of course, you have to have your language set to Spanish to see the Spanish name. Then, switch over to English and check how the name displays in English.

## Conclusion

Allright, that’s everything I/we would like to cover in this screencast.

By now you should have a good idea of how to take any iOS project and set it up to support a second (or even third or fourth) language. Adding more languages is very easy once you get all your ducks (or words) in a row!

Do take a look at our other screencasts if you are interesting in learning more about Internationlization or any other mobile development related topcis.

Adios, Ciao, and see ya!
