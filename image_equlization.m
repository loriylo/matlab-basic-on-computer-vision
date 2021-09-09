% Read the image into workspace using function imread and display the image using function imshow
img=imread('farm6.png');
figure;
imgp = imshow(img)

% Convert the color image into HSV color space 
hsv = rgb2hsv(img);
H=hsv(:,:,1);
S=hsv(:,:,2);
V=hsv(:,:,3);

% Display each channel separately
imshow(H)
imshow(S)
imshow(V)

% Enlarge the image by two times using function imresize and crop the enlarged image to its original size using function imcrop
rimg =imresize(img,2);
figure
imshow(rimg)
title('two times image')
figure
targetSize = [183 275];
r = centerCropWindow2d(size(rimg),targetSize);
newcropped = imcrop(rimg,r);
imshow(newcropped)

% Convert the color image into grayscale using function rgb2gray
gray_img = rgb2gray(img);
figure
imshow(gray_img)

% Generate the histogram of the grayscale image and display it to screen
figure;
imhist(gray_img);

% run the function and save images to file
r = imread('farm6_dark.png');

imshow(matchinghg(gray_img,r))

imwrite(matchinghg(gray_img,r),'result.png')
imwrite(r,'original.png')

function [ref] = matchinghg(iMat1,iMat2)
% image matching function

% assume there may be a color iMat2 input
if size(iMat2,3) > 1
    g2=rgb2gray(iMat2);
    ref = imhistmatch(g2,iMat1)
    fh = figure;
    
    sfh1 = subplot(1,2,1),imshow(g2),title('original image after conversion');
    sfh2 = subplot(1,2,2),imshow(ref),title('after adjustment');
    

     
else
    ref = imhistmatch(iMat2,iMat1)
    fh =figure;
    sfh1 = subplot(1,2,1),imshow(iMat2),title('original image');
    sfh2 = subplot(1,2,2),imshow(ref),title('after adjustment');
    
    
end
end


