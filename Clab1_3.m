close all
clear all
im = imread('text.png');
im = imresize(im,[1024,1024]);
im = rgb2gray(im);

theta = input('Input the rotation angle:');
% transform from degree to radian
theta = theta*pi/180;

% forward mapping
for i = 1:1024
    for j = 1:1024
       coor = [cos(theta),-sin(theta);sin(theta),cos(theta)]*[i;j];
       coor(1) = coor(1)+1025;
       im_rotate_forward(round(coor(1)),round(coor(2))) = im(i,j);
    end
end
imshow(im_rotate_forward)
im1 = imrotate(im,theta*180/pi);
subplot(1,2,1), imshow(im1), title('built-in transformation');
subplot(1,2,2), imshow(im_rotate_forward),title('forward mapping transformation');
figure()

%inverse mapping
coor = [];
b1 = 0;
b2 = 0;
b3 = 0;
b4 = 0;
rmax = 0;
rmin = 0;
cmax = 0;
cmin = 0;
% find the minimum and maximum value of position of row and column
% after transformation
for i = 1:1024
     for j = 1:1024
        b1 = rmax;
        b2 = rmin;
        b3 = cmax;
        b4 = cmin;
        a = [cos(theta),-sin(theta);sin(theta),cos(theta)]*[i;j];
        rmax = max(a(1),b1);
        rmin = min(a(1),b2);
        cmax = max(a(2),b3);
        cmin = min(a(2),b4);
    end 
end
for i = round(rmin):round(rmax)
    for j = round(cmin):round(cmax)
        coor = [cos(theta),sin(theta);-sin(theta),cos(theta)]*[i;j];
        coor = round(coor);
        ij = [i-round(rmin)+1,j-round(cmin)+1];
        if 1 <= coor && coor<=1024
            im_rotate_inverse(ij(1),ij(2)) = im(coor(1),coor(2));
        else
            im_rotate_inverse(ij(1),ij(2)) = uint8(0);
        end
    end
end
subplot(1,2,1),imshow(im_rotate_inverse), title('inverse mapping translation');
subplot(1,2,2), imshow(im1),title('built-in translation');






