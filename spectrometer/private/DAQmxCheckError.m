function DAQmxCheckError(lib,err_in)
% function DAQmxCheckError(lib,err)
% 
% read error code 
%	zero means no error - does nothing
%	nonzero - find out error string and generate error
% 
% inputs:
%	lib = .dll or alias (ex. 'myni')
%	err = DAQmx error
% 
% written by Nathan Tomlin (nathan.a.tomlin@gmail.com)
% v0 - 1004
% modified by Sean Garrett-Roe to give the error number, too

if err_in ~= 0 
	% find out how long the error string is
	[numerr,b] = calllib(lib,'DAQmxGetErrorString',err_in,'',0);

	% get error string	
	errstr = char([1:numerr]);	% have to pass dummy string of correct length
	[err,errstr] = calllib(lib,'DAQmxGetErrorString',err_in,errstr,numerr);

	% matlab error
	error('DAQmx error %i - %s\n',err_in,errstr)
end

