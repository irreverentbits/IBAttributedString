# IBAttributedString
NSAttributeString API that simplifies the application of styles to strings.

NSAttributedString styling has a few issues that the IBAttributedString framework addresses:
- Styling is described by a dictionary with string keys.
    - Using a malformed string key or using the wrong key for a given value can lead to failed styling, even a crash.
    - String based APIs don't work well with code completion in Xcode.
- Underlying NSUnderlineStyle enum values are not fully orthogonal. 
    - For example, NSUnderlineStyle actually contains style descriptors for three different style settings (weight, pattern, and "by word" or "complete"). So, some NSUnderlineStyle values do not overlap and can coexist, but others cannot. 
- Some styles appear to be redundant or ignored on iOS.
    - The stroke color and foreground color appear to both affect the color of displayed text, so having them both is confusing.
    - The vertical glyph form is ignored on iOS, so having it available is confusing.
- Paragraph styles are treated separately from simple text styles, which is both good and bad.
    - Treating paragraph styles separately may clarify that their application is slightly different (by paragraph rather than at a character level)
    - Treating paragraph styles separately makes them harder to manage.
    - Paragraph styles cannot be modified. Instead they must be wholly replaced if they need to be changed on a string.

Note: Apple has added constant keys to help address the shortcomings of using strings when specifying attributed string styling, which is a great help. But the other issues remain.

# Simple usage example

Coming soon...

# IBStringStyle

IBStringStyle is the enum used to specify styles on an NSAttributedString. It provides enum values for each style formerly represented by a string key when setting NSAttributedString styles. Each enum value specifies an associated value that is the exact type of value expected for its style type. 

This prevents accidental association of an incorrect value type with an incorrect or malformed string key.

Most enum types only take one value, but underline and strike through styles in particular have multiple settings. The possible settings and values aren't immediately clear when using NSAttributedString's dictionary approach to setting styles. The IBAttributedString framework defines two enum values that make this clear. Paired with auto-completion in Xcode, it's very easy to set up underline and strike through styles.
