#!usr/bin/python
import sys
import re
import json
import pickle
#argv[1]:上传到服务器的文件
#argv[2]:python文件的目录

pythonPath = "C:\\Users\\sang\\Desktop\\新建文件夹"
#读取上传的特征文件
f=open("C:\\Users\\sang\\Desktop\\crc_rpkm_mutGene_sample_stage.txt","r")
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

with open(pythonPath+'\patent_seq','w') as fp:
	json.dump(sample_X[0],fp)
del sample_X[0]


for i in range(len(sample_X)):
	for j in range(1,len(sample_X[i])):
		sample_X[i][j]=float(sample_X[i][j])
all_gene = {}
for i in range(len(sample_X)):
	all_gene[sample_X[i][0]] = max(sample_X[i][1:])
with open(pythonPath+'\\all_gene','w') as fp:
	json.dump(all_gene,fp)

# out = open(pythonPath+'\gene_selection','rb')
# gene = pickle.load(out)

# with open(pythonPath+'\gene_selection','r') as fp:
# 	gene=json.load(fp)
# print("gene-->"+gene)

# 选取的特征gene_selected
# gene_selected = []
# sample_X_new = []
# for i in range(len(sample_X)):
# 	for j in range(len(gene)):
# 		if gene[j] == sample_X[i][0]:
# 			gene_selected.append(gene[j])
# 			sample_X_new.append(sample_X[i])

# print("sample_X_new-->",len(sample_X_new))
# sample_X = sample_X_new
# print(len(sample_X))

for i in range(len(sample_X)):
	del sample_X[i][0]


#一刀切
# sample_X_new = []
# gene_selected_new = []
# for i in range(len(sample_X)):
# 	if max(sample_X[i]) > 20:
# 		gene_selected_new.append(gene_selected[i])
# 		sample_X_new.append(sample_X[i])
# gene_selected = gene_selected_new
# sample_X = sample_X_new
# print("haha-->",len(sample_X))

sample_X_trans=list(map(list,zip(*sample_X)))
# print ('len of sample_X-->',len(sample_X))
# print ('len of sample_X_trans',len(sample_X_trans))

# out=open(pythonPath+'\sample_X_final','wb')
# pickle.dump(sample_X_trans,out)
# out.close()

# print("长度",len(gene_selected))
print("长度",len(sample_X_trans[0]))
# with open(pythonPath+'\gene_selected','w') as fp:
# 	json.dump(gene_selected,fp)
with open(pythonPath+'\sample_X_final','w') as fp:
	json.dump(sample_X_trans,fp)