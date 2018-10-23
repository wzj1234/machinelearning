import sys
import json
print("enter data_ml_svm.py")
pythonPath = sys.argv[1]
parameters = sys.argv[2].replace('[','').replace(']','').replace(' ','').split(",")
print('parameters->',parameters)
# get all parameters
C,kernel,degree,gamma,coef0,probability,shrinking,tol,max_iter = parameters;

#transform C
try:
	C = float(C)
except ValueError:
	C = 1.0

#transform degree
try:
	degree = int(degree)
except ValueError:
	degree = 3

#transform gamma
if not gamma == "auto":
	try:
		gamma = int(gamma)
	except ValueError:
		gamma = "auto"

#transform coef0
try:
	coef0 = float(coef0)
except ValueError:
	coef0 = 0.0

#transform tol
try:
	tol = float(tol)
except ValueError:
	tol = 0.001

#transform max_iter
try:
	max_iter = int(max_iter)
except ValueError:
	max_iter = -1

#transform probability
if probability == "False":
	probability = False
else:
	probability = True

#transform shrinking
if shrinking == "False":
	shrinking = False
else:
	shrinking = True

#----------------------------------------------------------------------------
print("这些参数分别是：")
print(C,kernel,degree,gamma,coef0,probability,shrinking,tol,max_iter)
print(type(C),type(kernel),type(degree),type(gamma),type(coef0),type(probability),type(shrinking),type(tol),type(max_iter))
with open(pythonPath+'/sample_X_final.json','r') as f:
	sample=json.load(f)
# print(len(sample))
# print(len(sample[0]))
with open(pythonPath+'/stage_new.json','r') as f:
	stage=json.load(f)

n_samples = len(sample)
from sklearn import svm,metrics
from sklearn.cross_validation import train_test_split
X_train,X_test,y_train,y_test = train_test_split(sample,stage,test_size=0.3,random_state=0)
print(1)
classifier = svm.SVC(C=C,kernel=kernel,degree=degree,gamma=gamma,coef0=coef0,probability=probability,shrinking=shrinking,tol=tol,max_iter=max_iter)
classifier.fit(X_train,y_train)
print(3)

expected = y_test
predicted = classifier.predict(X_test)

accuracy=metrics.accuracy_score(expected,predicted)
print(accuracy)

# print (type(sample))
# print(type(stage))
# classifier.fit(sample[:n_samples//2],stage[:n_samples//2])      #使用两个斜杠可以得到整数结果
# expected = stage[n_samples//2:]
# predicted = classifier.predict(sample[n_samples//2:])

print("classifier report report for classifier %s:\n%s\n"%(classifier,metrics.classification_report(expected,predicted)))
# print("Confusion matrix :\n%s"%metrics.confusion_matrix(expected,predicted))