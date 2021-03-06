---
layout: post
title: "Mvc Razor Themeable ViewEngine"
excerpt:
  Quick guide to downloading the view engine from NuGet and implementing it on your MVC3 site.
---

Here is how you set it up:

1. Make sure you have the latest version of NuGet: [http://visualstudiogallery.msdn.microsoft.com/27077b70-9dad-4c64-adcf-c7cf6bc9970c
Install-Package MvcRazorThemeableViewEngine]http://visualstudiogallery.msdn.microsoft.com/27077b70-9dad-4c64-adcf-c7cf6bc9970c
2. Install-Package MvcRazorThemeableViewEngine
3. Edit your Global.asax.cs file with the code in Global-temp.asax.cs (example to follow)

When you install the package, it creates two folders and a file in root. The first folder is called CustomExtensions, and the second one is called CustomViewEngines. These contain the ViewEngine and helpers require to theme your site.

You'll want to edit your global.asax.cs file to make sure it's registering the custom view engine. The global-temp.asax.cs is provided as an example. You'll specifically want these two methods:

	public static void RegisterViewEngine(ViewEngineCollection viewEngines) {
		viewEngines.Clear();
        var themeableRazorViewEngine = new ThemeableRazorViewEngine {
			CurrentTheme = httpContext => httpContext.Session["theme"] as string ?? string.Empty
		};

        viewEngines.Add(themeableRazorViewEngine);
    }

	protected void Application_Start() {
        AreaRegistration.RegisterAllAreas();
        RegisterGlobalFilters(GlobalFilters.Filters);
        RegisterRoutes(RouteTable.Routes);
        RegisterViewEngine(ViewEngines.Engines);
    }

Build and run and you should be running on the new theme engine.

##Theming your site

Let's create an example theme called "Red" that will be, you guessed it, red:

1. In your Content folder, add a folder called Red with a Site.css file in it that sets the background to red.
2. In your views folder, create a Themes folder and a Red folder.
3. In the Red folder, create a new view called Index.
4. Add some text to the Index view so that you can identifiy that it's your Red theme index page.
5. Update your Views/Shared/_Layout.cshtml file to point to your theme specific style sheet.

link href="@Url.Css("Site.css")" rel="stylesheet"

Now, update your home controller someone to set the theme sesion variable to "Red" and you'll see your custom theme.

I'll post a working example soon... (famous last words)