import numpy as np
import pathlib
import cv2
import sys

print(sys.argv[1], sys.argv[2])


res = [20, 29, 40, 50, 57, 58, 60, 72, 76, 80, 87, 100, 114, 120, 144, 152, 167, 180, 1024]

for i in res:
    image_path1 = "AppIcon.appiconset/" + str(i) + ".png"
    image1 = cv2.imread(sys.argv[1], cv2.IMREAD_UNCHANGED)
    resized_image = cv2.resize(image1, (i,i), interpolation = cv2.INTER_AREA)
    cv2.imwrite(image_path1, resized_image)


image2 = cv2.imread(sys.argv[2], cv2.IMREAD_UNCHANGED)
resized_image = cv2.resize(image2, (800,128), interpolation = cv2.INTER_AREA)
image_path2 = "logo.imageset/logo.png"
cv2.imwrite(image_path2, resized_image)
image_path2 = "logo.imageset/logo@3x.png"
cv2.imwrite(image_path2, resized_image)
resized_image = cv2.resize(image2, (531,86), interpolation = cv2.INTER_AREA)
image_path2 = "logo.imageset/logo@2x.png"
cv2.imwrite(image_path2, resized_image)