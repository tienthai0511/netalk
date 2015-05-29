=== wpDiscuz - Wordpress Comments ===
Contributors: gVectors Team
Donate link: https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=UC44WQM5XJFPA
Tags: wordpress comments, ajax comments, ajax, live update, theme, post comments, comments box, community, discussion, discuss, comment form, reply, comments, discussions, comment template, activity, comment author, comment system, redirect, comment redirect, first commenter, social login
Requires at least: 2.7
Tested up to: 4.2.2
Stable tag: 2.2.5
License: GPLv2 or later
License URI: http://www.gnu.org/licenses/gpl-2.0.html

New interactive, AJAX comment system. Responsive comment plugin with Live Update function. Allows your visitors discuss, vote for comments and share. 

== Description ==

New interactive, AJAX comment system. Responsive comment plugin with Live Update function. Allows your visitors discuss, vote for comments and share. 


**wpDiscuz Features:**


**Integration with User Profile Plugins**

* BuddyPress - Avatar, Profile page
* Users Ultra - Avatar, Profile page
* Ultimate Member - Avatar, Profile page
* UserPro - Avatar, Badges, Profile page


**Front-end**

* | Adds interactive comment box on posts and other content types
* | Responsive comments form and comment threads design
* | Clean, simple and easy user interface and user experience
* | Live update of new comments with notifier buttons
* | Anonymous comments ( name and email can be set as not required )
* | Social Network Login - Facebook, Twitter, Google+, Wordpress, VK, OK and others
* | Multi-level (nested) comment threads, with maximum levels depth setting option
* | Allows to create a new discussion thread and reply to existing comment
* | Ajax button "Load More Comments" instead of simple comments pagination
* | Different comment date formats, reflects Wordpress date format settings
* | Users can edit their comments (time-frame can be limited by admin)
* | Automatic URLs to link conversion in comment texts
* | Automatic image source URLs to image (HTML) conversion in comment texts
* | Multiple line-breaks (limited by Wordpress comment filter)
* | Comment author notification options with special checkboxes on comment form
* | Subscription activation via additional "Confirm Subscription" email
* | Integration with Postmatic for subscriptions and commenting by email
* | Ability to add comment system on attachment pages if it's allowed by Wordpress
* | Fast and easy comment form with ajax validation and data submitting 
* | Fully integrated and compatible with Wordpress 
* | Uses Wordpress Comment system with all managing functions and features
* | Secure and Anti-Spam features will not allow spammers to comment
* | Comment voting with positive and negative result
* | Smart voting system with tracking by logged-in user and cookies
* | Post sharing options: Facebook, Twitter and Google+


**Dashboard** 

* | Option to display comment form for certain post types
* | Option to show the latest comments on top or bottom of threads
* | Option to set Live Update mode (auto or notifier buttons) and update period
* | Options to turn On/Off Comment Voting and Sharing features
* | Option to allow guests vote for comments
* | Option to hide/show CAPTCHA field on comment form
* | Option for "User Must be registered to comment"
* | Option to held new comments for moderation 
* | Option to hide user labels/titles
* | Option to set number of comment threads per page 
* | Option to set nested comments maximum depth level
* | Option to manage (hide/show) email notification checkboxes
* | Option to notify administrators and comment authors on new comment/reply
* | Option to keep ON the email notification options on comment form by default
* | Option to manage font color
* | Option to manage comment/reply background colors
* | Option to manage author name and label color
* | Option to manage reply/share/vote link colors
* | Front-end phrase managing options, you'll be able to translate or change all phrases

This comment system is also available for WooCommerce, Plugin name is WooDiscuz:
https://wordpress.org/plugins/woodiscuz-woocommerce-comments/


== Installation ==

IMPORTANT: If you have a Cache Plugin, please delete all caches after wpDiscuz update.

1. Upload plugin folder to the '/wp-content/plugins/' directory,
2. Activate the plugin through the 'Plugins' menu in WordPress.

== Frequently Asked Questions ==

**IMPORTANT**

* If you have a Cache Plugin, please delete all caches after wpDiscuz update.
* If wpDiscuz comment form is missing please read this support topic: 
http://www.gvectors.com/questions/wpdiscuz-comment-form-is-missing/


= Q&A =

	* QUESTION: Does it fully replace the current comment system? That in this case what happens to old comments?
	* ANSWER: wpDiscuz changes default comment system to a new interactive system and shows all old comments, nothing will be lost.


	* QUESTION: Where comments are stored?
	* ANSWER: wpDiscuz uses the default WordPress comment storage system, all comments are on your database and all comments are manageable in Dashboard > Comments admin page. 


	* QUESTION: Will my comments be lost if I install this plugin, and then remove it? 
	* ANSWER: wpDiscuz doesn't affect any data. You can install and uninstall whenever you want without any worries. 


= Please Check the Following wpDiscuz Resources =

* Support Forum: <http://gvectors.com/questions/>
* Plugin Page: <http://gvectors.com/wpdiscuz/>

== Screenshots ==

1. wpDiscuz ajax comment list for logged in user Screenshot #1
2. wpDiscuz ajax comment list for guests Screenshot #2
3. Discussion Threads with Reply Form Screenshot #3
4. Comment editing #4
5. Live Update: checks for new comments and shows update buttons #5
6. wpDiscuz ajax comment form with social login buttons Screenshot #6
7. Full Front-End View Screenshot #7
8. wpDiscuz General Settings #8


== Changelog ==

= 2.2.5 =
* Fixed Bug: Comment author profile image issue when using Gravatar
* Fixed Bug: Conditional php session start (optimized).

IMPORTANT: If you have a Cache Plugin, please delete all caches after wpDiscuz update.

= 2.2.4 =
* Fixed Bug: CSS/Layout issue. Breaks some theme layout.

= 2.2.3 =
* Added: Option to hide/show user avatars on comment form and list
* Added: Option to hide/show comment form header text
* Added: Option to set maximum character limit for comment text
* Added: Option to enable .po/.mo translation files for mult-language sites
* Added: Allowed new HTML tags (blockquote, ul, ol, li, code, em, abbr...)
* Fixed Bug: Avatar duplication on reply form
* Fixed Bug: Author display name update when it changed on UM profile page
* Fixed Bug: 404 error on clicking subscription confirmation link
* Fixed Bug: Email validation issue with .info and other TLD with more than 3 chars

= 2.2.2 =
* Fixed Bug: Some phrases were not translate-able
* Fixed Bug: Social Network Avatar display problem
* Fixed Bug: Issues with site layout, website field and Facebook login button
* Fixed Bug: Error message "URL is invalid" for Website URLs starting with http://
* Fixed Bug: Unlimited voting issue for guests

= 2.2.1 =
* Fixed Bug: Front-end Phrases don't suport Special Characters

= 2.2.0 =
* Added: Social Network Login:
Facebook, Google, Twitter, Wordpress, Vkontakte, Mail.ru, Yandex,  Odnoklassniki, 500px, Windows Live, Yahoo!, LinkedIn, Reddit, Disqus, Tumblr, Stackoverflow, GitHub, Dribbble, Instagram, Foursquare, Steam, Twitch.tv, Mixi, Goodreads, Skyrock, Last.fm, AOL and PixelPin.
Integrated with WordPress Social Login, Super Socializer and Social Connect plugins.
* Added: New "WebSite" field in comment form
* Added: Anonymous commenting ( Name and Email can be optional )
* Added: VK.com and OK.ru social network share buttons
* Added: New {rel, target, ...} attributes for <a> link tag
* Added: CSS and JavaScrip file/code optimization and minifying
* Fixed Bug: Issues with comment editing
* Fixed Bug: Custom "Phrases" fail to display if apostrophes are used

= 2.1.10 =
* Fixed Bug: First comment redirection without setting the destination page  

= 2.1.9 =
* Added: Option to redirect first commenters to "Thank You" page 
* Fixed Bug: Issues with guest voting (more secure and stable)

= 2.1.8 =
* Added: Option to allow guests vote for comments
* Added: Option to load rest of all comments using the Load More Comments button
* Fixed Bug: Subscription option resetting after inserting wrong CAPTCHA code.
* Fixed Bug: Header CSS code for dynamic style values ( 90% reduced )
* Fixed Bug: JS/CSS conflicts with WooDiscuz plugin
* Fixed Bug: Wrong comment time when Wordpress date format is turned on.

= 2.1.7 =
* Fixed Bug: Ultimate Member Integration problem on WEB Servers w/o DomObject support
(SyntaxError: Unexpected token ... )

= 2.1.6 =
* Added: Integration with Ultimate Member - author profile picture
* Added: Integration with Ultimate Member - author name is linked to profile page
* Fixed Bug: CSS overrides some default styles on /wp-admin/

= 2.1.5 =
* Fixed Bug: Problems with email notifications
* Fixed Bug: Empty name of anonymouse comments
* Added: RTL Support (for right to left languages)
* Added: Option to set form fields border color
* Added: Additional phrases for plural form
* Added: Tabbed General Settings admin page
* Added: Tabbed Phrase Manager admin page
* Added: Better integration with Postmatic
* Added: Portuguese (pt_PT) language, thanks to Celso Azevedo

= 2.1.4 =
* Added: CSS classes for blog users titles by rank
* Fixed Bug: Phrases saving issue

= 2.1.2 =
* Added : Adapting with wordpress.org plugin repository guidelines

= 2.1.0 =
* Added : Users can edit their comments (time-frame can be limited by admin)
* Added : Email notification options with radio selector instead of checkboxes
* Added : Subscription activation via additional "Confirm Subscription" email
* Added : Thumb-up and thumb-down voting icons
* Added : Integration with UserPro - Comment author profile picture
* Added : Integration with UserPro - Comment author name is linked to profile page
* Added : Integration with UserPro - User badges under comment author avatar
* Added : Integration with Postmatic for subscriptions and commenting by email
* Added : Persian (fa_IR) language, thanks to Vahid (VSG24)
* Added : Russian (ru_RU) language, thanks to OlafKS
* Added : Close pop-up messages by clicking outside of message-box
* Added : Scroll-down to comment are on clicking comments/replies link
* Added : Filter hooks on email fields
* Added : Filter hooks on comment form fields
* Fixed Bug: Image source URL to image conversion in comment content

= 2.0.9 =
* Fixed Bug: Adapted with some themes ( Fatal error: Cannot redeclare add_user() )
* Fixed Bug: Incorrect comment date/time if the default Wordpress date format is on

= 2.0.8 =
* Fixed Bug: Disabled comment issues (missing comment form)
* If wpDiscuz comment form is missing please read this support topic: 
http://www.gvectors.com/questions/wpdiscuz-comment-form-is-missing/

= 2.0.7 =
* Fixed Bug: Comment system hiding problem on posts with disabled discussion option.

= 2.0.6 =
* Fixed Bug: Problem with saving new pharses (Same text on checboxes)

= 2.0.5 =
* Added : Manage Subscriptions section on comment forms
* Added : New subscribe option: Notify of new replies to all my comments
* Added : Show logged-in user name and logout link on top of the main form 
* Added : Ability to insert image in comment content using image source URL
* Added : Language translation support with .mo and .po files
* Added : Hebrew (he_IL) language, thanks to Ahrale Shrem
* Added : Options to show/hide new subscription checkbox
* Fixed Bug: Duplication of "New Comment" email notifications for post authors
* Fixed Bug: Problem with large space between the paragraphs

= 2.0.4 =
* Added : Current subscribe status note on comment form (for logged-in users)
* Added : Unsubscribe link on comment form and in "new comment" notification message.
* Fixed Bug: Redirection to blank option.php on saving any option page.

= 2.0.3 =
* Fixed Bug: Problem with email notification options on comment form
* Added : Option to keep checked-on the email notification checkboxes on comment form by default

= 2.0.2 =
* Fixed Bug: Problem with saving checkbox options (incorrect logic of values)

= 2.0.1 =
* Fixed Bug: Problem with new options and phrase saving

= 2.0.0 =
* Added : Live update of new comments with notifier buttons
* Added : Multi-level (nested) comment threads, with maximum levels depth setting option
* Added : Different comment date formats, reflects Wordpress date format settings
* Added : URLs to link auto-conversion in comment texts
* Added : Multiple line-breaks (limited by Wordpress comment filter)
* Added : Comment author notification options with special checkboxes on comment form
* Added : Ability to add comment system on attachment pages if it's allowed by Wordpress
* Added : Comments are generated with Wordpress comment-id to link those with anchor(#)
* Added : Option to set Live Update mode (auto or notifier buttons) and update period
* Added : Option to set nested comments maximum depth level
* Added : Option to manage (hide/show) email notification checkboxes
* Added : Option to manage background color of just loaded new comment (on live update)
* Fixed Bug: Problem with multiple line-breaks

= 1.0.9 =
* Added : Option to set comment text font size
* Added : Option to set form background color
* Added : Better responsively on mobile devices
* Added : better CAPTCHA image with colors and lines
* Fixed Bug: Undefined loader spinner image source.

= 1.0.8 =
* Fixed Bug: CSS Issues
* Added : wpDiscuz comment system supports all WordPress template hooks. It's compatible with all plugins which uses comment hooks.

= 1.0.7 =
* Fixed Bug: wpDiscuz comments ordering conflict with wordpress comments ordering

= 1.0.6 =
* Added : Option to sort comments by comment date with ascending or descending order

= 1.0.5 =
* Added : Comment author names are links to their profile page (BuddyPress, Users Ultra)
* Fixed Bug : CSS Issues

= 1.0.4 =
* Fixed Bug: Fatal error - Using $this when not in object context in ...

= 1.0.3 =
* Fixed Bug : Problem with options page redirection on Wordpress multi-sites

= 1.0.2 =
* Fixed Bug : Translations does not work, they come by default when saving

= 1.0.1 =
* Changed : Comment Box Header 
* Fixed Bug : CSS Issues
* Fixed Bug : Layout Issues with some themes

= 1.0.0 =
Initial version
