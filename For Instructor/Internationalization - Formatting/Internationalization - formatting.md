# Intro
---

# Demo 1
JESSY😺
> Show the code from lines **26 - 28** in **ViewController.swift**.

The way information should be represented for a particular region is represented by the `Locale` object. So, when you want a date formatter for a particular locale, you can pass the date formatter the specific locale you want.

On the other hand, if you want the date to be displayed for the current locale as per the device you can do that too. In fact, that's what MyFriend already does.


This code first sets the `DateFormatter` used to create a display string based on a date to the current locale. So, if you are in the US, the date will dispay in the m/d/y format, but in the UK for example, the date would display as d/m/y.

Of course, setting the locale is just half the job when it comes to formatting dates. You also have to tell the date formatter how to format a date and time. In *MyFriend* we opt to use the long date format. Since we do not specify a format for the time, no time would be displayed.

The long date format is a pre-defined style for displaying dates. There are other similar pre-defined styles for displaying times as well. 

## Interlude

Instead of using a pre-defined format, you can also use your own date formatter. But remember that if you use your own date format, then you might not be following the display conventions for a specific region. 

There's a solution for that too!

## Demo 2

If you do wnat to use your own date format instead of one of the pre-defined ones, then you need to use the `dateFormat(fromTemplate:options:locale)` class method provided by `DateFormatter` class to transform your custom date format into a date format string which matches the specified locale.

In that case, you'd change the code from above to something like this instead:

```swift
fmt.dateFormat = DateFormatter.dateFormat(fromTemplate: "dd MMM yyyy", options: 0, locale:Locale.current)
lblDate.text = fmt.string(from: Date())
```

Go on try it out! Even if the above format says that the date should come before the month, if you try the above code on a device which has the US region set, you will see the displayed date as "Oct 12, 2017" or something similar. 

How's that for magical?

## Interlude

OK, that takes care of dates. What else do you have to pay special attention to when you want to Internationalize your app?

Numbers, of course!

## Demo 3

In *MyFriend*, we currently have a banner at the top of the app which displays how many conversations have been had with your virtual friend. This numbers, or any other such number displayed in an app, is a prime candidate for Internationalization.

Of course, the value displayed in the app is currently hardcoded. So let's first add some code to display the actual number via code - instead of a hardcoded value.

> Open ViewController.swift and add a variable at the top as follows:
>
> `private var numberOfConversations = 1700583`

Now lets use this variable to display the number of conversations when the app starts up.

> In viewDidLoad, add the following code:

```swift
let number = NSNumber(integerLiteral: numberOfConversations)
let text = NumberFormatter.localizedString(from: number, number: NumberFormatter.Style.decimal)
lblTagline.text = NSLocalizedString("Over ", comment: "") + text + NSLocalizedString(" conversations. What do you want to talk about today?", comment: "")
```

/* No comment provided by engineer. */
"Over \(numberOfConversations)" = "Over \(numberOfConversations)";

The above splits out the text portions so that they can be easily translated individually and then formats the number according to the current locale so that it displays correctly no matter where in the world the user is.

Of course, it is still possible that the above will not result in a grammatically correct sentence due to how various languges work. In that case, you'd have to get a bit more creative as to how you handle that particular scenario. Unfortunately, that is a topic which would be a bit too complex to be covered in this screencast.

## Interlude

Dates and times - done. Numbers - check! So what else is left?

Can't think of anything? How about quotes?

I/we see you going "What? Quotes?" Yes, it can happen. Your ordinary, common 	quote is represented slightly differently in certain regions - France and Japan are good examples.

How would you handle that?

## Demo 4

While *MyFriend* currently does not display quotes, it is possible that at some time in the furet we might decide to display all conversations as spoken items within speech bubbles. At that point, we would want the quotes to be correct for any region that the app supports.

It's quite easy to do this - all you need to do is to get the beginning quote and the end quote for a given locale and use that to format all of the displayed text. The code might look something like this:

```swift
let text = "This is what I want to say"
if let beginQuote = Locale.current.quotationBeginDelimiter, let endQuote = Locale.current.quotationEndDelimiter {
	label.text = beginQuote + text + endQuote
} else {
	label.text = "\"" + text + "\""
}
```

If the locale has specialized quotes, you sandwich your display string between them. Otherwise, you use standard quotes.  This would work for all regions.

## Interlude

That covers most of the region specific formatting that you would generally encounter when Internationalizing your app. But there's one thing you want to look out for - what if your user changed their locale while using your app?

You need to detect such changes and update your display to suit the new locale.

## Demo 5

To detect locale changes from within your app, you have to do only one thing - subscribe to `NSLocale.currentLocaleDidChangeNotification` notifications.

Your code would look something like this:

```swift
NotificationCenter.default.addObserver(self, selector: #selector(localeChanged(_:)), name: NSLocale.currentLocaleDidChangeNotification, object: nil)
```

Of course, in the method where you respond to these notfications, you need to ensure that you re-display all visible strings which depend on the user locale. But you know how to do that, right?

## Conclusion 

That’s everything I/we would like to cover in this screencast regarding formatting support for internationalization. At this point, you should have a good idea of how to take any iOS project and update the date, time, and number values displayed in the app to support multiple languages.

Do take a look at our other screencasts if you are interested in learning more about Internationlization or any other mobile development related topics.

Adios, Ciao, and see ya!