import sys
import re
import json
#argv[1]:上传到服务器的文件
#argv[2]:python文件的目录
# print("jiaoao",sys.argv[1])

# pythonPath = sys.argv[2]
pythonPath = "E:\\Eclipse\\java\\workspace\\machinelearning\\WebContent\\python"
#读取上传的特征文件
stage = []
f=open("C:\\Users\\sang\\Desktop\\crc_rpkm_stage_information.txt")
for line in f.readlines():
	stage.append(re.split('\t|\n|\r',line))
f.close()

#删除列名
del stage[0]

for i in range(len(stage)):
	while '' in stage[i]:
		stage[i].remove('')

with open("C:\\Users\\sang\\Desktop\\patent_seq") as load_f:
	patent_seq = json.load(load_f)
print(patent_seq)
stage_new = []
for line in patent_seq:
	for item in stage:
		if item[0]==line:
			stage_new.append(item[1])
			# if item[1]=='Stage I':
			# 	stage_new.append(1)
			# elif item[1]=='Stage II':
			# 	stage_new.append(2)
			# elif item[1]=='Stage III':
			# 	stage_new.append(3)
			# elif item[1]=='Stage IV':
			# 	stage_new.append(4)
with open("C:\\Users\\sang\\Desktop\\stage_new.json",'w') as f:
	json.dump(stage_new,f)
