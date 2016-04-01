clear all
close all

% blur the image
im = imread('urban.jpg');
theta = 30; len = 20;
fil = imrotate(ones(1, len), theta, 'bilinear');
fil = fil / sum(fil(:));
im2 = imfilter(im, fil);
subplot(1,2,1),imshow(im2),title('before deblur'); 

% deblur the image by implementing Wiener filtering
fftfil = fft2(double(fil),512,512); % transfer both image and blurring filter to FFT domain
fftim2 = fft2(double(im2));
ffth = (conj(fftfil))./(abs(fftfil).^2+0.01); % apply Wiener filter
fftout = fftim2.*ffth;
out = ifft2(fftout);
outmin = min(min(out));
outmax = max(max(out));
subplot(1,2,2),imshow(out,[0 outmax+outmin]), title('after deblur');

figure()
wnr1 = deconvwnr(im2, fil, 0.01); % built-in Wiener filter
subplot(1,2,1),imshow(wnr1),title('built-in Wiener deblur');
subplot(1,2,2),imshow(out,[0 outmax+outmin]),title('my Wiener deblur');






