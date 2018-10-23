#!usr/bin/python
import sys
import re
import json
import pickle
#argv[1]:上传到服务器的文件
#argv[2]:python文件的目录
print("jiaoao",sys.argv[1])

pythonPath = sys.argv[2]
#读取上传的特征文件
f=open(sys.argv[1])
sample_X=[]
for line in f.readlines():
	sample_X.append(re.split('\t|\r|\n',line))
for item in sample_X:
	while '' in item:
		item.remove('')
f.close()


patent_seq=sample_X[0]
del patent_seq[0]
for i in range(len(patent_seq)):
	patent_seq[i]=patent_seq[i][:-3]

# out=open(pythonPath+'\patent_seq','wb')
# pickle.dump(sample_X[0],out)
# out.close()

#使用json进行序列化可以实现语言之间的交互

with open(pythonPath+'/patent_seq.json','w') as fp:
	json.dump(sample_X[0],fp)
del sample_X[0]


for i in range(len(sample_X)):
	for j in range(1,len(sample_X[i])):
		sample_X[i][j]=float(sample_X[i][j])
all_gene = {}
for i in range(len(sample_X)):
	all_gene[sample_X[i][0]] = max(sample_X[i][1:])
with open(pythonPath+'/all_gene.json','w') as fp:
	json.dump(all_gene,fp,indent=0,sort_keys=True)

out = open(pythonPath+"/all_sample_X",'wb')
pickle.dump(sample_X,out)


# with open(pythonPath+'\gene_selection','r') as fp:
# 	gene=json.load(fp)
# print("gene-->"+gene)

