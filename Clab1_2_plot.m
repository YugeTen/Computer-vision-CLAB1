close all;
clear all;
%% read image, resize, convert to greyscale
im = imread('text.png');
im = imresize(im,[1024,1024]);
im = rgb2gray(im);
imshow(im)
figure()
%% convert to binary image
b_im = im2bw(im,0.5);
b_im = ~b_im;
imshow(b_im)
figure()
%% count white & black pixel respectively
count_w = size(find(b_im == 1))
count_b = size(find(b_im == 0))
%% erosion
% horizontal erosion with different matrix width
se_h1 = strel('line',5,0);
erodedb_im_h1 = imerode(b_im,se_h1);
se_h2 = strel('line',10,0);
erodedb_im_h2 = imerode(b_im,se_h2);
se_h3 = strel('line',15,0);
erodedb_im_h3 = imerode(b_im,se_h3);
se_h4 = strel('line',20,0);
erodedb_im_h4 = imerode(b_im,se_h4);
subplot(2,2,1),imshow(erodedb_im_h1),title('horizontal erosion (width 5)')
subplot(2,2,2),imshow(erodedb_im_h2),title('horizontal erosion (width 10)')
subplot(2,2,3),imshow(erodedb_im_h3),title('horizontal erosion (width 15)')
subplot(2,2,4),imshow(erodedb_im_h4),title('horizontal erosion (width 20)')
figure()
% vertical erosion with different matrix height
se_v1 = strel('line',5,90);
erodedb_im_v1 = imerode(b_im,se_v1);
se_v2 = strel('line',10,90);
erodedb_im_v2 = imerode(b_im,se_v2);
se_v3 = strel('line',15,90);
erodedb_im_v3 = imerode(b_im,se_v3);
se_v4 = strel('line',20,90);
erodedb_im_v4 = imerode(b_im,se_v4);
subplot(2,2,1),imshow(erodedb_im_v1),title('vertical erosion (height 5)')
subplot(2,2,2),imshow(erodedb_im_v2),title('vertical erosion (height 10)')
subplot(2,2,3),imshow(erodedb_im_v3),title('vertical erosion (height 15)')
subplot(2,2,4),imshow(erodedb_im_v4),title('vertical erosion (height 20)')
figure()
% square erosion with different width
se_s1 = strel('square',5);
erodedb_im_s1 = imerode(b_im,se_s1);
se_s2 = strel('square',10);
erodedb_im_s2 = imerode(b_im,se_s2);
se_s3 = strel('square',15);
erodedb_im_s3 = imerode(b_im,se_s3);
se_s4 = strel('square',20);
erodedb_im_s4 = imerode(b_im,se_s4);
subplot(2,2,1),imshow(erodedb_im_s1),title('square erosion (width 5)')
subplot(2,2,2),imshow(erodedb_im_s2),title('square erosion (width 10)')
subplot(2,2,3),imshow(erodedb_im_s3),title('square erosion (width 15)')
subplot(2,2,4),imshow(erodedb_im_s4),title('square erosion (width 20)')
figure()

%% dilation
%horizontal dilation with different matrix width
se_h1 = strel('line',5,0);
dilatedb_im_h1 = imdilate(b_im,se_h1);
se_h2 = strel('line',10,0);
dilatedb_im_h2 = imdilate(b_im,se_h2);
se_h3 = strel('line',15,0);
dilatedb_im_h3 = imdilate(b_im,se_h3);
se_h4 = strel('line',20,0);
dilatedb_im_h4 = imdilate(b_im,se_h4);
subplot(2,2,1),imshow(dilatedb_im_h1),title('horizontal dilation (width 5)')
subplot(2,2,2),imshow(dilatedb_im_h2),title('horizontal dilation (width 10)')
subplot(2,2,3),imshow(dilatedb_im_h3),title('horizontal dilation (width 15)')
subplot(2,2,4),imshow(dilatedb_im_h4),title('horizontal dilation (width 20)')
figure()
% vertical dilation with different matrix height
se_v1 = strel('line',5,90);
dilatedb_im_v1 = imdilate(b_im,se_v1);
se_v2 = strel('line',10,90);
dilatedb_im_v2 = imdilate(b_im,se_v2);
se_v3 = strel('line',15,90);
dilatedb_im_v3 = imdilate(b_im,se_v3);
se_v4 = strel('line',20,90);
dilatedb_im_v4 = imdilate(b_im,se_v4);
subplot(2,2,1),imshow(dilatedb_im_v1),title('vertical dilation (height 5)')
subplot(2,2,2),imshow(dilatedb_im_v2),title('vertical dilation (height 10)')
subplot(2,2,3),imshow(dilatedb_im_v3),title('vertical dilation (height 15)')
subplot(2,2,4),imshow(dilatedb_im_v4),title('vertical dilation (height 20)')
figure()
% square dilation with different width
se_s1 = strel('square',5);
dilatedb_im_s1 = imdilate(b_im,se_s1);
se_s2 = strel('square',10);
dilatedb_im_s2 = imdilate(b_im,se_s2);
se_s3 = strel('square',15);
dilatedb_im_s3 = imdilate(b_im,se_s3);
se_s4 = strel('square',20);
dilatedb_im_s4 = imdilate(b_im,se_s4);
subplot(2,2,1),imshow(dilatedb_im_s1),title('square dilation (width 5)')
subplot(2,2,2),imshow(dilatedb_im_s2),title('square dilation (width 10)')
subplot(2,2,3),imshow(dilatedb_im_s3),title('square dilation (width 15)')
subplot(2,2,4),imshow(dilatedb_im_s4),title('square dilation (width 20)')
figure()

%% opening
% horizontal opening with different matrix width
se_h1 = strel('line',5,0);
erodedb_im_h1 = imerode(b_im,se_h1);
openb_im_h1 = imdilate(erodedb_im_h1,se_h1);
se_h2 = strel('line',10,0);
erodedb_im_h2 = imerode(b_im,se_h2);
openb_im_h2 = imdilate(erodedb_im_h2,se_h2);
se_h3 = strel('line',15,0);
erodedb_im_h3 = imerode(b_im,se_h3);
openb_im_h3 = imdilate(erodedb_im_h3,se_h3);
se_h4 = strel('line',20,0);
erodedb_im_h4 = imerode(b_im,se_h4);
openb_im_h4 = imdilate(erodedb_im_h4,se_h4);
subplot(2,2,1),imshow(openb_im_h1),title('horizontal opening (width 5)')
subplot(2,2,2),imshow(openb_im_h2),title('horizontal opening (width 10)')
subplot(2,2,3),imshow(openb_im_h3),title('horizontal opening (width 15)')
subplot(2,2,4),imshow(openb_im_h4),title('horizontal opening (width 20)')
figure()

%% closing
% horizontal opening with different matrix width
se_h1 = strel('line',5,0);
dilatedb_im_h1 = imdilate(b_im,se_h1);
closeb_im_h1 = imerode(dilatedb_im_h1,se_h1);
se_h2 = strel('line',10,0);
dilatedb_im_h2 = imdilate(b_im,se_h2);
closeb_im_h2 = imerode(dilatedb_im_h2,se_h2);
se_h3 = strel('line',15,0);
dilatedb_im_h3 = imdilate(b_im,se_h3);
closeb_im_h3 = imerode(dilatedb_im_h3,se_h3);
se_h4 = strel('line',20,0);
dilatedb_im_h4 = imdilate(b_im,se_h4);
closeb_im_h4 = imerode(dilatedb_im_h4,se_h4);
subplot(2,2,1),imshow(closeb_im_h1),title('horizontal closing (width 5)')
subplot(2,2,2),imshow(closeb_im_h2),title('horizontal closing (width 10)')
subplot(2,2,3),imshow(closeb_im_h3),title('horizontal closing (width 15)')
subplot(2,2,4),imshow(closeb_im_h4),title('horizontal closing (width 20)')
