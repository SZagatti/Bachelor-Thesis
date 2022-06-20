for i = 1:1
Dest     = '/Users/sebastianozagatti/Desktop/DATASET3/BASE/Temp2/SA';
filePattern = fullfile(Dest, '*.png'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(Dest, baseFileName);
  delete(fullFileName);
end
FileList = dir(fullfile('/Users/sebastianozagatti/Desktop/DATASET3/BASE/DATASET3/SA', '*.png'));
Index    = randperm(numel(FileList), 150);
for k = 1:150
  Source = fullfile('/Users/sebastianozagatti/Desktop/DATASET3/BASE/DATASET3/SA', FileList(Index(k)).name);
  copyfile(Source, Dest);
end

Dest     = '/Users/sebastianozagatti/Desktop/DATASET3/BASE/Temp2/SB';
filePattern = fullfile(Dest, '*.png'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(Dest, baseFileName);
  delete(fullFileName);
end
FileList = dir(fullfile('/Users/sebastianozagatti/Desktop/DATASET3/BASE/DATASET3/SB', '*.png'));
Index    = randperm(numel(FileList), 150);
for k = 1:150
  Source = fullfile('/Users/sebastianozagatti/Desktop/DATASET3/BASE/DATASET3/SB', FileList(Index(k)).name);
  copyfile(Source, Dest);
end

Dest     = '/Users/sebastianozagatti/Desktop/DATASET3/BASE/Temp2/EDGE ON';
filePattern = fullfile(Dest, '*.png'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(Dest, baseFileName);
  delete(fullFileName);
end
FileList = dir(fullfile('/Users/sebastianozagatti/Desktop/DATASET3/BASE/DATASET3/EDGE ON', '*.png'));
Index    = randperm(numel(FileList), 150);
for k = 1:150
  Source = fullfile('/Users/sebastianozagatti/Desktop/DATASET3/BASE/DATASET3/EDGE ON', FileList(Index(k)).name);
  copyfile(Source, Dest);
end

Dest     = '/Users/sebastianozagatti/Desktop/DATASET3/BASE/Temp2/ELLITTICHE';
filePattern = fullfile(Dest, '*.png'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(Dest, baseFileName);
  delete(fullFileName);
end
FileList = dir(fullfile('/Users/sebastianozagatti/Desktop/DATASET3/BASE/DATASET3/ELLITTICHE', '*.png'));
Index    = randperm(numel(FileList), 150);
for k = 1:150
  Source = fullfile('/Users/sebastianozagatti/Desktop/DATASET3/BASE/DATASET3/ELLITTICHE', FileList(Index(k)).name);
  copyfile(Source, Dest);
end

%------------------------------------------------------------------------------

DataSetPath = fullfile('/Users/sebastianozagatti/Desktop/DATASET3/BASE/Temp2');
imds = imageDatastore(DataSetPath, ...
    'IncludeSubfolders',true,'LabelSource','foldernames');

labelCount = countEachLabel(imds)
img = readimage(imds,1);

numTrainFiles = 125;
[imdsTrain,imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize');
layers = [
    imageInputLayer([550 649 3]);
    
    convolution2dLayer(3,32,'Padding',1)
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    fullyConnectedLayer(4)
    softmaxLayer
    classificationLayer];

options = trainingOptions('sgdm', ...
     'MaxEpochs', 35, ...
     'ValidationData',imdsValidation, ...
     'ValidationFrequency',5, ...
     'MiniBatchSize', 100, ...
     'Plots','training-progress', ...
     'Verbose',true );
net = trainNetwork(imdsTrain,layers,options);

%'Plots','training-progress'
% 'ExecutionEnvironment','multi-gpu', ...

YPred = classify(net,imdsValidation);
YValidation = imdsValidation.Labels;

accuracy1 = sum(YPred == YValidation)/numel(YValidation)
end