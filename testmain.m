
% addpath(genpath('./'));
% filename='3096.jpg';
% 
% I = imread(filename);
% Ig = rgb2gray(I);
% 
% [imw imh]= size(Ig);
% imsegs = im2superpixels( I );

% imshow(I);
% figure,imshow(imsegs.segimage,[]);

% im = im2double(I);
% impad = padarray(im, [16 16 0], 'symmetric');
% imf.hog_map = pixelwise_hog31(impad,8);
% im = single(Ig);
% binSize = 8;
% padsize = binSize*3/2;
% impad = padarray(im, [padsize padsize 0], 'symmetric');
% [f, imf.densesift] = vl_dsift(impad,'size',binSize) ;

% imfts=zz_getimfeature(I);

spfts=zz_getspfeature(imfts,imsegs);