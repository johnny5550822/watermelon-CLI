function varargout = videos_show_together(varargin)
% VIDEOS_SHOW_TOGETHER MATLAB code for videos_show_together.fig
%      VIDEOS_SHOW_TOGETHER, by itself, creates a new VIDEOS_SHOW_TOGETHER or raises the existing
%      singleton*.
%
%      H = VIDEOS_SHOW_TOGETHER returns the handle to a new VIDEOS_SHOW_TOGETHER or the handle to
%      the existing singleton*.
%
%      VIDEOS_SHOW_TOGETHER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VIDEOS_SHOW_TOGETHER.M with the given input arguments.
%
%      VIDEOS_SHOW_TOGETHER('Property','Value',...) creates a new VIDEOS_SHOW_TOGETHER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before videos_show_together_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to videos_show_together_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help videos_show_together

% Last Modified by GUIDE v2.5 18-Oct-2014 12:18:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @videos_show_together_OpeningFcn, ...
                   'gui_OutputFcn',  @videos_show_together_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before videos_show_together is made visible.
function videos_show_together_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to videos_show_together (see VARARGIN)

% Choose default command line output for videos_show_together
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes videos_show_together wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = videos_show_together_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
i=1

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

