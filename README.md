# iOS App template for CSML App Studio

**iOS Versions Supported:** iOS 12.0 and above.
**Xcode Version Required:** 10.0 and above

## Overview

This is a iOS App template for [CSML App Studio](https://sites.google.com/ucsc.edu/csmlappstudio/detection). This app is created based on the [TensorFlow Lite object detection iOS example app](https://github.com/tensorflow/examples/tree/master/lite/examples/object_detection/ios). However, a lot of original work is done on the base app. The detects the objects (bounding boxes and classes) in the frames seen by your device's back camera, using a quantized [MobileNet SSD](https://github.com/tensorflow/models/tree/master/research/object_detection) model trained on your custom dataset using the CSML App Studio. These instructions walk you through building and running the app on an iOS device.

## Prerequisites

* You must have Xcode installed on a Apple Mac computer.

* You should have a valid Apple Developer ID to distribute the app.

* The demo app requires a camera and must be executed on a real iOS device. You can build it and run with the iPhone Simulator but the app raises a camera not found exception.

* You don't need to build the entire TensorFlow library to run the demo, it uses CocoaPods to download the TensorFlow Lite library.

* You'll also need the Xcode command-line tools:
 ```xcode-select --install```
 If this is a new install, you will need to run the Xcode application once to agree to the license before continuing.

## Building the iOS App

1. Start by downloading/cloning this github repo to your local Mac machine. Install CocoaPods if you don't have it.
```sudo gem install cocoapods```
If this command fails to install the cocoapods (which you may understand in the next step), they to isntall it using home brew.
```brew install cocoapods```

2. Install the pod to generate the workspace file by running the following command from inside the ```csapptemplate1``` directory:
```arch -x86_64 pod install``` (if m1/m2 based Mac) or ```pod install``` (if Intel based Mac)
  If you have installed this pod before and that command doesn't work, try
```arch -x86_64 pod update``` (if m1/m2 based Mac) or ```pod update``` (if Intel based Mac)
At the end of this step you should have a file called ```CitizenScienceApp1.xcworkspace```

3. Open **CitizenScienceApp1.xcworkspace** in Xcode. (Warning: Do not open the **CitizenScienceApp1.xcodeproj**. It will fail if you try to build!)

4. Please change the bundle identifier to a unique identifier and select your development team in **'General->Signing'** before building the application if you are using an iOS device.

![alt text](general.png?raw=true)
![alt text](signing.png?raw=true)

5. This app includes a default a MobileNet SSD model trained on [COCO dataset](http://cocodataset.org/). The input image size required is 300 X 300 X 3. You can download the model [here](https://storage.googleapis.com/download.tensorflow.org/models/tflite/coco_ssd_mobilenet_v1_1.0_quant_2018_06_29.zip). You can find more information on the research on object detection [here](https://github.com/tensorflow/models/tree/master/research/object_detection). You need to replace the detect.tflite and labelmap.txt with your custom trained detect.tflite and labelmap.txt.

6. For adding custom icon and logo for the app, you need to replace the files in the csapptemplate1 >> ObjectDetection >>  Assets.xcassets folder. A python script (create_icon_logo.py) is provided for that. Put your icon and logo images (.bmp, .jpg, or .png) in the Assets.xcassets and run the puthon script as follows,

```python create_icon_logo.py <name of your icon file> <name of your logo file>```

The python script will autometically replace the icons and logos with your images.

7. Build and run the app in Xcode. You'll have to grant permissions for the app to use the device's camera. Point the camera at various objects and enjoy seeing how the model detects the objects of interest for your project.

8. Replace the links in the **MenuViewController** to update the urls to the file upload webpage (line 29) and help webpage (line 39). Rebuild the app to apply the changes to your app.
![alt text](urls.png?raw=true)
