import sys
import pickle
import re
import json
# pythonPath = "C:\\Users\\sang\\Desktop"
print("jiaoao",sys.argv[1])
pythonPath = sys.argv[1]
print(pythonPath)

feature_selection = open(pythonPath+"/feature_selection")
gene = []
for line in feature_selection.readlines():
	gene.append(line)
for i in range(len(gene)):
	gene[i] = gene[i][:-1]

sample_X = pickle.load(open(pythonPath+"/all_sample_X",'rb'))
# for i in range(10):
# 	print(sample_X[i][0])
# print("----------------------------------")
# for line in gene:
# 	print(line)

# 选取的特征gene_selected

gene_selected = []
sample_X_new = []
for i in range(len(sample_X)):
	for j in range(len(gene)):
		if gene[j] == sample_X[i][0]:
			gene_selected.append(gene[j])
			sample_X_new.append(sample_X[i])

# print("sample_X_new-->",sample_X_new)
sample_X = sample_X_new
print(len(sample_X))
print("feature_selection end")

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
# print("长度",len(sample_X_trans[0]))
# print("长度",len(sample_X_trans))
# print("gene_selected-->",gene_selected)
with open(pythonPath+'/gene_selected.json','w') as fp1:
	json.dump(gene_selected,fp1)
with open(pythonPath+'/sample_X_final.json','w') as fp2:
	json.dump(sample_X_trans,fp2)
