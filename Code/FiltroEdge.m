% Specify the folder where the files live.
myFolder = '/Users/sebastianozagatti/Desktop/DATASET3/BASE/DATASET3-ISTO-PASSA/SA';
% Check to make sure that folder actually exists.  Warn user if it doesn't.
if ~isdir(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end
% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(myFolder, '*.png'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  % Now do whatever you want with this file name,
  % such as reading it in as an image array with imread()
  imageArray = imread(fullFileName);
  I = imread(fullFileName);
  % figure; imshow(I);
  fullSourceFileName = fullfile(myFolder, baseFileName);
  
  
  % Create destination filename
destinationFolder = '/Users/sebastianozagatti/Desktop/DATASET3/BASE/DATASET3-ISTO-PASSA-EDGE/SA';
if ~exist(destinationFolder, 'dir')
  mkdir(destinationFolder);
end
   II=rgb2gray(I);
   J = edge(II,'Sobel');
  % K(:, :, c) = wiener2(I(:, :, c),[5 5]);
  % imshow(imageArray);% Display image.
  % imshow(J);
  % figure; imshow(J);
  % drawnow; % Force display to update immediately.
  % imwrite(J,strcat(fullFileName));
  
  % Strip off extenstion from input file
[sourceFolder, baseFileNameNoExtenstion, ext] = fileparts(fullSourceFileName);
% Create png filename.  Don't use jpeg format for image analysis!
outputBaseName = [baseFileNameNoExtenstion, '.png'];
fullDestinationFileName = fullfile(destinationFolder, outputBaseName);
% Write the png file.  This will convert whatever format you started with to the hated jpg format.
 imwrite(J, fullDestinationFileName)

end

%--------------------------------------------------------------------------------------------------

myFolder = '/Users/sebastianozagatti/Desktop/DATASET3/BASE/DATASET3-ISTO-PASSA/EDGE ON';

if ~isdir(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end

filePattern = fullfile(myFolder, '*.png'); 
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  imageArray = imread(fullFileName);
  I = imread(fullFileName);
  % figure; imshow(I);
  fullSourceFileName = fullfile(myFolder, baseFileName);
  
destinationFolder = '/Users/sebastianozagatti/Desktop/DATASET3/BASE/DATASET3-ISTO-PASSA-EDGE/EDGE ON';
if ~exist(destinationFolder, 'dir')
  mkdir(destinationFolder);
end
   II=rgb2gray(I);
   J = edge(II,'Prewitt');
  % K(:, :, c) = wiener2(I(:, :, c),[5 5]);
  % imshow(imageArray);% Display image.
  % imshow(J);
  % figure; imshow(J);
  % drawnow; % Force display to update immediately.
  % imwrite(J,strcat(fullFileName));
  
[sourceFolder, baseFileNameNoExtenstion, ext] = fileparts(fullSourceFileName);
outputBaseName = [baseFileNameNoExtenstion, '.png'];
fullDestinationFileName = fullfile(destinationFolder, outputBaseName);
imwrite(J, fullDestinationFileName)

end

%--------------------------------------------------------------------------------------------------

myFolder = '/Users/sebastianozagatti/Desktop/DATASET3/BASE/DATASET3-ISTO-PASSA/ELLITTICHE';

if ~isdir(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end

filePattern = fullfile(myFolder, '*.png'); 
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  imageArray = imread(fullFileName);
  I = imread(fullFileName);
  % figure; imshow(I);
  fullSourceFileName = fullfile(myFolder, baseFileName);

destinationFolder = '/Users/sebastianozagatti/Desktop/DATASET3/BASE/DATASET3-ISTO-PASSA-EDGE/ELLITTICHE';
if ~exist(destinationFolder, 'dir')
  mkdir(destinationFolder);
end
   II=rgb2gray(I);
   J = edge(II,'Prewitt');
  % K(:, :, c) = wiener2(I(:, :, c),[5 5]);
  % imshow(imageArray);% Display image.
  % imshow(J);
  % figure; imshow(J);
  % drawnow; % Force display to update immediately.
  % imwrite(J,strcat(fullFileName));
  
[sourceFolder, baseFileNameNoExtenstion, ext] = fileparts(fullSourceFileName);
outputBaseName = [baseFileNameNoExtenstion, '.png'];
fullDestinationFileName = fullfile(destinationFolder, outputBaseName);
imwrite(J, fullDestinationFileName)

end

%--------------------------------------------------------------------------------------------------

myFolder = '/Users/sebastianozagatti/Desktop/DATASET3/BASE/DATASET3-ISTO-PASSA/SB';

if ~isdir(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end

filePattern = fullfile(myFolder, '*.png'); 
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  % Now do whatever you want with this file name,
  % such as reading it in as an image array with imread()
  imageArray = imread(fullFileName);
  I = imread(fullFileName);
  % figure; imshow(I);
  fullSourceFileName = fullfile(myFolder, baseFileName);
destinationFolder = '/Users/sebastianozagatti/Desktop/DATASET3/BASE/DATASET3-ISTO-PASSA-EDGE/SB';
if ~exist(destinationFolder, 'dir')
  mkdir(destinationFolder);
end
   II=rgb2gray(I);
   J = edge(II,'Prewitt');
  % K(:, :, c) = wiener2(I(:, :, c),[5 5]);
  % imshow(imageArray);% Display image.
  % imshow(J);
  % figure; imshow(J);
  % drawnow; % Force display to update immediately.
  % imwrite(J,strcat(fullFileName));
  
[sourceFolder, baseFileNameNoExtenstion, ext] = fileparts(fullSourceFileName);
outputBaseName = [baseFileNameNoExtenstion, '.png'];
fullDestinationFileName = fullfile(destinationFolder, outputBaseName);
imwrite(J, fullDestinationFileName)

end