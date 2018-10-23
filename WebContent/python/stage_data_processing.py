import sys
import re
import json
#argv[1]:上传到服务器的文件
#argv[2]:python文件的目录
print("jiaoao",sys.argv[1])

pythonPath = sys.argv[2]
#读取上传的特征文件
stage = []
f=open(sys.argv[1])
for line in f.readlines():
	stage.append(re.split('\t|\n|\r',line))
f.close()
#删除列名
del stage[0]

for i in range(len(stage)):
	while '' in stage[i]:
		stage[i].remove('')
with open(pythonPath+"/patent_seq.json") as load_f:
	patent_seq = json.load(load_f)
# print(patent_seq)
# 获取样本（患者）对应的癌症阶段，如果没有则选取第一个病人的阶段补充
stage_new = []
for line in patent_seq:
	for item in stage:
		if item[0]==line:
			stage_new.append(item[1])
			break
	else:								#如果for循环break则不会跳到else
		stage_new.append(stage[0][1])				

			# if item[1]=='Stage I':
			# 	stage_new.append(1)
			# elif item[1]=='Stage II':
			# 	stage_new.append(2)
			# elif item[1]=='Stage III':
			# 	stage_new.append(3)
			# elif item[1]=='Stage IV':
			# 	stage_new.append(4)
with open(pythonPath+"/stage_new.json",'w') as f:
	json.dump(stage_new,f)