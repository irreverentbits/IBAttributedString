# IBAttributedString
NSAttributeString API that simplifies the application of styles to strings.

NSAttributedString styling has a few issues that the IBAttributedString framework addresses:
- Styling is described by a dictionary with string keys.
    - Using a malformed string key or using the wrong key for a given value can lead to failed styling, even a crash.
    - String based APIs don't work well with code completion in Xcode.
- Underlying NSUnderlineStyle enum values are not fully orthogonal. 
    - For example, NSUnderlineStyle actually contains style descriptors for three different style settings (weight, pattern, and "by word" or "complete"). So, some NSUnderlineStyle values do not overlap and can coexist, but others cannot. 
- Paragraph styles are treated separately from simple text styles, which is both good and bad.
    - Treating paragraph styles separately may clarify that their application is slightly different (by paragraph rather than at a character level)
    - Treating paragraph styles separately makes them harder to manage.
    - Paragraph styles cannot be modified. Instead they must be wholly replaced if they need to be changed on a string.

The IBAttributedString framework helps with some of these shortcomings...


