%% Main for watermelon-CLI project in 2014 inventathon

%Goal: to implement an instance view to change several parametrs of
%Eulerian Video Magnification so that a better cantrol of parameters optimziation can be obtained.
% Paramerters:
% - Amplification
% - low cut-off
% - high cut-off
%%

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
clc;
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
%% #######################Beginning of the view
%%

clear all;
clc;
clear;

dataDir = './data';
resultsDir = 'Results';
%mkdir(resultsDir);
startIndex = 1;

% open the file
vid = fullfile(dataDir,'baby.mp4');
fprintf('Processing %s\n', vid);

% Get the videos info
vid = VideoReader(vid)
fr = vid.FrameRate; %30 frame per second
len = vid.NumberOfFrames;   %301 frames

%%
% Play the GUI
clc;
movie1_title = 'baby.mp4';
movie2_title = 'baby-iir-r1-0.4-r2-0.05-alpha-10-lambda_c-16-chromAtn-0.1.avi';
m1_heading = 'Original';
m2_heading = 'Eulerian';
dir = 'C:/Users/King Chung Ho/Dropbox/ucla inventathon/2014/code/data/';

%Get movie info before playing it
vid = fullfile(dataDir,'baby.mp4');
vid = VideoReader(vid)
fr = vid.FrameRate %30 frame per second

% Play the movies
play_movies_together(movie1_title,movie2_title,m1_heading,m2_heading,dir,fr);

%%

