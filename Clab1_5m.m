clear all
close all
im = imread('urban.jpg');
theta = 30; len = 20;
fil = imrotate(ones(1, len), theta, 'bilinear');
fil = fil / sum(fil(:));
figure(2), im2 = imfilter(im, fil);

imshow(im2)
figure() 

fft_fil = fft2(double(fil),512,512);
fft_im2 = fft2(double(im2));
fft_fil_conj = conj(fft_fil);




fft_im_recover = fft_im2.*fft_fil_conj;
im_recover = ifft2(fft_im_recover);
im_recover = uint8(im_recover);
imshow(im_recover)
title('hey')



