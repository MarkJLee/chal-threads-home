# chal-threads-home

This project replicates a segment of the Home screen from the Threads application.

## Specifications

### Home Screen

-   Implement a scrollable list to display posts.

(Implementing features using Firebase, Riverpod, MVVM.)

-   Posts should be fetched from Firestore.
-   The Widget for displaying the post doesn't need a Text widget for the username or an Image widget for the avatar; instead, set it to "anonymous".
-   Images must be loaded from Firebase Storage.

### Post Component

-   Posts should be differentiated into two categories: textual and visual (with images).
-   For posts containing images, ensure swipe functionality for user navigation.
-   The design should closely mirror the original representation.

### Navigation

-   Integrate a navigation bar comprising five tabs: Home, Search, Write Thread, Notifications, and Profile.
-   Highlight the active tab with a black icon; inactive tabs should display a grey icon.
-   Utilize a Placeholder for non-implemented screens.

### Bottom Sheet

-   When the user taps the "•••" icon, a sliding panel(BottomSheet) should come from below.
-   This sliding panel should include options for "Unfollow", "Mute", "Hide", and "Report".
-   Tapping the "Report" option should navigate the user to a new view within the sliding panel.
-   This Report view should feature a title bar and a series of list items.

### Write Screen

-   Upon clicking the third button in the navigation, the user should be navigated to the Write view.
-   The Write view should slide up from the bottom of the display.
-   There should be a "Cancel" button that allows users to return to the previous screen.
-   Once the user enters text into the input field, the "Post" button should become active.

(Camera Screen)

-   When the user taps on the attachment icon, the app shall navigate the user to the Camera Screen.
-   On the Camera Screen, the app shall provide the capability for the user to capture a new photo or select an existing photo from the gallery.
-   When the photo is captured or selected, the app shall navigate the user back to the Write Screen with the newly captured photo or the selected photo from the gallery.

(Implementing features using Firebase, Riverpod, MVVM.)

-   When a user creates a post, it should be stored in Firestore.
-   They should have the capability to attach images to their post, which should be saved to Firebase Storage.

### Search Screen

-   The search window should match users when searched using the input text.

### Activity Screen

-   The top should feature a horizontal scroll button to filter each post.

### Profile Screen

-   The interface comprises a header and two tabbed sections labeled as "Threads" and "Replies".
-   Leverage the CustomScrollView, SliverAppBar, and SliverPersistentHeader widgets for the implementation of this interface.

### Settings Screen

-   Upon tapping the icon positioned on the upper right quadrant of the profile interface, the user should be navigated to the Settings view.
-   Utilize the ListTile widget for the layout structure within the Settings view.
-   Implement a "Log Out" action button. Deploy the CupertinoAlertDialog widget for iOS users and the AlertDialog widget for Android users. This dialog functionality should be demonstrably presented in the submitted video clip.

### Privacy Screen

-   Upon tapping the "Privacy" ListTile, the user should be navigated to the Privacy view.
-   Within the Privacy view, utilize the SwitchListTile widget for toggle options.

### Dark Mode

-   The Home, Search, Activity, and Profile screens shall implement a dark mode theme. This shall match the look and feel of dark mode in the platform OS.

### Router (use GoRouter)

-   Your app's navigation should be implemented using URL-based routing, allowing direct access through specific URLs.
-   /: Home Screen
-   /search: Search Screen
-   /activity: Activity Screen
-   /profile: Profile Screen
-   /settings: Settings Screen
-   /settings/privacy: Privacy Screen

### MVVM + Provider + Dark Mode

-   Building on the efforts from the prior tasks and utilizing Provider with the MVVM pattern, implement a dark mode toggle on the Settings screen.
-   Employ ChangeNotifier and ChangeNotifierProvider to facilitate the implementation of the dark mode toggle.
-   Demonstrate the functionality of the dark mode toggle in the video submission.

### RiverPod

-   Migrate the dark mode toggle implementation from using MVVM with Provider to MVVM with Riverpod.

### Firebase Authentication

-   Initialize a Firebase project and integrate it into your Threads application, then implement account creation and sign-in screens.

### Sign In Screen

-   The "Sign In" page should have a clear link to the "Create Account" page.
-   The "Sign In" page needs a simple form with two fields: "email" and "password".
-   After filling out and submitting the form, the user should be signed in using Firebase.
-   Once signed in, they should be directed to the "Home Screen".

### Create Account Screen

-   The "Create Account" page must incorporate a form containing two primary input fields: one for "email" and another for "password".
-   Upon form submission, users should be registered via Firebase Authentication. Successful registration will then redirect the user to the "Home Screen".

## Demo Link

-   [Threads-home](https://imgur.com/a/iWzhhGD)
-   [Threads-report](https://imgur.com/a/wGZpwMb)

### Screenshots

[mobbin.com, Threads](https://mobbin.com/apps/threads-ios-610937a2-ec34-468e-b68b-120deb45f742/2ef6dedb-276a-494d-94df-63d1970d479e/flows)
