Dest     = '/home/user/TESI/Temp/SA';
filePattern = fullfile(Dest, '*.png'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(Dest, baseFileName);
  fprintf(1, 'Now deleting %s\n', fullFileName);
  delete(fullFileName);
end
FileList = dir(fullfile('/home/user/TESI/DATASET1/SA', '*.png'));
Index    = randperm(numel(FileList), 150);
for k = 1:150
  Source = fullfile('/home/user/TESI/DATASET1/SA', FileList(Index(k)).name);
  copyfile(Source, Dest);
end

Dest     = '/home/user/TESI/Temp/SAB';
filePattern = fullfile(Dest, '*.png'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(Dest, baseFileName);
  fprintf(1, 'Now deleting %s\n', fullFileName);
  delete(fullFileName);
end
FileList = dir(fullfile('/home/user/TESI/DATASET1/SAB', '*.png'));
Index    = randperm(numel(FileList), 150);
for k = 1:150
  Source = fullfile('/home/user/TESI/DATASET1/SAB', FileList(Index(k)).name);
  copyfile(Source, Dest);
end

Dest     = '/home/user/TESI/Temp/SB';
filePattern = fullfile(Dest, '*.png'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(Dest, baseFileName);
  fprintf(1, 'Now deleting %s\n', fullFileName);
  delete(fullFileName);
end
FileList = dir(fullfile('/home/user/TESI/DATASET1/SB', '*.png'));
Index    = randperm(numel(FileList), 150);
for k = 1:150
  Source = fullfile('/home/user/TESI/DATASET1/SB', FileList(Index(k)).name);
  copyfile(Source, Dest);
end

Dest     = '/home/user/TESI/Temp/ELLITTICHE';
filePattern = fullfile(Dest, '*.png'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(Dest, baseFileName);
  fprintf(1, 'Now deleting %s\n', fullFileName);
  delete(fullFileName);
end
FileList = dir(fullfile('/home/user/TESI/DATASET1/ELLITTICHE', '*.png'));
Index    = randperm(numel(FileList), 150);
for k = 1:150
  Source = fullfile('/home/user/TESI/DATASET1/ELLITTICHE', FileList(Index(k)).name);
  copyfile(Source, Dest);
end

Dest     = '/home/user/TESI/Temp/EDGE ON';
filePattern = fullfile(Dest, '*.png'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(Dest, baseFileName);
  fprintf(1, 'Now deleting %s\n', fullFileName);
  delete(fullFileName);
end
FileList = dir(fullfile('/home/user/TESI/DATASET1/EDGE ON', '*.png'));
Index    = randperm(numel(FileList), 150);
for k = 1:150
  Source = fullfile('/home/user/TESI/DATASET1/EDGE ON', FileList(Index(k)).name);
  copyfile(Source, Dest);
end
%------------------------------------------------------------------------------

DataSetPath = fullfile('/home/user/TESI/Temp');
imds = imageDatastore(DataSetPath, ...
    'IncludeSubfolders',true,'LabelSource','foldernames');

labelCount = countEachLabel(imds)
img = readimage(imds,1);

numTrainFiles = 125;
[imdsTrain,imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize');
layers = [
    imageInputLayer([550 649 3])
    
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
    
    fullyConnectedLayer(5)
    softmaxLayer
    classificationLayer];

options = trainingOptions('sgdm', ...
    'ExecutionEnvironment','multi-gpu', ...
    'MaxEpochs',20, ...
    'ValidationData',imdsValidation, ...
    'ValidationFrequency',25, ...
    'Verbose',false, ...
    'Plots','training-progress');
net = trainNetwork(imdsTrain,layers,options);

YPred = classify(net,imdsValidation);
YValidation = imdsValidation.Labels;

accuracy = sum(YPred == YValidation)/numel(YValidation)