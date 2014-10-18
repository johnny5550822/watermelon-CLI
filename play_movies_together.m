%% GUI function to play two movies together; reference from videoCustomGUI Example
function play_movies_together(movie1_title,movie2_title,dir)

%%
% Initialize the video reader.
t_file = strcat(dir,movie1_title);
t_file2 = strcat(dir,movie2_title);
videoSrc = vision.VideoFileReader(t_file, 'ImageColorSpace', 'Intensity');
videoSrc2 = vision.VideoFileReader(t_file2, 'ImageColorSpace', 'Intensity');



%% 
% Create a figure window and two axes to display the input video and the
% processed video.
[hFig, hAxes] = createFigureAndAxes();

%%
% Add buttons to control video playback.
insertButtons(hFig, hAxes, videoSrc, videoSrc2);

%% Result of Pressing the Start Button
% Now that the GUI is constructed, we trigger the play callback which
% contains the main video processing loop defined in the
% |getAndProcessFrame| function listed below. If you prefer to click on the
% |Start| button yourself, you can comment out the following line of code.
playCallback(findobj('tag','PBButton123'),[],videoSrc,videoSrc2,hAxes);

%%
% Note that each video frame is centered in the axis box. If the axis size
% is bigger than the frame size, video frame borders are padded with
% background color. If axis size is smaller than the frame size scroll bars
% are added.

%% Create Figure, Axes, Titles
% Create a figure window and two axes with titles to display two videos.
    function [hFig, hAxes] = createFigureAndAxes()

        % Close figure opened by last run
        figTag = 'CVST_VideoOnAxis_9804532';
        close(findobj('tag',figTag));
        
        % center screen in the center
        screensize = get(0,'ScreenSize');
        sz = [screensize(4)-100 screensize(3)-100]; %figure size
        xpos = ceil((screensize(3)-sz(2))/2); 
        ypos = ceil((screensize(4)-sz(1))/2);


        % Create new figure
        hFig = figure('numbertitle', 'off', ...
               'name', 'Video In Custom GUI', ...
               'menubar','none', ...
               'toolbar','none', ...
               'resize', 'on', ...
               'tag',figTag, ...
               'renderer','painters', ...
               'position',[xpos, ypos, sz(2), sz(1)]);

        % Create axes and titles
        hAxes.axis1 = createPanelAxisTitle(hFig,[0.1 0.2 0.36 0.6],'Original Video');%[X Y W H]
        hAxes.axis2 = createPanelAxisTitle(hFig,[0.5 0.2 0.36 0.6],'Rotated Video');
    end

%% Create Axis and Title
% Axis is created on uipanel container object. This allows more control
% over the layout of the GUI. Video title is created using uicontrol.
    function hAxis = createPanelAxisTitle(hFig, pos, axisTitle)

        % Create panel
        hPanel = uipanel('parent',hFig,'Position',pos,'Units','Normalized');

        % Create axis   
        hAxis = axes('position',[0 0 1 1],'Parent',hPanel); 
        set(hAxis,'xtick',[],'ytick',[],'xcolor',[1 1 1],'ycolor',[1 1 1]);

        % Set video title using uicontrol. uicontrol is used so that text
        % can be positioned in the context of the figure, not the axis.
        titlePos = [pos(1)+0.02 pos(2)+pos(3)+0.3 0.3 0.07];
        uicontrol('style','text',...
            'String', axisTitle,...
            'Units','Normalized',...
            'Parent',hFig,'Position', titlePos,...
            'BackgroundColor',get(hFig,'Color'));
    end

%% Insert Buttons
% Insert buttons to play, pause the videos.
    function insertButtons(hFig,hAxes,videoSrc, videoSrc2)

        % Play button with text Start/Pause/Continue
        uicontrol(hFig,'unit','pixel','style','pushbutton','string','Start',...
                'position',[10 10 75 25], 'tag','PBButton123','callback',...
                {@playCallback,videoSrc,videoSrc2,hAxes});

        % Exit button with text Exit
        uicontrol(hFig,'unit','pixel','style','pushbutton','string','Exit',...
                'position',[100 10 50 25],'callback', ...
                {@exitCallback,videoSrc,videoSrc2,hFig});
    end     

%% Play Button Callback
% This callback function rotates input video frame and displays original
% input video frame and rotated frame on axes. The function
% |showFrameOnAxis| is responsible for displaying a frame of the video on
% user-defined axis. This function is defined in the file
% <matlab:edit(fullfile(matlabroot,'toolbox','vision','visiondemos','showFrameOnAxis.m')) showFrameOnAxis.m>
    function playCallback(hObject,~,videoSrc,videoSrc2,hAxes)
       try
            % Check the status of play button
            isTextStart = strcmp(get(hObject,'string'),'Start');
            isTextCont  = strcmp(get(hObject,'string'),'Continue');
            if isTextStart
               % Two cases: (1) starting first time, or (2) restarting 
               % Start from first frame
               if isDone(videoSrc)
                  reset(videoSrc);
                  reset(videoSrc2);
               end
            end
            if (isTextStart || isTextCont)
                set(hObject,'string','Pause');
            else
                set(hObject,'string','Continue');
            end

            % Rotate input video frame and display original and rotated
            % frames on figure
            angle = 0;            
            while strcmp(get(hObject,'string'),'Pause') && ~isDone(videoSrc) && ~isDone(videoSrc2)   
                % Get input video frame and rotated frame
                [frame,angle] = getAndProcessFrame(videoSrc,angle); 
                [frame2,angle] = getAndProcessFrame(videoSrc2,angle);
                % Display input video frame on axis
                showFrameOnAxis(hAxes.axis1, frame);
                % Display rotated video frame on axis
                % showFrameOnAxis(hAxes.axis2, rotatedImg); 
                showFrameOnAxis(hAxes.axis2, frame2);   
            end

            % When video reaches the end of file, display "Start" on the
            % play button.
            if isDone(videoSrc) && isDone(videoSrc2)
               set(hObject,'string','Start');
            end
       catch ME
           % Re-throw error message if it is not related to invalid handle 
           if ~strcmp(ME.identifier, 'MATLAB:class:InvalidHandle')
               rethrow(ME);
           end
       end
    end

%% Video Processing: Just read the image
% This function defines the main algorithm that is invoked when play button
% is activated.
    function [frame,angle] = getAndProcessFrame(videoSrc,angle)
        
        % Read input video frame
        frame = step(videoSrc);
        
        % Apply any other preprocessing, for example, rotation
%         paddedFrame = padarray(frame, [30 30], 0, 'both');
%         rotatedImg  = imrotate(paddedFrame, angle, 'bilinear', 'crop');
%         angle       = angle + 1;
    end

%% Exit Button Callback
% This callback function releases system objects and closes figure window.
    function exitCallback(~,~,videoSrc,videoSrc2,hFig)
        
        % Close the video file
        release(videoSrc); 
        release(videoSrc2);
        % Close the figure window
        close(hFig);
    end

displayEndOfDemoMessage(mfilename)

end
