% segment text lines
% read image, resize, convert to binary
im = imread('text.png');
im = imresize(im,[1024,1024]);
im = rgb2gray(im);
b_im = im2bw(im,0.5);
b_im = ~b_im; %make foreground 1 and background 0

% dilate the image with a vector of width 3000
% so that the letters on the same line will connect
% to each other
se_h = strel('line',3000,0);
dilated_b_im= imdilate(b_im,se_h);
% mark each area in the image
L = bwlabel(dilated_b_im,8);
s = size(L);

% crop the image into 5 pieces using different marks
[x1f,y1f] = ind2sub(size(L),find(L==1,1,'first'));
[x1l,y1l] = ind2sub(size(L),find(L==1,1,'last'));
img1 = im(x1f:x1l,y1f:y1l);

[x2f,y2f] = ind2sub(size(L),find(L==2,1,'first'));
[x2l,y2l] = ind2sub(size(L),find(L==2,1,'last'));
img2 = im(x2f:x2l,y2f:y2l);

[x3f,y3f] = ind2sub(size(L),find(L==3,1,'first'));
[x3l,y3l] = ind2sub(size(L),find(L==3,1,'last'));
img3 = im(x3f:x3l,y3f:y3l);

[x4f,y4f] = ind2sub(size(L),find(L==4,1,'first'));
[x4l,y4l] = ind2sub(size(L),find(L==4,1,'last'));
img4 = im(x4f:x4l,y4f:y4l);

[x5f,y5f] = ind2sub(size(L),find(L==5,1,'first'));
[x5l,y5l] = ind2sub(size(L),find(L==5,1,'last'));
img5 = im(x5f:x5l,y5f:y5l);

subplot(5,1,1),imshow(img1);
subplot(5,1,2),imshow(img2);
subplot(5,1,3),imshow(img3);
subplot(5,1,4),imshow(img4);
subplot(5,1,5),imshow(img5);
