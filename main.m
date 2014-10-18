% Main for watermelon-CLI project in 2014 inventathon

clear all;
clc;
clear;

dataDir = './data';
resultsDir = 'Results';
mkdir(resultsDir);

%% baby data
inFile = fullfile(dataDir,'baby.mp4');
fprintf('Processing %s\n', inFile);
amplify_spatial_lpyr_temporal_iir(inFile, resultsDir, 10, 16, 0.4, 0.05, 0.1);

%% hand pulse visalization
inFile = fullfile(dataDir,'wrist.mp4');
fprintf('Processing %s\n', inFile);
amplify_spatial_lpyr_temporal_iir(inFile, resultsDir, 10, 16, 0.4, 0.05, 0.1);
%vidFile, resultsDir, alpha, lambda_c, r1, r2, chromAttenuation

%% hand vessele visualization
inFile = fullfile(dataDir,'wrist.mp4');
fprintf('Processing %s\n', inFile);
amplify_spatial_Gdown_temporal_ideal(inFile,resultsDir,50,4, 50/60,60/60,30, 1);

% function amplify_spatial_Gdown_temporal_ideal(vidFile,outDir,alpha,level, ...
%                      fl,fh,samplingRate, chromAttenuation)
% alpha = 50
% level = 4 %   %?
% fl = 50/60    %low frequency of filter
% fh = 60/60    % high frequency of filter
% samplingRate = 30 % frame rate
% chromAttenuation = 1
