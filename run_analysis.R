path<-paste(getwd(),"/UCI HAR Dataset",sep="")
testpath<-paste(path,"/test",sep="")
trainpath<-paste(path,"/train",sep="")
featurepath<-paste(path,"/features.txt",sep="")
actlabelspath<-paste(path,"/features.txt",sep="")

features<-read.table(paste(path,"/features.txt",sep=""),colClasses=c("character"))
actlabels<-read.table(paste(path,"/activity_labels.txt",sep=""),col.names=c("ActivityId","Activity"))
testsub<-read.table(paste(testpath,"/subject_test.txt",sep=""))
testx<-read.table(paste(testpath,"/X_test.txt",sep=""))
testy<-read.table(paste(testpath,"/y_test.txt",sep=""))
trainsub<-read.table(paste(trainpath,"/subject_train.txt",sep=""))
trainx<-read.table(paste(trainpath,"/X_train.txt",sep=""))
trainy<-read.table(paste(trainpath,"/y_train.txt",sep=""))

##Merges the training and the test sets to create one data set.
test<-cbind(cbind(testx,testsub),testy)
train<-cbind(cbind(trainx,trainsub),trainy)
cdata<-rbind(train,test)

labels<-rbind(rbind(features, c(562, "Subject")), c(563, "ActivityId"))[,2]
names(cdata) <- labels

##Extracts only the measurements on the mean and standard deviation for each measurement. 

mean_std <- cdata[,grepl("mean|std|Subject|ActivityId", names(cdata))]

##Uses descriptive activity names to name the activities in the data set

mean_std <- join(mean_std,actlabels, by = "ActivityId", match = "first")
mean_std <- mean_std[,-1]

##Appropriately labels the data set with descriptive names.

names(mean_std) <- gsub('\\(|\\)',"",names(mean_std), perl = TRUE)
names(mean_std)  <- make.names(names(mean_std))

names(mean_std)  <- gsub('Acc',"Acceleration",names(mean_std))
names(mean_std)  <- gsub('GyroJerk',"AngularAcceleration",names(mean_std))
names(mean_std)  <- gsub('Gyro',"AngularSpeed",names(mean_std))
names(mean_std)  <- gsub('Mag',"Magnitude",names(mean_std))
names(mean_std)  <- gsub('^t',"TimeDomain.",names(mean_std))
names(mean_std)  <- gsub('^f',"FrequencyDomain.",names(mean_std))
names(mean_std)  <- gsub('\\.mean',".Mean",names(mean_std))
names(mean_std)  <- gsub('\\.std',".StandardDeviation",names(mean_std))
names(mean_std)  <- gsub('Freq\\.',"Frequency.",names(mean_std))
names(mean_std)  <- gsub('Freq$',"Frequency",names(mean_std))

##Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
avg_by_act_sub = ddply(mean_std, c("Subject","Activity"), numcolwise(mean))
write.table(avg_by_act_sub, file = "data_avg_by_act_sub.txt", row.name=FALSE)








