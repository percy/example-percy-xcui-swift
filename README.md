# example-percy-xcui-swift
Example app used by the [Percy XCUI Swift tutorial](https://docs.percy.io/v2-app/docs/xcuitest) demonstrating Percy's XCUI Swift integration.

## XCUI Swift Tutorial

The tutorial assumes you're already familiar with XCUI and Swift and focuses on using it with App Percy. You'll still
be able to follow along if you're not familiar with XCUI Swift, but we won't
spend time introducing XCUI Swift concepts.


The tutorial also assumes you have [Node 12+ with
npm](https://nodejs.org/en/download/) and
[git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) installed.

### Step 1

Clone the example application and install dependencies:

```bash
$ git clone https://github.com/percy/example-percy-xcui-swift
$ cd example-percy-xcui-swift
```

### Step 2
# Build ipa & testSuite

We have provided you with a sample application and testSuite in the resources folder that you can use to get started without following the rest of step 2. If you want to use these, simply skip to step 3.

Alternatively, you can need to build your ipa & testSuite from the sample project.

1. Select the device as "Generic iOS device"
2. Product -> Clean
3. Build the ipa
	1. Product -> Archive
	2. Window -> Organizer -> Select the most recently created archive -> Distribute App
	3. Export for "Development"
	4. Select the location where you want the ipa to be saved

4. Build the XC UI Tests zip
	1. Product -> Build For -> Testing
	2. From the shell, go to the DerivedData directory (normally ~/Library/Developer/Xcode/DerivedData/)
	3. cd Sample_iOS-&lt;random characters&gt;
	4. cd Build/Products/Debug-iphoneos/
	5. zip -r SampleUITests.zip SampleXCUITests-Runner.app/

### Step 3

In case you are choosing to use Browserstack App Automate, please follow following steps:

1. You will need a BrowserStack `username` and `access key`. To obtain your access credentials, [sign up](https://www.browserstack.com/users/sign_up?utm_campaign=Search-Brand-India&utm_source=google&utm_medium=cpc&utm_content=609922405128&utm_term=browserstack) for a free trial or [purchase a plan](https://www.browserstack.com/pricing).

2. Please get your `username` and `access key` from [profile](https://www.browserstack.com/accounts/profile) page.

You can upload app & testSuite using following curl commands
```bash
$ curl -u "<username>:<access key>" \
    -X POST "https://api-cloud.browserstack.com/app-automate/xcuitest/v2/app" \
    -F "file=@/path/to/app/file/app-debug.ipa"
```

```bash
$ curl -u "<username>:<access key>" \
  -X POST "https://api-cloud.browserstack.com/app-automate/xcuitest/v2/test-suite" \
  -F "file=@/path/to/app/file/BrowserStack-SampleXCUITest.zip"
```

You can also follow [`upload your app`](https://www.browserstack.com/docs/app-automate/xcuitest/getting-started#2-upload-your-app) if using App Automate for latest instructions.

### Step 4

Sign in to Percy and create a new `app` type project. You can name the project "test-project" if you'd like. After you've created the project, you'll be shown a token environment variable.

### Step 5

Execute tests using following command post updating appPercy params

```bash
$ curl -u "<username>:<access key>" \
  -X POST "https://api-cloud.browserstack.com/app-automate/xcuitest/v2/build" \
  -d '{"app": "bs://j3c874f21852ba57957a3fdc33f47514288c4ba4", "testSuite": "bs://f7c874f21852ba57957a3fdc33f47514288c4ba4",  "devices": ["iPhone 11-13"], "appPercy": {"PERCY_TOKEN": "<TOKEN>", "env": {"PERCY_BRANCH": "test"}}}' \
  -H "Content-Type: application/json" 
```


This will run the app's Swift XCUI tests, which contain calls to create Percy screenshots. The screenshots
will then be uploaded to Percy for comparison. Percy will use the Percy token you used in **Step 2**
to know which organization and project to upload the screenshots to.

You can view the screenshots in Percy now if you want, but there will be no visual comparisons
yet. You'll see that Percy shows you that these screenshots come from your `<PERCY_BRANCH>` branch.

### Step 5

Update `SampleXCUITests/SampleXCUITests.swift` with following changes

```
let enterText = "Hi Browserstack!!" // Say change this to "Hi Percy!!"
```
or

Use testSuite_2 from resources folder

Follow Step 2 & 3 to generate updated testSuite and upload it to App Automate, only testSuite update is required unless changse are made to main app

### Step 7

Run the tests with screenshots again similar to Step 5

This will run the tests again and take new screenshots of our modified application. The new screenshots
will be uploaded to Percy and compared with the previous screenshots, showing any visual diffs.

### Step 8

Visit your project in Percy and you'll see a new build with the visual comparisons between the two
runs. Click anywhere on the Build 2 row. You can see the original screenshots on the left, and the new
screenshots on the right.

Percy has highlighted what's changed visually in the app! Snapshots with the largest changes are
shown first You can click on the highlight to reveal the underlying screenshot.

If you scroll down, you'll see that no other test cases were impacted by our changes to text. 
The unchanged screenshots are shown under `Unchanged` filter and are hidden by default.

### Finished! 😀

From here, you can try making your own changes to the app and tests, if you like. If you do, re-run
the tests and you'll see any visual changes reflected in Percy.
