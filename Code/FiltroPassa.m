% Specify the folder where the files live.

myFolder = '/Users/sebastianozagatti/Desktop/DATASET3/BASE/DATASET3-ISTO/SA';
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
destinationFolder = '/Users/sebastianozagatti/Desktop/DATASET3/BASE/DATASET3-ISTO-PASSA2/SA';
if ~exist(destinationFolder, 'dir')
  mkdir(destinationFolder);
end
   
   LL = fft2(double(I));
   L = fftshift(LL);
   for c = 1 : 3
   [M N]=size(LL(:, :, c));
   R=2; % filter size parameter 
   X=0:N-1;
   Y=0:M-1;
   [X Y]=meshgrid(X,Y);
   Cx=0.5*N;
   Cy=0.5*M;
   
   Lo(:, :, c)=exp(-((X-Cx).^2+(Y-Cy).^2)./(2*R).^2);
   Hi(:, :, c)=1-Lo(:, :, c); % High pass filter=1-low pass filter
   % Filtered image=ifft(filter response*fft(original image))
   end
   JJ=L.*Hi;
   K = ifftshift(JJ);
 
   JJJ = ifft2(K);
   J = abs(JJJ);
   A = J(:,:,1);
   AA = J(:,:,2);
   AAA = J(:,:,3);
   
   imgNA = double(A-min(A(:))) / double(max(A(:)-min(A(:))));
   imgNAA = double(AA-min(AA(:))) / double(max(AA(:)-min(AA(:))));
   imgNAAA = double(AAA-min(AAA(:))) / double(max(AAA(:)-min(AAA(:))));
   
   img(:,:,1) = imgNA;
   img(:,:,2) = imgNAA;
   img(:,:,3) = imgNAAA;
  % J = imfilter(I, h);
  % K = wiener2(I,[5 5]);
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
 imwrite(img, fullDestinationFileName)

end

%--------------------------------------------------------------------------------------------------

myFolder = '/Users/sebastianozagatti/Desktop/DATASET3/BASE/DATASET3-ISTO/EDGE ON';

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
  
destinationFolder = '/Users/sebastianozagatti/Desktop/DATASET3/BASE/DATASET3-ISTO-PASSA2/EDGE ON';
if ~exist(destinationFolder, 'dir')
  mkdir(destinationFolder);
end
  LL = fft2(double(I));
   L = fftshift(LL);
   for c = 1 : 3
   [M N]=size(LL(:, :, c));
   R=1.5; % filter size parameter 
   X=0:N-1;
   Y=0:M-1;
   [X Y]=meshgrid(X,Y);
   Cx=0.5*N;
   Cy=0.5*M;
   
   Lo(:, :, c)=exp(-((X-Cx).^2+(Y-Cy).^2)./(2*R).^2);
   Hi(:, :, c)=1-Lo(:, :, c); % High pass filter=1-low pass filter
   % Filtered image=ifft(filter response*fft(original image))
   end
   JJ=L.*Hi;
   K = ifftshift(JJ);
   
   % K = highpass(L,0.8);
   
   JJJ = ifft2(K);
   J = abs(JJJ);
   A = J(:,:,1);
   AA = J(:,:,2);
   AAA = J(:,:,3);
   
   imgNA = double(A-min(A(:))) / double(max(A(:)-min(A(:))));
   imgNAA = double(AA-min(AA(:))) / double(max(AA(:)-min(AA(:))));
   imgNAAA = double(AAA-min(AAA(:))) / double(max(AAA(:)-min(AAA(:))));
   
   img(:,:,1) = imgNA;
   img(:,:,2) = imgNAA;
   img(:,:,3) = imgNAAA;
  % J = imfilter(I, h);
  % K = wiener2(I,[5 5]);
  % imshow(imageArray);% Display image.
  % imshow(J);
  % figure; imshow(J);
  % drawnow; % Force display to update immediately.
  % imwrite(J,strcat(fullFileName));
  
[sourceFolder, baseFileNameNoExtenstion, ext] = fileparts(fullSourceFileName);
outputBaseName = [baseFileNameNoExtenstion, '.png'];
fullDestinationFileName = fullfile(destinationFolder, outputBaseName);
imwrite(img, fullDestinationFileName)

end

%--------------------------------------------------------------------------------------------------

myFolder = '/Users/sebastianozagatti/Desktop/DATASET3/BASE/DATASET3-ISTO/ELLITTICHE';

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

destinationFolder = '/Users/sebastianozagatti/Desktop/DATASET3/BASE/DATASET3-ISTO-PASSA2/ELLITTICHE';
if ~exist(destinationFolder, 'dir')
  mkdir(destinationFolder);
end
  LL = fft2(double(I));
   L = fftshift(LL);
   for c = 1 : 3
   [M N]=size(LL(:, :, c));
   R=1.5; % filter size parameter 
   X=0:N-1;
   Y=0:M-1;
   [X Y]=meshgrid(X,Y);
   Cx=0.5*N;
   Cy=0.5*M;
   
   Lo(:, :, c)=exp(-((X-Cx).^2+(Y-Cy).^2)./(2*R).^2);
   Hi(:, :, c)=1-Lo(:, :, c); % High pass filter=1-low pass filter
   % Filtered image=ifft(filter response*fft(original image))
   end
   JJ=L.*Hi;
   K = ifftshift(JJ);
   
   % K = highpass(L,0.8);
   
   JJJ = ifft2(K);
   J = abs(JJJ);
   A = J(:,:,1);
   AA = J(:,:,2);
   AAA = J(:,:,3);
   
   imgNA = double(A-min(A(:))) / double(max(A(:)-min(A(:))));
   imgNAA = double(AA-min(AA(:))) / double(max(AA(:)-min(AA(:))));
   imgNAAA = double(AAA-min(AAA(:))) / double(max(AAA(:)-min(AAA(:))));
   
   img(:,:,1) = imgNA;
   img(:,:,2) = imgNAA;
   img(:,:,3) = imgNAAA;
  % J = imfilter(I, h);
  % K = wiener2(I,[5 5]);
  % imshow(imageArray);% Display image.
  % imshow(J);
  % figure; imshow(J);
  % drawnow; % Force display to update immediately.
  % imwrite(J,strcat(fullFileName));
  
[sourceFolder, baseFileNameNoExtenstion, ext] = fileparts(fullSourceFileName);
outputBaseName = [baseFileNameNoExtenstion, '.png'];
fullDestinationFileName = fullfile(destinationFolder, outputBaseName);
imwrite(img, fullDestinationFileName)

end

%--------------------------------------------------------------------------------------------------

myFolder = '/Users/sebastianozagatti/Desktop/DATASET3/BASE/DATASET3-ISTO/SB';

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
destinationFolder = '/Users/sebastianozagatti/Desktop/DATASET3/BASE/DATASET3-ISTO-PASSA2/SB';
if ~exist(destinationFolder, 'dir')
  mkdir(destinationFolder);
end
  LL = fft2(double(I));
   L = fftshift(LL);
   for c = 1 : 3
   [M N]=size(LL(:, :, c));
   R=1.5; % filter size parameter 
   X=0:N-1;
   Y=0:M-1;
   [X Y]=meshgrid(X,Y);
   Cx=0.5*N;
   Cy=0.5*M;
   
   Lo(:, :, c)=exp(-((X-Cx).^2+(Y-Cy).^2)./(2*R).^2);
   Hi(:, :, c)=1-Lo(:, :, c); % High pass filter=1-low pass filter
   % Filtered image=ifft(filter response*fft(original image))
   end
   JJ=L.*Hi;
   K = ifftshift(JJ);
   
   % K = highpass(L,0.8);
   
   JJJ = ifft2(K);
   J = abs(JJJ);
   A = J(:,:,1);
   AA = J(:,:,2);
   AAA = J(:,:,3);
   
   imgNA = double(A-min(A(:))) / double(max(A(:)-min(A(:))));
   imgNAA = double(AA-min(AA(:))) / double(max(AA(:)-min(AA(:))));
   imgNAAA = double(AAA-min(AAA(:))) / double(max(AAA(:)-min(AAA(:))));
   
   img(:,:,1) = imgNA;
   img(:,:,2) = imgNAA;
   img(:,:,3) = imgNAAA;
  % J = imfilter(I, h);
  % K = wiener2(I,[5 5]);
  % imshow(imageArray);% Display image.
  % imshow(J);
  % figure; imshow(J);
  % drawnow; % Force display to update immediately.
  % imwrite(J,strcat(fullFileName));
  
[sourceFolder, baseFileNameNoExtenstion, ext] = fileparts(fullSourceFileName);
outputBaseName = [baseFileNameNoExtenstion, '.png'];
fullDestinationFileName = fullfile(destinationFolder, outputBaseName);
imwrite(img, fullDestinationFileName)

end