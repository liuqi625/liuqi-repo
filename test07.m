clc,clear;
addpath (genpath('./'));
fnData='../data/ijcvClassifier.mat';
fnImage='city10.jpg';
fnext='pnm';
outdir='./result';

% load classifiers
classifiers = load(fnData);
% read image
im = im2double(imread(fnImage));

% separate directory from filename
[imdir, fn] = strtok(fnImage, '/');
if isempty(fn)
    fn = fnImage;
    imdir = '.';
else
    while ~strcmp(strtok(fn, '/'), fn(2:end))
        [rem, fn] = strtok(fn, '/');
        imdir = [imdir '/' rem];
    end
    fn = fn(2:end);
end

    % compute superpixel map
    imsegs.image_name = fn;
    imsegs = APPimages2superpixels(imdir, 'pnm', imsegs);

% pg = ijcvTestImage(im, imsegs, classifiers);    

nsegments = [5 10 20 30 40 50 60 80 100];

if isempty(imsegs)
    imsegs = im2superpixels(im);
end

vclassifier = classifiers.vclassifier;
hclassifier = classifiers.hclassifier;
sclassifier = classifiers.sclassifier;

if ~exist('spdata', 'var') || isempty(spdata)
    spdata = mcmcGetSuperpixelData(im, imsegs); 
end

if ~exist('adjlist', 'var') || ~exist('edata', 'var') || isempty(adjlist) || isempty(edata)
    [edata, adjlist, perim, boundmap] = mcmcGetEdgeData(imsegs, spdata);
end    

imdata = mcmcComputeImageData(im, imsegs);
