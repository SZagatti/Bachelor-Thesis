Dest     = '/home/user/TESI/DATASET3/BASE/Temp3/SA';
filePattern = fullfile(Dest, '*.png'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(Dest, baseFileName);
  delete(fullFileName);
end
FileList = dir(fullfile('/home/user/TESI/DATASET3/BASE/DATASET3/SA', '*.png'));
Index    = randperm(numel(FileList), 150);
for k = 1:150
  Source = fullfile('/home/user/TESI/DATASET3/BASE/DATASET3/SA', FileList(Index(k)).name);
  movefile(Source, Dest);
end

Dest     = '/home/user/TESI/DATASET3/BASE/Temp3/SB';
filePattern = fullfile(Dest, '*.png'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
    fullFileName = fullfile(Dest, baseFileName);
  delete(fullFileName);
end
FileList = dir(fullfile('/home/user/TESI/DATASET3/BASE/DATASET3/SB', '*.png'));
Index    = randperm(numel(FileList), 150);
for k = 1:150
  Source = fullfile('/home/user/TESI/DATASET3/BASE/DATASET3/SB', FileList(Index(k)).name);
  movefile(Source, Dest);
end

Dest     = '/home/user/TESI/DATASET3/BASE/Temp3/EDGE ON';
filePattern = fullfile(Dest, '*.png'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(Dest, baseFileName);
  delete(fullFileName);
end
FileList = dir(fullfile('/home/user/TESI/DATASET3/BASE/DATASET3/EDGE ON', '*.png'));
Index    = randperm(numel(FileList), 150);
for k = 1:150
  Source = fullfile('/home/user/TESI/DATASET3/BASE/DATASET3/EDGE ON', FileList(Index(k)).name);
  movefile(Source, Dest);
end
%------------------------------------------------------------------------------

DataSetPath = fullfile('/home/user/TESI/DATASET3/BASE/Temp3');
imds = imageDatastore(DataSetPath, ...
    'IncludeSubfolders',true,'LabelSource','foldernames');

labelCount = countEachLabel(imds)
img = readimage(imds,1);

numTrainFiles = 125;
[imdsTrain,imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize');
layers = [
    imageInputLayer([550 649 3]);
    
     convolution2dLayer(3,8,'Padding',1)
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,16,'Padding',1)
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,32,'Padding',1)
    batchNormalizationLayer
    reluLayer
    
     maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,64,'Padding',1)
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    fullyConnectedLayer(4)
    softmaxLayer
    classificationLayer];

options = trainingOptions('sgdm', ...
    'ExecutionEnvironment','multi-gpu', ...
    'MaxEpochs', 60, ...
    'ValidationData',imdsValidation, ...
    'ValidationFrequency',5, ...
    'Verbose',true, ...
    'Plots','training-progress');
net = trainNetwork(imdsTrain,layers,options);

YPred = classify(net,imdsValidation);
YValidation = imdsValidation.Labels;

accuracy = sum(YPred == YValidation)/numel(YValidation)

%-------------------------------------------------------------------------------

Dest     = '/home/user/TESI/DATASET3/BASE/Test3/SA';
filePattern = fullfile(Dest, '*.png'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(Dest, baseFileName);
  delete(fullFileName);
end
FileList = dir(fullfile('/home/user/TESI/DATASET3/BASE/DATASET3/SA', '*.png'));
Index    = randperm(numel(FileList), 25);
for k = 1:25
  Source = fullfile('/home/user/TESI/DATASET3/BASE/DATASET3/SA', FileList(Index(k)).name);
  movefile(Source, Dest);
end

Dest     = '/home/user/TESI/DATASET3/BASE/Test3/SB';
filePattern = fullfile(Dest, '*.png'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(Dest, baseFileName);
  delete(fullFileName);
end
FileList = dir(fullfile('/home/user/TESI/DATASET3/BASE/DATASET3/SB', '*.png'));
Index    = randperm(numel(FileList), 25);
for k = 1:25
  Source = fullfile('/home/user/TESI/DATASET3/BASE/DATASET3/SB', FileList(Index(k)).name);
  movefile(Source, Dest);
end

Dest     = '/home/user/TESI/DATASET3/BASE/Test3/EDGE ON';
filePattern = fullfile(Dest, '*.png'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(Dest, baseFileName);
  delete(fullFileName);
end
FileList = dir(fullfile('/home/user/TESI/DATASET3/BASE/DATASET3/EDGE ON', '*.png'));
Index    = randperm(numel(FileList), 25);
for k = 1:25
  Source = fullfile('/home/user/TESI/DATASET3/BASE/DATASET3/EDGE ON', FileList(Index(k)).name);
  movefile(Source, Dest);
end

CheckSet = fullfile('/home/user/TESI/DATASET3/BASE/Test3');
testimg = imageDatastore(CheckSet, ...
    'IncludeSubfolders',true,'LabelSource','foldernames');
YPred2 = classify(net,testimg);
YValidation2 = testimg.Labels;

accuracy = sum(YPred2 == YValidation2)/numel(YValidation2)

%------------------------------------------------------------------------------

Dest     = '/home/user/TESI/DATASET3/BASE/DATASET3/SA';
filePattern = fullfile(Dest, '*.png'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(Dest, baseFileName);
  delete(fullFileName);
end
FileList = dir(fullfile('/home/user/TESI/DATASET3/BASE/Temp3/SA', '*.png'));
Index    = randperm(numel(FileList), 150);
for k = 1:150
  Source = fullfile('/home/user/TESI/DATASET3/BASE/Temp3/SA', FileList(Index(k)).name);
  movefile(Source, Dest);
end

Dest     = '/home/user/TESI/DATASET3/BASE/DATASET3/SB';
filePattern = fullfile(Dest, '*.png'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(Dest, baseFileName);
  delete(fullFileName);
end
FileList = dir(fullfile('/home/user/TESI/DATASET3/BASE/Temp3/SB', '*.png'));
Index    = randperm(numel(FileList), 150);
for k = 1:150
  Source = fullfile('/home/user/TESI/DATASET3/BASE/Temp3/SB', FileList(Index(k)).name);
  movefile(Source, Dest);
end

Dest     = '/home/user/TESI/DATASET3/BASE/DATASET3/EDGE ON';
filePattern = fullfile(Dest, '*.png'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(Dest, baseFileName);
  delete(fullFileName);
end
FileList = dir(fullfile('/home/user/TESI/DATASET3/BASE/Temp3/EDGE ON', '*.png'));
Index    = randperm(numel(FileList), 150);
for k = 1:150
  Source = fullfile('/home/user/TESI/DATASET3/BASE/Temp3/EDGE ON', FileList(Index(k)).name);
  movefile(Source, Dest);
end

Dest     = '/home/user/TESI/DATASET3/BASE/DATASET3/EDGE ON';
filePattern = fullfile(Dest, '*.png'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(Dest, baseFileName);
  delete(fullFileName);
end
FileList = dir(fullfile('/home/user/TESI/DATASET3/BASE/Test3/EDGE ON', '*.png'));
Index    = randperm(numel(FileList), 25);
for k = 1:25
  Source = fullfile('/home/user/TESI/DATASET3/BASE/Test3/EDGE ON', FileList(Index(k)).name);
  movefile(Source, Dest);
end

Dest     = '/home/user/TESI/DATASET3/BASE/DATASET3/SA';
filePattern = fullfile(Dest, '*.png'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(Dest, baseFileName);
  delete(fullFileName);
end
FileList = dir(fullfile('/home/user/TESI/DATASET3/BASE/Test3/SA', '*.png'));
Index    = randperm(numel(FileList), 25);
for k = 1:25
  Source = fullfile('/home/user/TESI/DATASET3/BASE/Test3/SA', FileList(Index(k)).name);
  movefile(Source, Dest);
end

Dest     = '/home/user/TESI/DATASET3/BASE/DATASET3/SB';
filePattern = fullfile(Dest, '*.png'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(Dest, baseFileName);
  delete(fullFileName);
end
FileList = dir(fullfile('/home/user/TESI/DATASET3/BASE/Test3/SB', '*.png'));
Index    = randperm(numel(FileList), 25);
for k = 1:25
  Source = fullfile('/home/user/TESI/DATASET3/BASE/Test3/SB', FileList(Index(k)).name);
  movefile(Source, Dest);
end