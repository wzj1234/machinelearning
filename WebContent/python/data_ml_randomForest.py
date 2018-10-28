import sys
import json
pythonPath = sys.argv[1]
parameters = sys.argv[2].replace('[','').replace(']','').replace(' ','').split(",")
# get all parameters
n_estimators, criterion, max_features, bootstrap, oob_score, n_jobs = parameters;

#transform n_estimators
try:
	n_estimators = int(n_estimators)
except ValueError:
	n_estimators = 10


#transform max_features
try:
	max_features = eval(max_features)
except NameError:
	max_features = max_features

#transform bootstrap
if bootstrap == "False":
	bootstrap = False
else:
	bootstrap = True

#transform oob_score
if oob_score == "False":
	oob_score = False
else:
	oob_score = True

#transform n_jobs
try:
	n_jobs = int(n_jobs)
except ValueError:
	n_jobs = 1

# #----------------------------------------------------------------------------
with open(pythonPath+'/sample_X_final.json','r') as f:
	sample=json.load(f)
# print(len(sample))
# print(len(sample[0]))
with open(pythonPath+'/stage_new.json','r') as f:
	stage=json.load(f)
X = sample
from sklearn import metrics,svm
from sklearn.cross_validation import train_test_split
from sklearn.ensemble import RandomForestClassifier
X_train,X_test,y_train,y_test = train_test_split(X,stage,test_size=0.3,random_state=0)

classifier = RandomForestClassifier(n_estimators=10,verbose=1)
classifier.fit(X_train,y_train)

expected = y_test
# predicted = classifier.predict(X_test_std)
predicted = classifier.predict(X_test)

accuracy = metrics.accuracy_score(expected,predicted)
print(accuracy)
print(classifier.get_params())
print(metrics.classification_report(expected,predicted))
# n_samples = len(sample)
# from sklearn import svm,metrics
# from sklearn.cross_validation import train_test_split
# X_train,X_test,y_train,y_test = train_test_split(sample,stage,test_size=0.3,random_state=0)
# print(1)
# classifier = svm.SVC(C=C,kernel=kernel,degree=degree,gamma=gamma,coef0=coef0,probability=probability,shrinking=shrinking,tol=tol,max_iter=max_iter)
# classifier.fit(X_train,y_train)
# print(3)

# expected = y_test
# predicted = classifier.predict(X_test)

# accuracy=metrics.accuracy_score(expected,predicted)
# print(accuracy)

# # print (type(sample))
# # print(type(stage))
# # classifier.fit(sample[:n_samples//2],stage[:n_samples//2])      #使用两个斜杠可以得到整数结果
# # expected = stage[n_samples//2:]
# # predicted = classifier.predict(sample[n_samples//2:])

# print("classifier report report for classifier %s:\n%s\n"%(classifier,metrics.classification_report(expected,predicted)))
# # print("Confusion matrix :\n%s"%metrics.confusion_matrix(expected,predicted))