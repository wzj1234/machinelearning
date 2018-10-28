import sys
import pydotplus
import json

pythonPath = sys.argv[1]
parameters = sys.argv[2].replace('[','').replace(']','').replace(' ','').split(",")
# get all parameters
criterion,splitter,max_features,max_depth,min_samples_split,min_samples_leaf,min_weight_fraction_leaf,max_leaf_nodes,presort = parameters;
#----------------------------------------------------------------------------
if max_features == "None":
	max_features = None

if max_depth == "None":
	max_depth = None
else:
	try:
		max_depth = int(max_depth)
	except ValueError:
		max_depth = None
if max_leaf_nodes == "None":
	max_leaf_nodes = None
else:
	try:
		max_leaf_nodes = int(max_leaf_nodes)
	except ValueError:
		max_leaf_nodes = None
# transfor min_samples_split's type
try:
	min_samples_split = int(min_samples_split)
except ValueError:
	min_samples_split = 2
# transfor min_samples_leaf's type
try:
	min_samples_leaf = int(min_samples_leaf)
except ValueError:
	min_samples_leaf = 1
# transfor min_weight_fraction_leaf's type
try:
	min_weight_fraction_leaf = float(min_weight_fraction_leaf)
except ValueError:
	min_weight_fraction_leaf = 0.0
#----------------------------------------------------------------------------
print("这些参数分别是：")
print(criterion,splitter)
with open(pythonPath+'/sample_X_final.json','r') as f:
	sample=json.load(f)
# print(len(sample))
# print(len(sample[0]))
with open(pythonPath+'/stage_new.json','r') as f:
	stage=json.load(f)

n_samples = len(sample)
from sklearn import tree,metrics
from sklearn.cross_validation import train_test_split
X_train,X_test,y_train,y_test = train_test_split(sample,stage,test_size=0.3,random_state=0)
print(1)
classifier = tree.DecisionTreeClassifier(criterion=criterion,splitter=splitter,max_features=max_features,max_depth=max_depth,min_samples_split=min_samples_split,min_samples_leaf=min_samples_leaf,min_weight_fraction_leaf=min_weight_fraction_leaf,max_leaf_nodes=max_leaf_nodes,presort=presort)
classifier.fit(X_train,y_train)
print(3)
#生成pdf文件
dot_data = tree.export_graphviz(classifier,out_file=None)
graph = pydotplus.graph_from_dot_data(dot_data)
graph.write_pdf(pythonPath+"/decisiontree.pdf")

expected = y_test
predicted = classifier.predict(X_test)

accuracy=metrics.accuracy_score(expected,predicted)
print(accuracy)

# print (type(sample))
# print(type(stage))
# classifier.fit(sample[:n_samples//2],stage[:n_samples//2])      #使用两个斜杠可以得到整数结果
# expected = stage[n_samples//2:]
# predicted = classifier.predict(sample[n_samples//2:])
print(classifier.get_params())
print(metrics.classification_report(expected,predicted))
# print("classifier report report for classifier %s:\n%s\n"%(classifier,metrics.classification_report(expected,predicted)))
# print("Confusion matrix :\n%s"%metrics.confusion_matrix(expected,predicted))